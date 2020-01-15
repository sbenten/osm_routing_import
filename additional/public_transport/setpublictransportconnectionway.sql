CREATE FUNCTION setpublictransportconnectionway(way_id integer, source_geom public.geometry, target_geom public.geometry) RETURNS void
    LANGUAGE plpgsql
    AS $$
/*
Creates records in an interim table for connections between public transport services.
Limited to the morning and evening rush hours for the initial study.

PARAMS
n/a

RETURNS void
*/	
DECLARE
source bigint;
target bigint;

walk_cost double precision;
walk_reverse_cost double precision;
walk_cost_time double precision;
walk_reverse_cost_time double precision;
walk_cost_met double precision;
walk_reverse_cost_met double precision;
walk_length_m double precision;
walk_total_ascent double precision;
walk_total_descent double precision;
walk_curve_index double precision;
walk_speed smallint;
walk_terrain_index double precision;
walk_geom geometry(LineString, 27700);

walk_start_altitude double precision;
walk_end_altitude double precision;
BEGIN

	BEGIN 
		--Stop location should exactly match one of the nodes from the network 
		SELECT v.id INTO source
		FROM ways_clean_vertices_pgr v
		WHERE ST_Equals(source_geom, v.the_geom);

		SELECT v.id INTO target
		FROM ways_clean_vertices_pgr v
		WHERE ST_Equals(target_geom, v.the_geom);

		--However, if the the network consists of nodes created with too coarse a geographical distance
		--they may not overlap, so look for one close by
		/*IF source IS NULL THEN
			SELECT v.id INTO source
			FROM ways_clean_vertices_pgr v
			WHERE ST_DWithin(source_geom, v.the_geom, 0.1);
		END IF;

		IF target IS NULL THEN
			SELECT v.id INTO target
			FROM ways_clean_vertices_pgr v
			WHERE ST_DWithin(target_geom, v.the_geom, 0.1);
		END IF;*/
		--RAISE NOTICE 'Source: % ; Target: %', source, target;

	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'NODE SELECTION ERROR % %', SQLERRM, SQLSTATE;
	END;

	BEGIN			
		SELECT 
			sum(x.walk_cost),
			sum(x.walk_reverse_cost),
			sum(x.walk_cost_time),
			sum(x.walk_reverse_cost_time),
			sum(x.walk_cost_met),
			sum(x.walk_reverse_cost_met),
			sum(x.length_m),
			sum(x.totalascent),
			sum(x.totaldescent),
			getwaycurveindex(ST_MakeLine(x.geom)), --recalculate the curviness of the road, rather than take an average
			sum(x.length_m*x.walk_speed)/sum(x.length_m), --Rather than just an average woprk out the proportion of the network allocated to each speed and use this as an average
			avg(x.terrain_index), --TODO You would hope all connections between PT are good, take an average for now
			ST_LineMerge( ST_Collect(x.geom))
			--ST_MakeLine(x.geom) 

			INTO 
			walk_cost, 
			walk_reverse_cost, 
			walk_cost_time,
			walk_reverse_cost_time,
			walk_cost_met,
			walk_reverse_cost_met,
			walk_length_m,
			walk_total_ascent,
			walk_total_descent,
			walk_curve_index,
			walk_speed,
			walk_terrain_index,
			walk_geom
		FROM (
			SELECT 
				trsp.seq,
				w.walk_cost,
				w.walk_reverse_cost,
				w.walk_cost_time,
				w.walk_reverse_cost_time,
				w.walk_cost_met,
				w.walk_reverse_cost_met,
				w.length_m,
				w.startaltitude,
				w.endaltitude,
				w.totalascent,
				w.totaldescent,
				w.curve_index,
				w.walk_speed,
				w.terrain_index,
				w.geom
			FROM pgr_trsp(
				'SELECT id, source, target, walk_cost AS cost, walk_reverse_cost AS reverse_cost FROM ways_clean WHERE walk_allow = true',
				source :: int4, target :: int4,
				true, true
			) AS trsp
			LEFT JOIN ways_clean w ON trsp.id2 = w.id
		) x;

		--Now perform the main update
		UPDATE public_transport_route_connections SET
			cost = walk_cost,
			reverse_cost = walk_reverse_cost,
			cost_time = walk_cost_time,
			reverse_cost_time = walk_reverse_cost_time,
			cost_met = walk_cost_met,
			reverse_cost_met = walk_reverse_cost_met,
			length_m = walk_length_m,
			totalascent = walk_total_ascent,
			totaldescent = walk_total_descent,
			curveindex = walk_curve_index,
			speed = walk_speed,
			terrain_index = walk_terrain_index,
			geom = walk_geom
		WHERE public_transport_route_connections.id = way_id;

		--Get and set the altitude information for our new route
		--Note: Doing this seperately as the start and end altitudes have to be found first
		--The direction the way was routed means the start and end of a way does not match the start and end of the bus route...
		SELECT ST_Value(r.rast, (SELECT ST_StartPoint(geom) FROM public_transport_route_connections WHERE id = way_id))
		INTO walk_start_altitude
		FROM terrain.dtm r
		WHERE r.rid = (
			SELECT r.rid FROM terrain.dtm_extent r 
			WHERE ST_Contains(r.geom, (SELECT ST_StartPoint(geom) FROM public_transport_route_connections WHERE id = way_id))
		); 

		SELECT ST_Value(r.rast, (SELECT ST_EndPoint(geom) FROM public_transport_route_connections WHERE id = way_id))
		INTO walk_end_altitude
		FROM terrain.dtm r
		WHERE r.rid = (
			SELECT r.rid FROM terrain.dtm_extent r 
			WHERE ST_Contains(r.geom, (SELECT ST_EndPoint(geom) FROM public_transport_route_connections WHERE id = way_id))
		);

		UPDATE public_transport_route_connections SET
			startaltitude = walk_start_altitude,
			endaltitude = walk_end_altitude,
			angleslope = getAngleOfSlope((walk_end_altitude - walk_start_altitude), walk_length_m),
			reverseangleslope = getAngleOfSlope((walk_start_altitude - walk_end_altitude), walk_length_m),
			percentslope = getPercentSlope((walk_end_altitude - walk_start_altitude), walk_length_m),
			reversepercentslope = getPercentSlope((walk_start_altitude - walk_end_altitude), walk_length_m)
		WHERE id = way_id;
		
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'ROUTING ERROR % %', SQLERRM, SQLSTATE;
	END;
END
$$;


ALTER FUNCTION setpublictransportconnectionway(way_id integer, source_geom public.geometry, target_geom public.geometry) OWNER TO postgres;
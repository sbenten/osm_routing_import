CREATE FUNCTION setpublictransportbusway(way_id integer, source_geom public.geometry, target_geom public.geometry) RETURNS void
    LANGUAGE plpgsql
    AS $$
/*
Calculate the geometry and costs between two given public transport stops.
BUS ONLY.
Updates the given record with calculated details. 

PARAMS
way_id	public_transport_route_ways.id	The unique identifier for the path between two public transport stops.
source_geom	point						The source transport stop.
target_geom	point						The target transport stop.

RETURNS void
*/
DECLARE
source bigint;
target bigint;

bus_cost double precision;
bus_reverse_cost double precision;
bus_cost_time double precision;
bus_reverse_cost_time double precision;
bus_cost_met double precision;
bus_reverse_cost_met double precision;
bus_length_m double precision;
bus_total_ascent double precision;
bus_total_descent double precision;
bus_curve_index double precision;
bus_speed smallint;
bus_terrain_index double precision;
bus_geom geometry(LineString, 27700);

bus_start_altitude double precision;
bus_end_altitude double precision;
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
			sum(x.bus_cost),
			sum(x.bus_reverse_cost),
			sum(x.bus_cost_time),
			sum(x.bus_reverse_cost_time),
			sum(x.bus_cost_met),
			sum(x.bus_reverse_cost_met),
			sum(x.length_m),
			sum(x.totalascent),
			sum(x.totaldescent),
			getwaycurveindex(ST_MakeLine(x.geom)), --recalculate the curviness of the road, rather than take an average
			sum(x.length_m*x.bus_speed)/sum(x.length_m), --Rather than just an average woprk out the proportion of the network allocated to each speed and use this as an average
			avg(x.terrain_index), --You would hope all roads travelled by PT are good, jucst take an average
			ST_LineMerge( ST_Collect(x.geom))
			--ST_MakeLine(x.geom) 

			INTO 
			bus_cost, 
			bus_reverse_cost, 
			bus_cost_time,
			bus_reverse_cost_time,
			bus_cost_met,
			bus_reverse_cost_met,
			bus_length_m,
			bus_total_ascent,
			bus_total_descent,
			bus_curve_index,
			bus_speed,
			bus_terrain_index,
			bus_geom
		FROM (
			SELECT 
				trsp.seq,
				w.bus_cost,
				w.bus_reverse_cost,
				w.bus_cost_time,
				w.bus_reverse_cost_time,
				w.bus_cost_met,
				w.bus_reverse_cost_met,
				w.length_m,
				w.startaltitude,
				w.endaltitude,
				w.totalascent,
				w.totaldescent,
				w.curve_index,
				w.bus_speed,
				w.terrain_index,
				w.geom
			FROM pgr_trsp(
				'SELECT id, source, target, bus_cost AS cost, bus_reverse_cost AS reverse_cost FROM ways_clean WHERE bus_allow = true',
				source :: int4, target :: int4,
				true, true,
				'SELECT to_cost, target_id, via_path FROM vw_bus_restrictions'
			) AS trsp
			LEFT JOIN ways_clean w ON trsp.id2 = w.id
		) x;

		--Now perform the main update
		UPDATE public_transport_route_ways SET
			cost = bus_cost,
			reverse_cost = bus_reverse_cost,
			cost_time = bus_cost_time,
			reverse_cost_time = bus_reverse_cost_time,
			cost_met = bus_cost_met,
			reverse_cost_met = bus_reverse_cost_met,
			length_m = bus_length_m,
			totalascent = bus_total_ascent,
			totaldescent = bus_total_descent,
			curveindex = bus_curve_index,
			speed = bus_speed,
			terrain_index = bus_terrain_index,
			geom = bus_geom
		WHERE public_transport_route_ways.id = way_id;

		--Get and set the altitude information for our new route
		--Note: Doing this seperately as the start and end altitudes have to be found first
		--The direction the way was routed means the start and end of a way does not match the start and end of the bus route...
		SELECT ST_Value(r.rast, (SELECT ST_StartPoint(geom) FROM public_transport_route_ways WHERE id = way_id))
		INTO bus_start_altitude
		FROM terrain.dtm r
		WHERE r.rid = (
			SELECT r.rid FROM terrain.dtm_extent r 
			WHERE ST_Contains(r.geom, (SELECT ST_StartPoint(geom) FROM public_transport_route_ways WHERE id = way_id))
		); 

		SELECT ST_Value(r.rast, (SELECT ST_EndPoint(geom) FROM public_transport_route_ways WHERE id = way_id))
		INTO bus_end_altitude
		FROM terrain.dtm r
		WHERE r.rid = (
			SELECT r.rid FROM terrain.dtm_extent r 
			WHERE ST_Contains(r.geom, (SELECT ST_EndPoint(geom) FROM public_transport_route_ways WHERE id = way_id))
		);

		UPDATE public_transport_route_ways SET
			startaltitude = bus_start_altitude,
			endaltitude = bus_end_altitude,
			angleslope = getAngleOfSlope((bus_end_altitude - bus_start_altitude), bus_length_m),
			reverseangleslope = getAngleOfSlope((bus_start_altitude - bus_end_altitude), bus_length_m),
			percentslope = getPercentSlope((bus_end_altitude - bus_start_altitude), bus_length_m),
			reversepercentslope = getPercentSlope((bus_start_altitude - bus_end_altitude), bus_length_m)
		WHERE id = way_id;
		
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'ROUTING ERROR % %', SQLERRM, SQLSTATE;
	END;
END
$$;


ALTER FUNCTION setpublictransportbusway(way_id integer, source_geom public.geometry, target_geom public.geometry) OWNER TO postgres;
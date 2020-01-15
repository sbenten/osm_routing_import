CREATE FUNCTION setpublictransporttramway(way_id integer, source_geom public.geometry, target_geom public.geometry) RETURNS void
    LANGUAGE plpgsql
    AS $$
/*
Calculate the geometry and costs between two given public transport stops.
TRAM ONLY.
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

tram_cost double precision;
tram_reverse_cost double precision;
tram_cost_time double precision;
tram_reverse_cost_time double precision;
tram_cost_met double precision;
tram_reverse_cost_met double precision;
tram_length_m double precision;
tram_total_ascent double precision;
tram_total_descent double precision;
tram_curve_index double precision;
tram_speed smallint;
tram_terrain_index double precision;
tram_geom geometry(LineString, 27700);

tram_start_altitude double precision;
tram_end_altitude double precision;
BEGIN

	BEGIN 
		SELECT v.id INTO source
		FROM ways_clean_vertices_pgr v
		WHERE ST_Equals(source_geom, v.the_geom);

		SELECT v.id INTO target
		FROM ways_clean_vertices_pgr v
		WHERE ST_Equals(target_geom, v.the_geom);

		--RAISE NOTICE 'Source: % ; Target: %', source, target;

	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'NODE SELECTION ERROR % %', SQLERRM, SQLSTATE;
	END;

	BEGIN			
		SELECT 
			sum(x.tram_cost),
			sum(x.tram_reverse_cost),
			sum(x.tram_cost_time),
			sum(x.tram_reverse_cost_time),
			sum(x.tram_cost_met),
			sum(x.tram_reverse_cost_met),
			sum(x.length_m),
			sum(x.totalascent),
			sum(x.totaldescent),
			getwaycurveindex(ST_MakeLine(x.geom)), --recalculate the curviness of the road, rather than take an average
			sum(x.length_m*x.tram_speed)/sum(x.length_m), --Rather than just an average work out the proportion of the network allocated to each speed and use this as an average
			avg(x.terrain_index), --You would hope all roads traveled by PT are good, just take an average
			ST_LineMerge( ST_Collect(x.geom))
			--ST_MakeLine(x.geom) 

			INTO 
			tram_cost, 
			tram_reverse_cost, 
			tram_cost_time,
			tram_reverse_cost_time,
			tram_cost_met,
			tram_reverse_cost_met,
			tram_length_m,
			tram_total_ascent,
			tram_total_descent,
			tram_curve_index,
			tram_speed,
			tram_terrain_index,
			tram_geom
		FROM (
			SELECT 
				trsp.seq,
				w.tram_cost,
				w.tram_reverse_cost,
				w.tram_cost_time,
				w.tram_reverse_cost_time,
				w.tram_cost_met,
				w.tram_reverse_cost_met,
				w.length_m,
				w.startaltitude,
				w.endaltitude,
				w.totalascent,
				w.totaldescent,
				w.curve_index,
				w.tram_speed,
				w.terrain_index,
				w.geom
			FROM pgr_trsp(
				'SELECT id, source, target, tram_cost AS cost, tram_reverse_cost AS reverse_cost FROM ways_clean WHERE tram_allow = true',
				source :: int4, target :: int4,
				true, true,
				'SELECT to_cost, target_id, via_path FROM vw_tram_restrictions'
			) AS trsp
			LEFT JOIN ways_clean w ON trsp.id2 = w.id
		) x;

		--Now perform the main update
		UPDATE public_transport_route_ways SET
			cost = tram_cost,
			reverse_cost = tram_reverse_cost,
			cost_time = tram_cost_time,
			reverse_cost_time = tram_reverse_cost_time,
			cost_met = tram_cost_met,
			reverse_cost_met = tram_reverse_cost_met,
			length_m = tram_length_m,
			totalascent = tram_total_ascent,
			totaldescent = tram_total_descent,
			curveindex = tram_curve_index,
			speed = tram_speed,
			terrain_index = tram_terrain_index,
			geom = tram_geom
		WHERE public_transport_route_ways.id = way_id;

		--Get and set the altitude information for our new route
		--Note: Doing this seperately as the start and end altitudes have to be found first
		--The direction the way was routed means the start and end of a way does not match the start and end of the bus route...
		SELECT ST_Value(r.rast, (SELECT ST_StartPoint(geom) FROM public_transport_route_ways WHERE id = way_id))
		INTO tram_start_altitude
		FROM terrain.dtm r
		WHERE r.rid = (
			SELECT r.rid FROM terrain.dtm_extent r 
			WHERE ST_Contains(r.geom, (SELECT ST_StartPoint(geom) FROM public_transport_route_ways WHERE id = way_id))
		); 

		SELECT ST_Value(r.rast, (SELECT ST_EndPoint(geom) FROM public_transport_route_ways WHERE id = way_id))
		INTO tram_end_altitude
		FROM terrain.dtm r
		WHERE r.rid = (
			SELECT r.rid FROM terrain.dtm_extent r 
			WHERE ST_Contains(r.geom, (SELECT ST_EndPoint(geom) FROM public_transport_route_ways WHERE id = way_id))
		);

		UPDATE public_transport_route_ways SET
			startaltitude = tram_start_altitude,
			endaltitude = tram_end_altitude,
			angleslope = getAngleOfSlope((tram_end_altitude - tram_start_altitude), tram_length_m),
			reverseangleslope = getAngleOfSlope((tram_start_altitude - tram_end_altitude), tram_length_m),
			percentslope = getPercentSlope((tram_end_altitude - tram_start_altitude), tram_length_m),
			reversepercentslope = getPercentSlope((tram_start_altitude - tram_end_altitude), tram_length_m)
		WHERE id = way_id;
		
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'ROUTING ERROR % %', SQLERRM, SQLSTATE;
	END;
END
$$;


ALTER FUNCTION setpublictransporttramway(way_id integer, source_geom public.geometry, target_geom public.geometry) OWNER TO postgres;
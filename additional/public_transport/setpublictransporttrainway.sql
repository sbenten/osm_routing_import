CREATE FUNCTION setpublictransporttrainway(way_id integer, source_geom public.geometry, target_geom public.geometry) RETURNS void
    LANGUAGE plpgsql
    AS $$
/*
Calculate the geometry and costs between two given public transport stops.
TRAIN ONLY.
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

train_cost double precision;
train_reverse_cost double precision;
train_cost_time double precision;
train_reverse_cost_time double precision;
train_cost_met double precision;
train_reverse_cost_met double precision;
train_length_m double precision;
train_total_ascent double precision;
train_total_descent double precision;
train_curve_index double precision;
train_speed smallint;
train_terrain_index double precision;
train_geom geometry(LineString, 27700);

train_start_altitude double precision;
train_end_altitude double precision;
BEGIN

	BEGIN 
		SELECT v.id INTO source
		FROM ways_clean_vertices_pgr v
		WHERE ST_Equals(source_geom, v.the_geom);

		SELECT v.id INTO target
		FROM ways_clean_vertices_pgr v
		WHERE ST_Equals(target_geom, v.the_geom);

		RAISE NOTICE 'Source: % ; Target: %', source, target;

	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'NODE SELECTION ERROR % %', SQLERRM, SQLSTATE;
	END;

	BEGIN			
		SELECT 
			sum(x.train_cost),
			sum(x.train_reverse_cost),
			sum(x.train_cost_time),
			sum(x.train_reverse_cost_time),
			sum(x.train_cost_met),
			sum(x.train_reverse_cost_met),
			sum(x.length_m),
			sum(x.totalascent),
			sum(x.totaldescent),
			getwaycurveindex(ST_MakeLine(x.geom)), --recalculate the curviness of the road, rather than take an average
			sum(x.length_m*x.train_speed)/sum(x.length_m), --Rather than just an average work out the proportion of the network allocated to each speed and use this as an average
			avg(x.terrain_index), --You would hope all roads traveled by PT are good, just take an average
			ST_LineMerge( ST_Collect(x.geom))
			--ST_MakeLine(x.geom) 

			INTO 
			train_cost, 
			train_reverse_cost, 
			train_cost_time,
			train_reverse_cost_time,
			train_cost_met,
			train_reverse_cost_met,
			train_length_m,
			train_total_ascent,
			train_total_descent,
			train_curve_index,
			train_speed,
			train_terrain_index,
			train_geom
		FROM (
			SELECT 
				trsp.seq,
				w.train_cost,
				w.train_reverse_cost,
				w.train_cost_time,
				w.train_reverse_cost_time,
				w.train_cost_met,
				w.train_reverse_cost_met,
				w.length_m,
				w.startaltitude,
				w.endaltitude,
				w.totalascent,
				w.totaldescent,
				w.curve_index,
				w.train_speed,
				w.terrain_index,
				w.geom
			FROM pgr_trsp(
				'SELECT id, source, target, train_cost AS cost, train_reverse_cost AS reverse_cost FROM ways_clean WHERE train_allow = true',
				source :: int4, target :: int4,
				false, true,
				'SELECT to_cost, target_id, via_path FROM vw_train_restrictions'
			) AS trsp
			LEFT JOIN ways_clean w ON trsp.id2 = w.id
		) x;

		--Now perform the main update
		UPDATE public_transport_route_ways SET
			cost = train_cost,
			reverse_cost = train_reverse_cost,
			cost_time = train_cost_time,
			reverse_cost_time = train_reverse_cost_time,
			cost_met = train_cost_met,
			reverse_cost_met = train_reverse_cost_met,
			length_m = train_length_m,
			totalascent = train_total_ascent,
			totaldescent = train_total_descent,
			curveindex = train_curve_index,
			speed = train_speed,
			terrain_index = train_terrain_index,
			geom = train_geom
		WHERE public_transport_route_ways.id = way_id;

		--Get and set the altitude information for our new route
		--Note: Doing this seperately as the start and end altitudes have to be found first
		--The direction the way was routed means the start and end of a way does not match the start and end of the bus route...
		SELECT ST_Value(r.rast, (SELECT ST_StartPoint(geom) FROM public_transport_route_ways WHERE id = way_id))
		INTO train_start_altitude
		FROM terrain.dtm r
		WHERE r.rid = (
			SELECT r.rid FROM terrain.dtm_extent r 
			WHERE ST_Contains(r.geom, (SELECT ST_StartPoint(geom) FROM public_transport_route_ways WHERE id = way_id))
		); 

		SELECT ST_Value(r.rast, (SELECT ST_EndPoint(geom) FROM public_transport_route_ways WHERE id = way_id))
		INTO train_end_altitude
		FROM terrain.dtm r
		WHERE r.rid = (
			SELECT r.rid FROM terrain.dtm_extent r 
			WHERE ST_Contains(r.geom, (SELECT ST_EndPoint(geom) FROM public_transport_route_ways WHERE id = way_id))
		);

		UPDATE public_transport_route_ways SET
			startaltitude = train_start_altitude,
			endaltitude = train_end_altitude,
			angleslope = getAngleOfSlope((train_end_altitude - train_start_altitude), train_length_m),
			reverseangleslope = getAngleOfSlope((train_start_altitude - train_end_altitude), train_length_m),
			percentslope = getPercentSlope((train_end_altitude - train_start_altitude), train_length_m),
			reversepercentslope = getPercentSlope((train_start_altitude - train_end_altitude), train_length_m)
		WHERE id = way_id;
		
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'ROUTING ERROR % %', SQLERRM, SQLSTATE;
	END;
END
$$;


ALTER FUNCTION setpublictransporttrainway(way_id integer, source_geom public.geometry, target_geom public.geometry) OWNER TO postgres;
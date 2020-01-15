CREATE FUNCTION setpublictransportbuswayvianode(way_id integer, source_geom public.geometry, target_geom public.geometry, vianodes integer[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
/*
Public transport routes do not follow the shortest path. 
After the paths have been calculated for all routes it may be necessary to force some 
of them to go through certain nodes on the base network.

PARAMS
way_id	public_transport_ways.id	Unique identifier for the path between the two stops
source_geom	point	Geometry for the source public transport stop
target_geom	point	Geometry for the target public transport stop
vianodes	integer[]	Array of base network vertex identifiers to route through				

RETURNS void
*/
DECLARE
source integer;
target integer;

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
full_bus_geom geometry(LineString, 27700);

bus_start_altitude double precision;
bus_end_altitude double precision;

rec record;
points record;

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

		CREATE TEMPORARY TABLE tmp (seq integer, 
			bus_cost double precision,
			bus_reverse_cost double precision,
			bus_cost_time double precision,
			bus_reverse_cost_time double precision,
			bus_cost_met double precision,
			bus_reverse_cost_met double precision,
			bus_length_m double precision,
			bus_total_ascent double precision,
			bus_total_descent double precision,
			bus_curve_index double precision,
			bus_speed smallint,
			bus_terrain_index double precision,
			bus_geom geometry(LineString, 27700),
			bus_stop_node geometry(Point, 27700));		

		INSERT INTO tmp
		SELECT 
			trsp.seq,
			w.bus_cost,
			w.bus_reverse_cost,
			w.bus_cost_time,
			w.bus_reverse_cost_time,
			w.bus_cost_met,
			w.bus_reverse_cost_met,
			w.length_m,
			w.totalascent,
			w.totaldescent,
			w.curve_index,
			w.bus_speed,
			w.terrain_index,
			w.geom,
			n.the_geom
		FROM pgr_dijkstraVia(
			'SELECT id, source, target, bus_cost AS cost, bus_reverse_cost AS reverse_cost FROM ways_clean WHERE bus_allow = true',
			array_append(array_prepend(source, vianodes), target)
		) AS trsp
		LEFT JOIN ways_clean w ON trsp.edge = w.id
		LEFT JOIN ways_clean_vertices_pgr n ON trsp.node = n.id
		WHERE trsp.edge > -1;

		--Get the correctly organised path as a single linestring
		--Buses sometimes reverse go up and down a road, navigating by a roundabout
		--This means they traverse the same round segment twice!
		--Traditional line combination functions such as ST_LineMerge don't include the line twice, it's broken into seperate parts in a MultiLineString
		--Unfortunately, pg_Routing does not work with MultiLineStrings
		FOR rec IN
			SELECT seq, bus_stop_node, bus_geom FROM tmp ORDER BY seq
		LOOP
			IF ST_Equals(ST_StartPoint(rec.bus_geom), rec.bus_stop_node) THEN
				--Start point of the line and the bus stop are the same, therefore linestring is in the right order
				IF full_bus_geom IS NULL THEN
					full_bus_geom := rec.bus_geom;
				ELSE
					FOR points IN 
						SELECT generate_series(1, (SELECT ST_NumPoints(rec.bus_geom))) AS num 
					LOOP
						full_bus_geom := ST_AddPoint(full_bus_geom, ST_PointN(rec.bus_geom, points.num)); 
					END LOOP;
				END IF;
			ELSE
				--Reverse the order of the linestring
				IF full_bus_geom IS NULL THEN
					full_bus_geom := ST_Reverse(rec.bus_geom);
				ELSE
					FOR points IN 
						SELECT generate_series((SELECT ST_NumPoints(rec.bus_geom)), 1, -1) AS num 
					LOOP
						full_bus_geom := ST_AddPoint(full_bus_geom, ST_PointN(rec.bus_geom, points.num)); 
					END LOOP;

				END IF;
			END IF;

		END LOOP;

		RAISE NOTICE 'full_bus_geom: % ;', full_bus_geom;

		--Aggregate some values
		SELECT sum(tmp.bus_cost),
			sum(tmp.bus_reverse_cost),
			sum(tmp.bus_cost_time),
			sum(tmp.bus_reverse_cost_time),
			sum(tmp.bus_cost_met),
			sum(tmp.bus_reverse_cost_met),
			sum(tmp.bus_length_m),
			sum(tmp.bus_total_ascent),
			sum(tmp.bus_total_descent),
			sum(tmp.bus_length_m*tmp.bus_speed)/sum(tmp.bus_length_m),
			avg(tmp.bus_terrain_index)
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
			bus_speed,
			bus_terrain_index
		FROM tmp;

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
			speed = bus_speed,
			terrain_index = bus_terrain_index,				
			curveindex = getwaycurveindex(full_bus_geom),
			geom = full_bus_geom
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

		DROP TABLE tmp;
		
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'ROUTING ERROR % %', SQLERRM, SQLSTATE;
			DROP TABLE tmp;
	END;
END
$$;


ALTER FUNCTION setpublictransportbuswayvianode(way_id integer, source_geom public.geometry, target_geom public.geometry, vianodes integer[]) OWNER TO postgres;
CREATE FUNCTION splitwaysbypublictransportstops() RETURNS void
    LANGUAGE plpgsql
    AS $$
/*
Split the network on public transport stops.
Costs will need to be recalculated and the network vertices reset.

PARAMS
n/al

RETURNS void
*/
BEGIN
	--Keep track of the splits to the ways network
	CREATE TEMPORARY TABLE tmp (id integer, ln geometry(LineString, 27700));
		
	RAISE NOTICE 'Processing bus stops';
	WITH p AS (
		SELECT ST_SetSRID(ST_Union(o.way_point), 27700) AS stops, o.closest_way_id, o.way_geom
		FROM (
			SELECT i.stop_id, 
				ST_SetSRID(	
					ST_LineInterpolatePoint(
						(SELECT geom FROM ways_clean WHERE id = i.closest_way_id),
						ST_LineLocatePoint(
							(SELECT geom FROM ways_clean WHERE id = i.closest_way_id), 
							i.stop_geom
						)
					),
				27700) as way_point,
				ST_LineLocatePoint((SELECT geom FROM ways_clean WHERE id = i.closest_way_id), i.stop_geom) AS way_pos,
				(SELECT geom FROM ways_clean WHERE id = i.closest_way_id) AS way_geom,
				i.closest_way_id
			FROM (
				SELECT atcocode AS stop_id, geom AS stop_geom, nearestwaytobusstop(geom, 0.000001) AS closest_way_id
				FROM naptan
				WHERE type = 'bus' AND geom IS NOT NULL																						
			) i
			WHERE i.closest_way_id IS NOT NULL --Stops on the edge of the study area?
			ORDER BY i.closest_way_id, way_pos
		) o
		GROUP BY o.closest_way_id, o.way_geom
	)
	INSERT INTO tmp (id, ln)
	SELECT p.closest_way_id, 
		ST_SetSRID((rc_split_line_by_points(p.way_geom, p.stops, 0.000001)).geom, 27700)
	FROM p;

	RAISE NOTICE 'Processing tram stops';
	WITH p AS (
		SELECT ST_SetSRID(ST_Union(o.way_point), 27700) AS stops, o.closest_way_id, o.way_geom
		FROM (
			SELECT i.stop_id, 
				ST_SetSRID(	
					ST_LineInterpolatePoint(
						(SELECT geom FROM ways_clean WHERE id = i.closest_way_id),
						ST_LineLocatePoint(
							(SELECT geom FROM ways_clean WHERE id = i.closest_way_id), 
							i.stop_geom
						)
					),
				27700) as way_point,
				ST_LineLocatePoint((SELECT geom FROM ways_clean WHERE id = i.closest_way_id), i.stop_geom) AS way_pos,
				(SELECT geom FROM ways_clean WHERE id = i.closest_way_id) AS way_geom,
				i.closest_way_id
			FROM (
				SELECT atcocode AS stop_id, geom AS stop_geom, nearestwayoftype(geom, 'tram') AS closest_way_id
				FROM naptan
				WHERE type = 'tram' AND geom IS NOT NULL 																							
			) i
			WHERE i.closest_way_id IS NOT NULL --Stops on the edge of the study area?
			ORDER BY i.closest_way_id, way_pos
		) o
		GROUP BY o.closest_way_id, o.way_geom
	)
	INSERT INTO tmp (id, ln)
	SELECT p.closest_way_id, 
		ST_SetSRID((rc_split_line_by_points(p.way_geom, p.stops, 0.000001)).geom, 27700)
	FROM p;
	
	RAISE NOTICE 'Processing train stops';
	--Now, split the ways network by the stops
	WITH p AS (
		SELECT ST_SetSRID(ST_Union(o.way_point), 27700) AS stops, o.closest_way_id, o.way_geom
		FROM (
			SELECT i.stop_id, 
				ST_SetSRID(	
					ST_LineInterpolatePoint(
						(SELECT geom FROM ways_clean WHERE id = i.closest_way_id),
						ST_LineLocatePoint(
							(SELECT geom FROM ways_clean WHERE id = i.closest_way_id), 
							i.stop_geom
						)
					),
				27700) as way_point,
				ST_LineLocatePoint((SELECT geom FROM ways_clean WHERE id = i.closest_way_id), i.stop_geom) AS way_pos,
				(SELECT geom FROM ways_clean WHERE id = i.closest_way_id) AS way_geom,
				i.closest_way_id
			FROM (
				SELECT atcocode AS stop_id, import_geom AS stop_geom, nearestwayoftype(import_geom, 'trainline') AS closest_way_id
				FROM naptan
				WHERE type = 'train' AND geom IS NOT NULL																							
			) i
			WHERE i.closest_way_id IS NOT NULL --Stops on the edge of the study area?
			ORDER BY i.closest_way_id, way_pos
		) o
		GROUP BY o.closest_way_id, o.way_geom
	)
	INSERT INTO tmp (id, ln)
	SELECT p.closest_way_id, 
		ST_SetSRID((rc_split_line_by_points(p.way_geom, p.stops, 0.000001)).geom, 27700)
	FROM p;	

	RAISE NOTICE 'Splitting the existing network';
	INSERT INTO ways_clean (geom, ways_id, osm_id, name, highway, z_order, attrs)	
	SELECT t.ln, w.ways_id, w.osm_id, w.name, w.highway, w.z_order, w.attrs
	FROM tmp t
	JOIN ways_clean w ON w.id = t.id;
	
	DELETE FROM ways_clean WHERE id IN (SELECT id FROM tmp);
	
	DROP TABLE tmp;

	
	RAISE NOTICE 'Reset flags for what is allowed on the network';
	UPDATE ways_clean SET 
		car_allow = carAllowed(highway, attrs), 
		bus_allow = busAllowed(highway, attrs), 		
		cycle_allow = cycleAllowed(highway, attrs),
		walk_allow = walkAllowed(highway, attrs),
		has_bridge = hasBridge(attrs),
		has_tunnel = hasTunnel(attrs);
	
END 
$$;


ALTER FUNCTION splitwaysbypublictransportstops() OWNER TO postgres;
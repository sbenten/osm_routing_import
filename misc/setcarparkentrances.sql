CREATE FUNCTION setcarparkentrances() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
resultGeom geometry;
resultId int8;
rec record;
BEGIN 

	RAISE NOTICE '1. Add the entrance to the car park where there is some intersection';
	INSERT INTO car_park_entrances (car_park_id, geom, car_allow, walk_allow)
	SELECT i.car_park_id, ST_SetSRID((ST_Dump(i.touched)).geom, 27700), true, true
	FROM (
		SELECT      
		ST_Intersection(a.geom, b.boundary) AS touched, --Includes multipoints, points, multilinestrings and linestrings
			b.id AS car_park_id,
			a.id AS way_id
		FROM (
				SELECT c.id, c.geom
				FROM ways_clean c
				WHERE car_allow = true
			) as a,
		car_parks as b
		WHERE
			ST_Touches(a.geom, b.boundary) 
			OR ST_Crosses(a.geom, b.boundary)
			AND a.id != b.id
			AND ST_GeometryType(ST_Intersection(a.geom, b.boundary)) IN ('St_MultiPoint', 'ST_Point')
	) i;

	RAISE NOTICE '2. For those car parks without an entrance, either due to it not being mapped or being inaccurate mapping, look for the closest point on the closest road';
	FOR rec IN 
		SELECT c.id, c.boundary
		FROM car_parks c
		WHERE NOT EXISTS (
			SELECT e.id, e.geom 
			FROM car_park_entrances e 
			WHERE e.car_park_id = c.id
		)
	LOOP
		SELECT c.geom, c.id INTO resultGeom, resultId  
		FROM ways_clean c
		WHERE c.car_allow = true
		ORDER BY c.geom <-> rec.boundary
		LIMIT 1;
		
		IF resultId IS NOT NULL THEN	
			INSERT INTO car_park_entrances (car_park_id, geom, virtual, car_allow, walk_allow)
			SELECT rec.id, 
				ST_SetSRID(ST_ClosestPoint(rec.boundary, resultGeom), 27700), 
				ST_SetSRID(ST_ClosestPoint(resultGeom, rec.boundary), 27700),
				true, true;		
		END IF;
	END LOOP;
					
	RAISE NOTICE '3. Now add the footway entrances to the car park where there is some intersection';
	INSERT INTO car_park_entrances (car_park_id, geom, walk_allow)
	SELECT i.car_park_id, ST_SetSRID((ST_Dump(i.touched)).geom, 27700), true
	FROM (
		SELECT      
		ST_Intersection(a.geom, b.boundary) AS touched, --Includes multipoints, points, multilinestrings and linestrings
			b.id AS car_park_id
		FROM
		(SELECT id, geom FROM ways_clean WHERE walk_allow = true AND car_allow = false) as a,
		car_parks as b
		WHERE
			ST_Touches(a.geom, b.boundary) 
			OR ST_Crosses(a.geom, b.boundary)
			AND a.id != b.id
			AND ST_GeometryType(ST_Intersection(a.geom, b.boundary)) IN ('St_MultiPoint', 'ST_Point')
	) i;	

	RAISE NOTICE '4. Repeat the previous exercise to add service roads to car parks which dont exist';
	--Keep track of the new stop geoms and any new links which need making to the network
	CREATE TEMPORARY TABLE links (ent geometry(Point, 27700), pnt geometry(Point, 27700), id integer, way geometry(LineString, 27700));
	
	INSERT INTO links  
	SELECT i.virtual_geom,
		ST_SetSRID(	
			ST_LineInterpolatePoint(
				(SELECT geom FROM ways_clean WHERE id = i.closest_way_id),
				ST_LineLocatePoint(
					(SELECT geom FROM ways_clean WHERE id = i.closest_way_id), 
					i.virtual_geom
				)
			),
		27700) as way_point,
		i.closest_way_id,
		(SELECT geom FROM ways_clean WHERE id = i.closest_way_id) AS way_geom		
	FROM (
		SELECT *, (SELECT geom FROM ways_clean WHERE id = g.closest_way_id) AS way_geom
		FROM (
			SELECT id AS cp_id, geom AS virtual_geom, nearestvehiclewaytopoint(geom) AS closest_way_id
			FROM car_park_entrances
			WHERE virtual IS NOT NULL
		) g
		WHERE ST_Intersects((SELECT geom FROM ways_clean WHERE id = g.closest_way_id), virtual_geom) = false 																						
	) i
	WHERE i.closest_way_id IS NOT NULL
	ORDER BY i.closest_way_id;
	
	INSERT INTO ways_clean (geom, ways_id, osm_id, name, highway, z_order, attrs)
	SELECT ST_SetSrid(ST_MakeLine(l.ent, l.pnt), 27700), null, '-9999999999999999', null, 'service', 1, null
	FROM links l;
	
	RAISE NOTICE '5. Split the network where the new services join';
	WITH p AS (
		SELECT ST_SetSRID(ST_Union(l.pnt), 27700) AS points, l.id, l.way
		FROM links l
		GROUP BY l.id, l.way
	)
	INSERT INTO ways_clean (geom, ways_id, osm_id, name, highway, z_order, attrs)	
	SELECT 
		ST_SetSRID((rc_split_line_by_points(p.way, p.points, 0.000001)).geom, 27700),
		w.ways_id, w.osm_id, w.name, w.highway, w.z_order, w.attrs
	FROM p
	JOIN ways_clean w ON w.id = p.id;	
	
	DELETE FROM ways_clean WHERE id IN (SELECT id FROM links);
	
	DROP TABLE links;	
END 
$$;


ALTER FUNCTION setcarparkentrances() OWNER TO postgres;
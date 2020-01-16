CREATE FUNCTION setnaptangeom() RETURNS void
    LANGUAGE plpgsql
    AS $$
/*
Geometry corrections for NaPTAN 
NaPTAN reported public transport stops are inaccurate sometimes to within 10 meters...assign the stop to a position on the highway network.

PARAMS
n/a

RETURNS void
*/
BEGIN		
	RAISE NOTICE 'Processing bus stops';
	UPDATE naptan SET geom = x.way_point
	FROM (
		SELECT i.stop_id, 
			ST_SetSRID(	
				ST_LineInterpolatePoint(
					(SELECT geom FROM ways_clean WHERE id = i.closest_way_id),
					ST_LineLocatePoint(
						(SELECT geom FROM ways_clean WHERE id = i.closest_way_id), 
						i.bus_stop_geom
					)
				),
			27700) as way_point,
			ST_LineLocatePoint((SELECT geom FROM ways_clean WHERE id = i.closest_way_id), i.bus_stop_geom) AS way_pos,
			(SELECT geom FROM ways_clean WHERE id = i.closest_way_id) AS way_geom,
			i.closest_way_id
		FROM (
			SELECT atcocode AS stop_id, import_geom AS bus_stop_geom, nearestwaytobusstop(import_geom, 10) AS closest_way_id
			FROM naptan
			WHERE type = 'bus'
			AND ST_Contains(ST_Expand((SELECT ST_SetSRID(ST_Extent(geom), 27700) FROM ways_clean), 10000), import_geom)
		) i
		WHERE i.closest_way_id IS NOT NULL
	) x 
	WHERE atcocode = x.stop_id;

	RAISE NOTICE 'Processing tram stops';
	UPDATE naptan SET geom = x.way_point
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
			SELECT atcocode AS stop_id, import_geom AS stop_geom, nearestwayoftype(import_geom, 'tram') AS closest_way_id
			FROM naptan
			WHERE type = 'tram'
			AND ST_Contains(ST_Expand((SELECT ST_SetSRID(ST_Extent(geom), 27700) FROM ways_clean), 10000), import_geom)
		) i
		WHERE i.closest_way_id IS NOT NULL 
	) x 
	WHERE atcocode = x.stop_id;

	
	RAISE NOTICE 'Processing train stops';
	UPDATE naptan SET geom = x.way_point
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
			WHERE type = 'train'
			AND ST_Contains(ST_Expand((SELECT ST_SetSRID(ST_Extent(geom), 27700) FROM ways_clean), 10000), import_geom)
		) i
		WHERE i.closest_way_id IS NOT NULL 
	) x 
	WHERE atcocode = x.stop_id;	
END 
$$;


ALTER FUNCTION setnaptangeom() OWNER TO postgres;
CREATE FUNCTION setlanduses() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
rec record;
BEGIN

	RAISE NOTICE 'Insert those flagged as natural features';
	INSERT INTO landuses (osm_id, type)
	SELECT w.osm_id, 											
		unnest(xpath('//way/tag[@k="natural"]/@v', w.way))
	FROM osm_ways_sheffield w;

	UPDATE landuses SET name = x.name
	FROM (
		SELECT w.osm_id, 
			unnest(xpath('//way/tag[@k="natural"]/@v', w.way)), 
			unnest(xpath('//way/tag[@k="name"]/@v', w.way)) AS name
		FROM osm_ways_sheffield w
	) AS x 
	WHERE landuses.osm_id = x.osm_id;

	RAISE NOTICE 'Insert those flagged as water';
	INSERT INTO landuses (osm_id, type)
	SELECT w.osm_id, 											
		unnest(xpath('//way/tag[@k="waterway"]/@v', w.way))
	FROM osm_ways_sheffield w;

	UPDATE landuses SET name = x.name
	FROM (
		SELECT w.osm_id, 
			unnest(xpath('//way/tag[@k="waterway"]/@v', w.way)), 
			unnest(xpath('//way/tag[@k="name"]/@v', w.way)) AS name
		FROM osm_ways_sheffield w
	) AS x 
	WHERE landuses.osm_id = x.osm_id;

	RAISE NOTICE 'Insert those flagged as buildings';
	INSERT INTO landuses (osm_id, type)
	SELECT x.osm_id, 'building'
	FROM (
		SELECT w.osm_id, 											
			unnest(xpath('//way/tag[@k="building"]/@v', w.way))
		FROM osm_ways_sheffield w
	) x;

	RAISE NOTICE 'Missing the relations flagged as reservoir or pond';
	INSERT INTO landuses (osm_id, type, name)
	SELECT x.osm_id, 'water_multipolygon', x.relation_osm_id
	FROM (
		SELECT r.osm_id AS relation_osm_id,
			(unnest(xpath('//relation/member[@type="way" and @role="outer"]/@ref', r.relation)) :: varchar) :: bigint AS osm_id, 											
			unnest(xpath('//relation/tag[@k="water"]/@v', r.relation))
		FROM osm_relations_sheffield r
	) x;
	 
	UPDATE landuses SET name = x.name
	FROM (
		SELECT r.osm_id AS relation_osm_id,
			(unnest(xpath('//relation/member[@type="way" and @role="outer"]/@ref', r.relation)) :: varchar) :: bigint AS osm_id, 
			unnest(xpath('//relation/tag[@k="water"]/@v', r.relation)),
			unnest(xpath('//relation/tag[@k="name"]/@v', r.relation)) AS name
		FROM osm_relations_sheffield r
	) AS x 
	WHERE landuses.osm_id = x.osm_id;

	RAISE NOTICE 'Add missing multipolygon buildings';
	INSERT INTO landuses (osm_id, type, name)
	SELECT x.osm_id, 'building_multipolygon', x.relation_osm_id
	FROM (
		SELECT r.osm_id AS relation_osm_id,
			(unnest(xpath('//relation/member[@type="way" and @role="outer"]/@ref', r.relation)) :: varchar) :: bigint AS osm_id, 											
			unnest(xpath('//relation/tag[@k="building"]/@v', r.relation))
		FROM osm_relations_sheffield r
	) x;
	 
	UPDATE landuses SET name = x.name
	FROM (
		SELECT r.osm_id AS relation_osm_id,
			(unnest(xpath('//relation/member[@type="way" and @role="outer"]/@ref', r.relation)) :: varchar) :: bigint AS osm_id, 
			unnest(xpath('//relation/tag[@k="building"]/@v', r.relation)),
			unnest(xpath('//relation/tag[@k="name"]/@v', r.relation)) AS name
		FROM osm_relations_sheffield r
	) AS x 
	WHERE landuses.osm_id = x.osm_id;

	/*
	Fragile query. Anything which causes the order of the array of nodes to alter will result in a scribble, 
	rather than an actual building outline. Can't use any GROUP or ORDER BYs.
	Converting straight to a Polygon fails in this data, due to some unclosed boundaries...
	*/
	RAISE NOTICE 'Create the boundaries, then force a closed boundary before converting to a polygon';
	FOR rec IN 
		SELECT id, osm_id 
		FROM landuses
	LOOP
		UPDATE landuses SET --geom = i.geom, 
		boundary = i.boundary
		FROM (
			SELECT 
				ST_SetSRID(ST_MakeLine(array_agg(n.geom)), 27700) AS boundary
			FROM osm_nodes_sheffield n 
			JOIN (
				SELECT unnest(w.node_osm_ids) :: bigint AS osm_ids 
				FROM osm_ways_sheffield w 
				WHERE w.osm_id = rec.osm_id
			) w ON w.osm_ids = n.osm_id
		) AS i
		WHERE landuses.id = rec.id;
	END LOOP;



	RAISE NOTICE 'Try and create a boundary for all objects but multipolygons and lines';
	FOR rec IN 
		SELECT id, boundary 
		FROM landuses
		WHERE geom IS NULL 
		AND type NOT IN ('stream', 'river', 'riverbank', 'canal', 'derelict_canal', 'drain', 'tree_row', 'cliff', 'water_multipolygon', 'building_multipolygon')
	LOOP
		BEGIN
			UPDATE landuses 
			SET boundary = ST_ForceClosed((SELECT boundary FROM landuses WHERE id = rec.id))
			WHERE id = rec.id;
			
			UPDATE landuses SET geom = ST_MakePolygon(boundary) WHERE id = rec.id;
		EXCEPTION
			WHEN OTHERS THEN
			RAISE NOTICE 'Failed to create boundary % %', rec.id, SQLERRM;
		END;
	END LOOP;


	RAISE NOTICE 'Now try and make a polygon out of the water_multipolygon outer edges';
	FOR rec IN 
		SELECT id, boundary 
		FROM landuses
		WHERE geom IS NULL 
		AND type IN ('water_multipolygon', 'building_multipolygon')
	LOOP
		BEGIN		
			UPDATE landuses SET geom = ST_MakePolygon(boundary) WHERE id = rec.id;
		EXCEPTION
			WHEN OTHERS THEN
			RAISE NOTICE 'Failed to create boundary % %', rec.id, SQLERRM;
		END;
    END LOOP;

END
$$;


ALTER FUNCTION setlanduses() OWNER TO postgres;
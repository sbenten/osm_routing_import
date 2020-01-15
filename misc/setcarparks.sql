CREATE FUNCTION setcarparks() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
rec record;
BEGIN
	RAISE NOTICE '1. Insert those OSM ways flagged as car parks';
	INSERT INTO car_parks (osm_id, boundary)
	SELECT 
		i.osm_id,
		i.geom
	FROM (	
		SELECT w.osm_id, 
			w.geom,
			unnest(xpath('//way/tag[@k="amenity" and @v="parking"]/@v', w.way)) AS amenity
		FROM osm_ways_sheffield w
	) i;

	RAISE NOTICE '2. Now add the name and access restrictions (optional tags)';
	UPDATE car_parks SET name = x.name
	FROM (
		SELECT w.osm_id, 
			unnest(xpath('//way/tag[@k="amenity" and @v="parking"]/@v', w.way)) AS amenity,	
			unnest(xpath('//way/tag[@k="name"]/@v', w.way)) AS name
		FROM osm_ways_sheffield w
	) AS x 
	WHERE car_parks.osm_id = x.osm_id;

	UPDATE car_parks SET access = x.access
	FROM (
		SELECT w.osm_id, 
			unnest(xpath('//way/tag[@k="amenity" and @v="parking"]/@v', w.way)) AS amenity,	
			unnest(xpath('//way/tag[@k="access"]/@v', w.way)) AS access
		FROM osm_ways_sheffield w
	) AS x 
	WHERE car_parks.osm_id = x.osm_id;

	RAISE NOTICE '3. From experience, some of the boundaries are not closed...force closure before converting to a polygon';
	UPDATE car_parks SET geom = ST_MakePolygon(ST_ForceClosed(boundary));
END
$$;


ALTER FUNCTION setcarparks() OWNER TO postgres;

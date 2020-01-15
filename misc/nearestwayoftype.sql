CREATE FUNCTION nearestwayoftype(startpoint public.geometry, highwaytype character varying, tolerence double precision DEFAULT '-1'::integer) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
/*
Find the closest segment of the network of the highway type specified
Optionally specify a distance within which a match must be found
*/
DECLARE 
resultWay geometry;
resultId int8;
BEGIN
	SELECT c.geom, c.id INTO resultWay, resultId
	FROM ways_clean c
	WHERE highway = highwayType
	ORDER BY c.geom <-> startPoint
	LIMIT 1;

	IF resultId IS NOT NULL AND (tolerence = -1 OR ST_DWithin(startPoint, resultWay, tolerence) ) THEN
		RETURN resultId;
	ELSE
        RAISE NOTICE 'No node within tolerance found';
        RETURN NULL;
    END IF;
END;
$$;


ALTER FUNCTION nearestwayoftype(startpoint public.geometry, highwaytype character varying, tolerence double precision) OWNER TO postgres;
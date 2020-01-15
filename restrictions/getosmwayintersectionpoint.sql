CREATE FUNCTION getosmwayintersectionpoint(from_osm_id character varying, to_osm_id character varying) RETURNS public.geometry
    LANGUAGE plpgsql
    AS $$
/*
Function getting the intersection point of two osm ways
*/
BEGIN
	IF EXISTS (SELECT 1 FROM ways_clean f WHERE f.osm_id = from_osm_id)
    	AND EXISTS (SELECT 1 FROM ways_clean t WHERE t.osm_id = to_osm_id) THEN

        RETURN (SELECT (ST_Dump(i.overlap)).geom :: geometry
            FROM
            (
                SELECT ST_Intersection(a.geom, b.geom) AS overlap
                FROM ways_clean a
                CROSS JOIN ways_clean b
                WHERE a.osm_id = from_osm_id
                AND b.osm_id = to_osm_id
            ) AS i);
     ELSE
     	RETURN NULL;
     END IF;
EXCEPTION
	WHEN OTHERS THEN
		RAISE NOTICE 'ERROR going from osm_id %1 to osm_id %2 - Check network', from_osm_id, to_osm_id;
        RETURN NULL;
END;
$$;


ALTER FUNCTION getosmwayintersectionpoint(from_osm_id character varying, to_osm_id character varying) OWNER TO postgres;
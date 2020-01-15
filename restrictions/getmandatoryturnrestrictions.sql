CREATE FUNCTION getmandatoryturnrestrictions(from_osm_id character varying, to_osm_id character varying) RETURNS TABLE(to_id integer, from_id integer)
    LANGUAGE plpgsql
    AS $$
/*
Returns the restrictions for a mandatory turn at the intersection between two OSM ways
*/
DECLARE 
intGeom geometry;
fromId integer;
rec record;
BEGIN
	intGeom := getOsmWayIntersectionPoint(from_osm_id, to_osm_id);
    fromId := (SELECT c.id
              FROM ways_clean c
            WHERE ST_Touches(c.geom, intGeom )
            AND c.osm_id = from_osm_id);
            
    FOR rec IN (SELECT c.id
        FROM ways_clean c
        WHERE ST_Touches(c.geom, intGeom )
        AND c.osm_id NOT IN (from_osm_id, to_osm_id))
    LOOP
    	to_id := rec.id;
        from_id := fromId;
        RETURN NEXT;
    END LOOP;

END;
$$;


ALTER FUNCTION getmandatoryturnrestrictions(from_osm_id character varying, to_osm_id character varying) OWNER TO postgres;

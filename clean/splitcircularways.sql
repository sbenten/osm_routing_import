CREATE FUNCTION splitcircularways() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    --First split ring geometries, one half at a time
    INSERT INTO ways_clean (ways_id, geom, osm_id, name, highway, z_order, attrs)
    SELECT ways_id, ST_LineSubstring(geom, 0.0, 0.5), osm_id, name, highway, z_order, attrs
    FROM ways_clean 
    WHERE ST_Intersects(ST_StartPoint(geom), ST_EndPoint(geom));

    --Second half of splitting
    INSERT INTO ways_clean (ways_id, geom, osm_id, name, highway, z_order, attrs)
    SELECT ways_id, ST_LineSubstring(geom, 0.5, 1.0), osm_id, name, highway, z_order, attrs
    FROM ways_clean 
    WHERE ST_Intersects(ST_StartPoint(geom), ST_EndPoint(geom));

    --Remove the original geometries
    DELETE FROM ways_clean WHERE ST_Intersects(ST_StartPoint(geom), ST_EndPoint(geom));

END
$$;


ALTER FUNCTION splitcircularways() OWNER TO postgres;
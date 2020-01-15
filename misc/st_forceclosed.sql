CREATE FUNCTION st_forceclosed(geom public.geometry) RETURNS public.geometry
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF ST_IsClosed(geom) THEN
		RETURN geom;
	ELSIF GeometryType(geom) = 'LINESTRING' THEN
		SELECT ST_AddPoint(geom, ST_StartPoint(geom)) INTO geom;
	ELSIF GeometryType(geom) ~ '(MULTI|COLLECTION)' THEN
	
		-- Recursively deconstruct parts
		WITH parts AS (
		  SELECT ST_ForceClosed(gd.geom) AS closed_geom FROM ST_Dump(geom) AS gd
		) -- Reconstitute parts
		SELECT ST_Collect(closed_geom) INTO geom FROM parts;
	END IF;
	
	IF NOT ST_IsClosed(geom) THEN
		RAISE EXCEPTION 'Could not close geometry';
	END IF;
	
	RETURN geom;
END
$$;


ALTER FUNCTION st_forceclosed(geom public.geometry) OWNER TO postgres;
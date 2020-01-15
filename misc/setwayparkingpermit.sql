CREATE FUNCTION setwayparkingpermit() RETURNS void
    LANGUAGE plpgsql
    AS $$

DECLARE
success boolean := true;
BEGIN
	WITH x as (
		SELECT geom FROM parking_permits
	)
	UPDATE ways_clean SET has_permit = true
	FROM x
	WHERE ST_Contains(x.geom, ways_clean.geom) = true OR ST_Crosses(x.geom, ways_clean.geom) = true;
END
$$;


ALTER FUNCTION setwayparkingpermit() OWNER TO postgres;
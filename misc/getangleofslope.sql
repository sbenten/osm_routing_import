CREATE FUNCTION getangleofslope(height double precision, length double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF length > 0 THEN
		RETURN (atan(height / length) / pi() * 180);
	ELSE
		RETURN 0;
	END IF;
END
$$;


ALTER FUNCTION getangleofslope(height double precision, length double precision) OWNER TO postgres;
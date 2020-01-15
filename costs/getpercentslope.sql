CREATE FUNCTION getpercentslope(height double precision, length double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF length > 0 THEN 
		RETURN (height / length * 100);
	ELSE
		RETURN 0;
	END IF;
END
$$;


ALTER FUNCTION getpercentslope(height double precision, length double precision) OWNER TO postgres;
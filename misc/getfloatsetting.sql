CREATE FUNCTION getfloatsetting(inname character varying) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
/*
Get an integer setting value.
*/
BEGIN
	RETURN (SELECT val :: float FROM settings WHERE name = inName);
END
$$;


ALTER FUNCTION getfloatsetting(inname character varying) OWNER TO postgres;
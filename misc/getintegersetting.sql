CREATE FUNCTION getintegersetting(inname character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
/*
Get an integer setting value.
*/
BEGIN
	RETURN (SELECT val :: int FROM settings WHERE name = inName);
END
$$;


ALTER FUNCTION getintegersetting(inname character varying) OWNER TO postgres;
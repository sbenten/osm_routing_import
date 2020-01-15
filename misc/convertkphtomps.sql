CREATE FUNCTION convertkphtomps(kph smallint) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
/*Convert kilometers per hour to meters per second
  kph is kilometers per hour
  Convert to speed to meters per hour = * 1000
  Convert to speed to meters per second = / (60 * 60) = / 3600 
*/
BEGIN 
	RETURN (CAST(kph AS double precision) * 1000) / 3600;
END;
$$;


ALTER FUNCTION convertkphtomps(kph smallint) OWNER TO postgres;
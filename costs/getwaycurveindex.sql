CREATE FUNCTION getwaycurveindex(geom public.geometry) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
/*How bendy is the network edge?
The ration of edge length versus Euclidean distance gives this information

Inspired by https://www.technomancy.org/openstreetmap/bendy-roads/
*/
BEGIN 
	RETURN ST_Length(geom) / CASE WHEN ST_Distance(ST_StartPoint(geom), ST_EndPoint(geom)) = 0 THEN ST_Length(geom) ELSE ST_Distance(ST_StartPoint(geom), ST_EndPoint(geom)) END;
END;
$$;


ALTER FUNCTION getwaycurveindex(geom public.geometry) OWNER TO postgres;
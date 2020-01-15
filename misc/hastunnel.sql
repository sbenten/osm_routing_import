CREATE FUNCTION hastunnel(attrs public.hstore) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
/*
Check whether an edge in the network has a tunnel flagged
*/
DECLARE
tunnel boolean := false;
BEGIN	
	IF attrs ? 'tunnel' THEN
		tunnel :=  attrs -> 'tunnel' = 'yes';
	END IF;
	
	RETURN tunnel;
END;
$$;


ALTER FUNCTION hastunnel(attrs public.hstore) OWNER TO postgres;
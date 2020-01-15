CREATE FUNCTION hasbridge(attrs public.hstore) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
/*
Check whether an edge in the network has a bridge flagged
*/
DECLARE
bridge boolean := false;
BEGIN	
	IF attrs ? 'bridge' THEN
		bridge :=  attrs -> 'bridge' = 'yes';
	END IF;
	
	RETURN bridge;
END;
$$;


ALTER FUNCTION hasbridge(attrs public.hstore) OWNER TO postgres;
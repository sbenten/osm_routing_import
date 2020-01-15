CREATE FUNCTION cycleallowed(highway character varying, attrs public.hstore) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
/*Common function for working out if a bicycle is allowed on a stretch of the network
*/
DECLARE
highwayAllowed boolean := false;
bicycleAttrAllowed boolean := false;
BEGIN
	 
    highwayAllowed := (SELECT 
            highway IS NOT NULL AND 
            highway NOT IN ('footway', 'path', 'steps', 'pedestrian', 'bus_guideway', 'escape', 'raceway', 'proposed', 'construction', 'motorway', 'motorway_link', 'no', 'platform', 'trainline', 'tram'));
	
	IF attrs IS NOT NULL AND attrs ? 'bicycle' THEN
		bicycleAttrAllowed := (SELECT CASE WHEN attrs -> 'bicycle' != 'no' THEN true
					ELSE false
					END);
		IF bicycleAttrAllowed = false THEN
			--Expressly denied, so flip the highway flag to force correct return value
			highwayAllowed := false;
		END IF;
	END IF;
	
	RETURN highwayAllowed OR bicycleAttrAllowed;
END;
$$;


ALTER FUNCTION cycleallowed(highway character varying, attrs public.hstore) OWNER TO postgres;
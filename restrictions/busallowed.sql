CREATE FUNCTION busallowed(highway character varying, attrs public.hstore) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
/*
Common function for working out if a bus is allowed on a way in the network

PARAMS
highway	character varying	OSM highway type
attrs	public.hstore		OSM attributes stored as a hstore

RETURNS boolean				Success/fail status
*/
DECLARE
highwayAllowed boolean := false;
busAttrAllowed boolean := false;
BEGIN
	 
    highwayAllowed := (SELECT 
            highway IS NOT NULL AND 
            highway NOT IN ('footway', 'path', 'cycleway', 'track', 'steps', 'bridleway', 'pedestrian', 'escape', 'raceway', 'proposed', 'construction', 'no', 'platform', 'trainline', 'tram'));
	
	IF attrs IS NOT NULL AND attrs ? 'bus' THEN
		busAttrAllowed := (SELECT CASE WHEN attrs -> 'bus' != 'no' THEN true 
					ELSE false
					END);
					
		IF busAttrAllowed = false THEN
			--Expressly denied, so flip the highway flag to force correct return value
			highwayAllowed := false;
		END IF;
	END IF;
	
	RETURN highwayAllowed OR busAttrAllowed ;
END;
$$;


ALTER FUNCTION busallowed(highway character varying, attrs public.hstore) OWNER TO postgres;
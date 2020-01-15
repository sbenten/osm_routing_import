CREATE FUNCTION carallowed(highway character varying, attrs public.hstore) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
/*Common function for working out if a car is allowed on a stretch of the network
*/
DECLARE
highwayAllowed boolean := false;
carAttrAllowed boolean := false;
motorcarAttrAllowed boolean := false;
BEGIN
	 
    highwayAllowed := (SELECT 
            highway IS NOT NULL AND 
            highway NOT IN ('footway', 'path', 'cycleway', 'track', 'steps', 'bridleway', 'pedestrian', 'bus_guideway', 'escape', 'raceway', 'proposed', 'construction', 'no', 'platform', 'trainline', 'tram'));
	
	IF attrs IS NOT NULL THEN
		IF attrs ? 'car' THEN
			carAttrAllowed := (SELECT CASE WHEN attrs -> 'car' != 'no' THEN true
					ELSE false
					END);
					
			IF carAttrAllowed = false THEN
				--Expressly denied, so flip the highway flag to force correct return value
				highwayAllowed := false;
			END IF;
		END IF;

		IF attrs ? 'motorcar' THEN
			motorcarAttrAllowed := (SELECT CASE WHEN attrs -> 'motorcar' != 'no' THEN true
					ELSE false
					END);
					
			IF motorcarAttrAllowed = false THEN
				--Expressly denied, so flip the highway flag to force correct return value
				highwayAllowed := false;
			END IF;
		END IF;		
	
	END IF;
	
	RETURN highwayAllowed OR carAttrAllowed OR motorcarAttrAllowed;
END;
$$;


ALTER FUNCTION carallowed(highway character varying, attrs public.hstore) OWNER TO postgres;
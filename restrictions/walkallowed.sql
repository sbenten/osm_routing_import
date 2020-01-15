CREATE FUNCTION walkallowed(highway character varying, attrs public.hstore) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
/*
Common function for working out if walking is allowed on a way in the network

PARAMS
highway	character varying	OSM highway type
attrs	public.hstore		OSM attributes stored as a hstore

RETURNS boolean				Success/fail status
*/
DECLARE
highwayAllowed boolean := false;
footAttrAllowed boolean := false;
pedestrianAttrAllowed boolean := false;
BEGIN
	 
    highwayAllowed := (SELECT 
            highway IS NOT NULL AND 
            highway NOT IN ('cycleway', 'bus_guideway', 'escape', 'raceway', 'proposed', 'construction', 'motorway', 'motorway_link', 'no', 'trainline', 'tram'));
	
	IF attrs IS NOT NULL THEN
		IF attrs ? 'foot' THEN 
			--Deprecated in favour of sidewalk, though still in use
			footAttrAllowed := (SELECT CASE WHEN attrs -> 'foot' NOT IN ('no', 'private') THEN true
					ELSE false
					END);
					
			IF footAttrAllowed = false THEN
				--Expressly denied, so flip the highway flag to force correct return value
				highwayAllowed := false;
			END IF;
		END IF;

		IF attrs ? 'pedestrian' THEN
			pedestrianAttrAllowed := (SELECT CASE WHEN attrs -> 'pedestrian' != 'no' THEN true
					ELSE false
					END);
					
			IF pedestrianAttrAllowed = false THEN
				--Expressly denied, so flip the highway flag to force correct return value
				highwayAllowed := false;
			END IF;
		END IF;		
	END IF;
	
	RETURN highwayAllowed OR footAttrAllowed OR pedestrianAttrAllowed;
END;
$$;


ALTER FUNCTION walkallowed(highway character varying, attrs public.hstore) OWNER TO postgres;
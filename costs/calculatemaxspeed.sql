CREATE FUNCTION calculatemaxspeed(networkspeed smallint, urbanspeed smallint, isurban boolean, attrspeed text) RETURNS smallint
    LANGUAGE plpgsql
    AS $$
/*
Common function for working out the maximum speed of the way
Examines the maximum speed in kph specified in the config and takes into account any attributes.

In the UK the attribute data from OSM is ALWAYS mph
A new version would be required for kph attributes

1 mph = 1.609344 kph

PARAMS
networkspeed	smallint	The maximum allowed speed the type of vehicle can travel across the type of way
urbanspeed		smallint	The maximum allowed speed the type of vehicle can travel across the type of way in an URBAN setting
isurban			boolean		Does the way intersect with an urban area?
attrspeed		text		Any OSM attribute relating of speed traversing the way

RETURNS			smallint	Maximum speed in kph
*/
BEGIN
	RETURN 
    CASE WHEN attrSpeed IS NOT NULL THEN 
    	floor((1.609344 * CAST(trim(trailing ' ' from trim(trailing 'mph' from replace(replace(replace(attrSpeed, 'signals', '30'), 'Variable 30/40', '30'), 'national', '60'))) AS double precision)))      
    ELSE
		CASE WHEN isurban = true THEN
			urbanSpeed
		ELSE
    		networkSpeed
		END
    END;
END;
$$;


ALTER FUNCTION calculatemaxspeed(networkspeed smallint, urbanspeed smallint, isurban boolean, attrspeed text) OWNER TO postgres;
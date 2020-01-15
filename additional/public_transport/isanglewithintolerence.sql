CREATE FUNCTION isanglewithintolerence(angle integer, test integer, tolerence integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
/*
Check whether an angle is within a tolerence (plus and minus) from a second test angle
*/
DECLARE
anglediff double precision;
BEGIN 
	anglediff = (test - angle + 180 + 360) % 360 - 180;

	RETURN (anglediff <= tolerence) AND (anglediff >= -tolerence);
END;
$$;


ALTER FUNCTION isanglewithintolerence(angle integer, test integer, tolerence integer) OWNER TO postgres;
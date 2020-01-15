CREATE FUNCTION calculatetimecost(length double precision, maxspeed smallint, curveindex double precision DEFAULT 1.0) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
/*A common function to calculate the cost based on time (in seconds) to traverse the way

	length = Length of the edge in the network
	maxspeed = Speed limit for the edge.
		Converts networkSpeed (in kph) to meters per second
	curveindex = How bendy is the road?	1.0 has no effect on the calculations. Bendy roads may take longer to traverse.
*/
BEGIN 
	RETURN (length / convertKphToMps(maxspeed)) * curveIndex;
END;
$$;


ALTER FUNCTION calculatetimecost(length double precision, maxspeed smallint, curveindex double precision) OWNER TO postgres;
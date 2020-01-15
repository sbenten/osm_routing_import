CREATE FUNCTION calculatecost(length double precision, maxspeed smallint, oneway smallint, noentry boolean, reverse boolean, curveindex double precision DEFAULT 1.0) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
/*A common function to calculate the cost to traverse the way

length		double precision	Length of the edge in the network
maxspeed	smallint			Speed limit for the edge. Converts networkSpeed (in kph) to meters per second
onewa		smallint			Is the edge a oneway segment of the network?
								-1 one-way in opposite direction of how edge is drawn
								0 two way / unknown / reversible / alternating (latter two not used in this study)
								1 one-way in direction edge is drawn
noentry		boolean				No entry for a particular vehicle type. (Decide outside of function). 
								Sets the time spent to traverse the edge ridiculously high.
								Setting is configurable.
reverse		boolean				Calculation for traversing the slope in the reverse direction.
curveindex	double precision	(OPTIONAL) How bendy is the road?	1.0 has no effect on the calculations. Bendy roads may take longer to traverse.

RETURNS		double precision	Cost.  
*/
DECLARE 
setting double precision := 0.0;
calculated double precision := 0.0;
BEGIN 
	setting := (SELECT CAST(val AS float) FROM settings WHERE name = 'one_way_cost');
	
	IF maxspeed = 0 THEN
		--If the maxspeed has been set to zero, then its effectively a barrier to entry
		noentry := true;
	END IF;

    calculated := (
		SELECT 
			CASE WHEN noentry = FALSE THEN
				--Could reduce the CASEs, just leaving for clarity
				CASE WHEN oneway = 1 AND reverse = false THEN (length / convertKphToMps(maxspeed))
					 WHEN oneway = 1 AND reverse = true THEN setting
					 WHEN oneway = -1 AND reverse = false THEN setting
					 WHEN oneway = -1 AND reverse = true THEN (length / convertKphToMps(maxspeed))
					 ELSE (length / convertKphToMps(maxspeed))
				END
			 ELSE setting
			 END);
	 
	RETURN calculated * curveIndex;
END;
$$;


ALTER FUNCTION calculatecost(length double precision, maxspeed smallint, oneway smallint, noentry boolean, reverse boolean, curveindex double precision) OWNER TO postgres;
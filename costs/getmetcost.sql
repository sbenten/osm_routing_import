CREATE FUNCTION getmetcost(setting character varying, timecost double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
/*
Update the road length and transport mode costs

setting = Name. sheffield.settings.name "met_xxxx" value
	Several MET settings from the Compendium of Physical Activities are available
timecost = Seconds. Cost in seconds spent doing an activity

Note: Used to calculate MET usage for the time taken to traverse the segment of the route.
Formula used to calculate calories is:
MET value * 3.5ml of oxygen * weight in kg / 200 * minutes of activity = calories
e.g. A 80kg person walking fast uphill with a MET value of 8.0 for 1 minute:
	8.0 METs * 3.5 * 80kg / 200 * 1 mins = 1.12 calories
*/
BEGIN
	RETURN (getFloatSetting(setting) / 60) * timecost;
END; 
$$;


ALTER FUNCTION getmetcost(setting character varying, timecost double precision) OWNER TO postgres;
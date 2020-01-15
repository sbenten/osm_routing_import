CREATE FUNCTION setpublictransportlinks(level integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
/*
Add POSSIBLE connections between public transport vehicles.
This only checks that the same public transport stop is used by different service.
It DOES NOT check the timings. (improvement required).
Adds records to the public_transport_links table for use in later queries.

PARAMS
level	integer	Number of possible public transport connections to recurse.

RETURNS void
*/
DECLARE rec record;
BEGIN

FOR rec IN
	SELECT DISTINCT vehicle_journey_code FROM public_transport_route_times
LOOP
	RAISE NOTICE '%', rec.vehicle_journey_code;
	WITH RECURSIVE x AS (
		SELECT 0 AS lvl, vehicle_journey_code, source, target
		FROM public_transport_route_times
		WHERE vehicle_journey_code = rec.vehicle_journey_code
		UNION 
		SELECT x.lvl + 1 AS lvl, t.vehicle_journey_code, t.source, t.target
		FROM public_transport_route_times t, x
		WHERE t.source = x.target
		AND t.vehicle_journey_code != x.vehicle_journey_code
		AND x.lvl < level
	)
	INSERT INTO public_transport_links
	SELECT DISTINCT rec.vehicle_journey_code, vehicle_journey_code, lvl
	FROM x;
END LOOP;
END
$$;


ALTER FUNCTION setpublictransportlinks(level integer) OWNER TO postgres;
CREATE FUNCTION setwayparking() RETURNS boolean
    LANGUAGE plpgsql
    AS $$
/*
Parking according to The Highway Code - Waiting and parking (238 to 252)
https://www.gov.uk/guidance/the-highway-code/waiting-and-parking-238-to-252

NOTE: Incorporate the simplest of rules, to rstrict the routing algorithm from selecting silly areas to park.
	Add additional rules, such as road markings if data is available.
*/
DECLARE
success boolean := true;
BEGIN

/*
Rule 238
You MUST NOT wait or park on yellow lines during the times of operation shown on nearby time plates (or zone entry signs if in a Controlled Parking Zone) – 
see ‘Traffic signs’ and ‘Road markings’. 
Double yellow lines indicate a prohibition of waiting at any time even if there are no upright signs. 
You MUST NOT wait or park, or stop to set down and pick up passengers, on school entrance markings (see ‘Road markings’) when upright signs indicate a prohibition of stopping.
	NOTE: NOT GOING TO KNOW ROAD MARKINGS, IGNORE FOR NOW

Rule 240
You MUST NOT stop or park on:
the carriageway or the hard shoulder of a motorway except in an emergency (see Rule 270)
*/
	BEGIN
		UPDATE ways_clean SET has_parking = false
		WHERE highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link');
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE '240 highway % %', SQLERRM, SQLSTATE;
			success := false;
	END;
/*
a pedestrian crossing, including the area marked by the zig-zag lines (see Rule 191)
	NOTE: TODO get from OSM point data
a clearway (see ‘Traffic signs’)
	NOTE: NOT GOING TO KNOW ROAD MARKINGS, IGNORE FOR NOW
taxi bays as indicated by upright signs and markings
	NOTE: TODO get from OSM data ?
an Urban Clearway within its hours of operation, except to pick up or set down passengers (see ‘Traffic signs’)
	NOTE: NOT GOING TO KNOW ROAD MARKINGS, IGNORE FOR NOW
a road marked with double white lines, even when a broken white line is on your side of the road, except to pick up or set down passengers, or to load or unload goods
	NOTE: NOT GOING TO KNOW ROAD MARKINGS, IGNORE FOR NOW
a tram or cycle lane during its period of operation
*/
	BEGIN 
		WITH t AS (
			SELECT id, geom FROM ways_clean WHERE highway = 'tram'
		)
		UPDATE ways_clean SET has_parking = false
		FROM (
			SELECT c.id 
			FROM ways_clean c, t
			WHERE highway NOT IN ('tram', 'trainline')
			AND ST_Touches(c.geom, t.geom)
		) s 
		WHERE s.id = ways_clean.id;
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE '240 tram % %', SQLERRM, SQLSTATE;
			success := false;
	END;
	
	BEGIN 
		--ignore single side busways for now
		UPDATE ways_clean SET has_parking = false 
		WHERE attrs ? 'busway';
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE '240 busway % %', SQLERRM, SQLSTATE;
			success := false;
	END;
/*
a cycle track
	NOTE:TODO attrs = cycleway = 'no', 'lane', 'track', 'separate' , 'shoulder', 'shared_lane', 'share_busway', 'opposite' (both directions), 'opposite_lane' (contraflow)
*/
	BEGIN 
		--ignore opposite etc for now
		UPDATE ways_clean SET has_parking = false 
		WHERE attrs -> 'cycleway' IN ('lane', 'shared_lane');
	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE '240 cycleway % %', SQLERRM, SQLSTATE;
			success := false;
	END;
/*
red lines, in the case of specially designated ‘red routes’, unless otherwise indicated by signs. Any vehicle may enter a bus lane to stop, load or unload where this is not prohibited (see Rule 141).
	NOTE: NOT GOING TO KNOW ROAD MARKINGS, IGNORE FOR NOW

NOTE: OTHER RULES WHERE WE ARE NOT GOING TO KNOW THE ANSWER
Rule 243
DO NOT stop or park:
near a school entrance
anywhere you would prevent access for Emergency Services
at or near a bus or tram stop or taxi rank
on the approach to a level crossing/tramway crossing
opposite or within 10 metres (32 feet) of a junction, except in an authorised parking space
near the brow of a hill or hump bridge
opposite a traffic island or (if this would cause an obstruction) another parked vehicle
where you would force other traffic to enter a tram lane
where the kerb has been lowered to help wheelchair users and powered mobility vehicles
in front of an entrance to a property
on a bend
where you would obstruct cyclists’ use of cycle facilities
except when forced to do so by stationary traffic.

Rule 245
Controlled Parking Zones. The zone entry signs indicate the times when the waiting restrictions within the zone are in force. Parking may be allowed in some places at other times. 
Otherwise parking will be within separately signed and marked bays.
	NOTE: TODO These controlled areas are akin to Permit areas in  Consider incorporating?
	https://www.gov.uk/home/parking/apply-parking-permit/parking-permit-zones.html
*/

--A final sanity check. Some highway types you cannot even drive a car along and stop:
UPDATE ways_clean set has_parking = false WHERE highway IN 
('trunk', 'trunk_link', 'tram', 'trainline', 'steps', 'service', 'raceway', 
'platform', 'pedestrian', 'path', 'no', 'motorway', 'motorway_link', 
'living_street', 'footway', 'escape', 'cycleway', 'construction', 'bridleway');


	RETURN success;
END
$$;


ALTER FUNCTION setwayparking() OWNER TO postgres;
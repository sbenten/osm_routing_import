CREATE FUNCTION setwayrestrictions() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
rec record;
BEGIN
	FOR rec IN 
		SELECT DISTINCT r.from_id, r.to_id, r.restriction 
		FROM osm_restrictions r
		WHERE r.restriction IN ('only_left_turn', 'only_straight_on', 'only_right_turn')
		AND EXISTS (SELECT 1 FROM ways_clean f WHERE f.osm_id = r.from_id)
		AND EXISTS (SELECT 1 FROM ways_clean t WHERE t.osm_id = r.to_id)
	LOOP
		INSERT INTO way_restrictions(from_osm_id, to_osm_id, restriction, from_id, to_id)
        	SELECT rec.from_id, rec.to_id, rec.restriction, o.from_id, o.to_id
		FROM getMandatoryTurnRestrictions(rec.from_id, rec.to_id) AS o;
	END LOOP;
	/*
	Process no turn restrictions
	NOTE: no_u_turn is only processed where the osm_ids are different, the routing algorithms 
	will not perform u-turns, so we only need u-turns onto "different" roads (or carriageways)
	*/
	FOR rec IN 
		SELECT DISTINCT r.from_id, r.to_id, r.restriction 
		FROM osm_restrictions r
		WHERE r.restriction IN ('no_left_turn', 'no_straight_on', 'no_right_turn', 'no_u_turn')
		AND EXISTS (SELECT 1 FROM ways_clean f WHERE f.osm_id = r.from_id)
		AND EXISTS (SELECT 1 FROM ways_clean t WHERE t.osm_id = r.to_id)
		AND r.from_id != r.to_id
	LOOP
		INSERT INTO way_restrictions(from_osm_id, to_osm_id, restriction, from_id, to_id)
        	SELECT rec.from_id, rec.to_id, rec.restriction, o.from_id, o.to_id
		FROM getNoTurnRestrictions(rec.from_id, rec.to_id) AS o;
    END LOOP;
END 
$$;


ALTER FUNCTION setwayrestrictions() OWNER TO postgres;
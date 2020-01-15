-- Function: sheffield.nearestcarparkfootwaytonode(geometry, integer)

-- DROP FUNCTION sheffield.nearestcarparkfootwaytonode(geometry, integer);

CREATE OR REPLACE FUNCTION sheffield.nearestcarparkfootwaytonode(
    node geometry,
    carparkid integer)
  RETURNS bigint AS
$BODY$
/*
Find the closest car park walking entrance to a given geometry
*/
BEGIN
	RETURN
		(SELECT e.id 
		FROM sheffield.car_park_entrances e
		WHERE e.walk_allow = true
		AND e.car_park_id = carParkId
		ORDER BY e.geom <-> node
		LIMIT 1);
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION sheffield.nearestcarparkfootwaytonode(geometry, integer)
  OWNER TO postgres;

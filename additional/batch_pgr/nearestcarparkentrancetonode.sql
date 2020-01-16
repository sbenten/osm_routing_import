-- Function: nearestcarparkentrancetonode(geometry, double precision)

-- DROP FUNCTION nearestcarparkentrancetonode(geometry, double precision);

CREATE OR REPLACE FUNCTION nearestcarparkentrancetonode(
    node geometry,
    tolerence double precision DEFAULT '-1'::integer)
  RETURNS bigint AS
$BODY$
/*
Find the closest car park entrance to a given start point and a tolerance

Based on: Obe, R. O. & Hsu, L. S. pgRouting: A Practical Guide Locate Press, 2017
*/
DECLARE 
resultPoint geometry;
resultId bigint;
BEGIN
	SELECT e.geom, e.id INTO resultPoint, resultId
	FROM car_park_entrances e 
	JOIN car_parks p ON p.id = e.car_park_id
	WHERE p.access NOT IN ('private', 'customers', 'no', 'residents', 'club visitors', 'Disabled_Only')
	AND e.car_allow = true
	ORDER BY e.geom <-> node
	LIMIT 1;

	IF resultId IS NOT NULL AND (tolerence = -1 OR ST_DWithin(node, resultPoint, tolerence) ) THEN
		RETURN resultId;
	ELSE
        RAISE NOTICE 'No node within tolerance found';
        RETURN NULL;
    END IF;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION nearestcarparkentrancetonode(geometry, double precision)
  OWNER TO postgres;

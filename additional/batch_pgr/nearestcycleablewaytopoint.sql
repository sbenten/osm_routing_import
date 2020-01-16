-- Function: nearestcycleablewaytopoint(geometry, double precision)

-- DROP FUNCTION nearestcycleablewaytopoint(geometry, double precision);

CREATE OR REPLACE FUNCTION nearestcycleablewaytopoint(
    startpoint geometry,
    tolerence double precision DEFAULT '-1'::integer)
  RETURNS bigint AS
$BODY$
/*
Find the closest cycle allowed way to a given start point with an optional tolerance

Based on: Obe, R. O. & Hsu, L. S. pgRouting: A Practical Guide Locate Press, 2017
*/
DECLARE 
resultWay geometry;
resultId int8;
BEGIN
	SELECT c.geom, c.id INTO resultWay, resultId
	FROM way_points p
	JOIN ways_clean c ON c.id = p.ways_clean_id
	WHERE c.cycle_allow = true
	ORDER BY p.geom <-> startPoint
	LIMIT 1;

	IF resultId IS NOT NULL AND (tolerence = -1 OR ST_DWithin(startPoint, resultWay, tolerence) ) THEN
		RETURN resultId;
	ELSE
        RAISE NOTICE 'No node within tolerance found';
        RETURN NULL;
    END IF;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION nearestcycleablewaytopoint(geometry, double precision)
  OWNER TO postgres;

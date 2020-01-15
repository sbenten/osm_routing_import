-- Function: sheffield.nearestwalkablewaytopoint(geometry, double precision)

-- DROP FUNCTION sheffield.nearestwalkablewaytopoint(geometry, double precision);

CREATE OR REPLACE FUNCTION sheffield.nearestwalkablewaytopoint(
    startpoint geometry,
    tolerence double precision DEFAULT '-1'::integer)
  RETURNS bigint AS
$BODY$
/*
Find the closest car allowed way to a given start point with an optional tolerance
Also, specify an optional mode of transport 'C' = Car, 'B' = Bus, 'CY' = Cycle, 'W' = Walk

Based on: Obe, R. O. & Hsu, L. S. pgRouting: A Practical Guide Locate Press, 2017
*/
DECLARE 
resultWay geometry;
resultId int8;
BEGIN
	SELECT c.geom, c.id INTO resultWay, resultId
	FROM sheffield.way_points p
	JOIN sheffield.ways_clean c ON c.id = p.ways_clean_id
	WHERE c.walk_allow = true
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
ALTER FUNCTION sheffield.nearestwalkablewaytopoint(geometry, double precision)
  OWNER TO postgres;

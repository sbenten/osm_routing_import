-- Function: sheffield.nearestparkingnode(geometry)

-- DROP FUNCTION sheffield.nearestparkingnode(geometry);

CREATE OR REPLACE FUNCTION sheffield.nearestparkingnode(IN destination geometry)
  RETURNS TABLE(node_ind character varying, node_id integer, node_geom geometry, walk_id integer, walk_geom geometry) AS
$BODY$
--Find the closest car park entrance, or a node on a road with parking permitted, nearest the destination
--And also, the walking point on the network from where the car is parked
DECLARE 
resultPoint geometry;
resultId bigint;
BEGIN

	SELECT x.ind, x.id, x.geom INTO node_ind, node_id, node_geom 
	FROM (
		SELECT 'p' AS ind, i.id, i.geom
		FROM (
			SELECT v.id, v.the_geom AS geom
			FROM sheffield.vw_ways_clean_car_start_end v 
			ORDER BY v.the_geom <-> (
				SELECT e.geom
				FROM sheffield.car_park_entrances e 
				JOIN sheffield.car_parks p ON p.id = e.car_park_id
				WHERE (p.access IS NULL OR p.access NOT IN ('private', 'customers', 'no', 'residents', 'club visitors', 'Disabled_Only'))
				AND e.car_allow = true
				AND e.virtual IS NULL
				ORDER BY e.geom <-> destination
				LIMIT 1
			) 
			LIMIT 1
		) i
		UNION
		SELECT 'w' AS ind, v.id, v.the_geom AS geom
		FROM sheffield.vw_ways_clean_parking_start_end v
	) x
	ORDER BY x.geom <-> destination
	LIMIT 1;

	IF node_ind = 'w' THEN
		--if parking on the road, use the parking point walking starting point 
		walk_id := node_id;
		walk_geom := node_geom;
	ELSE
		SELECT v.id, v.the_geom INTO walk_id, walk_geom
		FROM sheffield.vw_ways_clean_car_start_end v 
		ORDER BY v.the_geom <-> (
			SELECT e.geom
			FROM sheffield.car_park_entrances e 
			JOIN sheffield.car_parks p ON p.id = e.car_park_id
			WHERE (p.access IS NULL OR p.access NOT IN ('private', 'customers', 'no', 'residents', 'club visitors', 'Disabled_Only'))
			AND e.walk_allow = true -- <--Walk start point
			AND e.virtual IS NULL
			ORDER BY e.geom <-> destination
			LIMIT 1
		) 
		LIMIT 1;
	END IF;  

	RETURN NEXT;

END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION sheffield.nearestparkingnode(geometry)
  OWNER TO postgres;

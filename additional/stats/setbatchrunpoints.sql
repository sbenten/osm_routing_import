-- Function: sheffield.setbatchrunpoints(integer)

-- DROP FUNCTION sheffield.setbatchrunpoints(integer);

CREATE OR REPLACE FUNCTION sheffield.setbatchrunpoints(batchrunid integer)
  RETURNS void AS
$BODY$
DECLARE
rec record;
BEGIN
	RAISE NOTICE 'Deleting any previous records for batch_run_id %', batchRunId;
	DELETE FROM sheffield.batch_run_res_points WHERE batch_run_id = batchRunId;

	RAISE NOTICE 'Creating points for edges traversed "forwards"';
	WITH w AS (
		SELECT id, geom, direction,
			batch_run_id, batch_item_id, group_id, sub_group_id,
			generate_series(1, (SELECT ST_NumPoints(geom))) AS num, 
			CASE 
				WHEN id = firstgroupnode THEN 1
				ELSE 0
			END AS firstgroupedge,
			CASE 
				WHEN id = lastgroupnode THEN 1
				ELSE 0
			END AS lastgroupedge
		FROM sheffield.vw_batch_run_results_base
		WHERE batch_run_id = batchRunId
		AND direction = 1
		AND group_id IS NOT NULL
		AND sub_group_id IS NOT NULL
		ORDER BY id
	),
	r AS (
		SELECT rid, geom FROM terrain.dtm_extent
	)
	INSERT INTO sheffield.batch_run_res_points (geom, batch_run_res_id, batch_run_id, batch_item_id, group_id, sub_group_id, dtm_id, first_node, last_node)
	SELECT ST_PointN(w.geom, w.num), 
		w.id, w.batch_run_id, w.batch_item_id, w.group_id, w.sub_group_id,
		(SELECT r.rid FROM r WHERE ST_Contains(r.geom, ST_PointN(w.geom, w.num))),
		CASE 
			WHEN w.firstgroupedge = 1 AND w.direction = 1 AND w.num = 1 THEN 1
			WHEN w.firstgroupedge = 1 AND w.direction = 0 AND w.num = MAX(w.num) OVER (PARTITION BY w.sub_group_id) THEN 1
			ELSE 0 
		END AS firstgroupnode,
		CASE 
			WHEN w.lastgroupedge = 1 AND w.direction = 1 AND w.num = MAX(w.num) OVER (PARTITION BY w.sub_group_id) THEN 1
			WHEN w.lastgroupedge = 1 AND w.direction = 0 AND w.num = 1 THEN 1
			ELSE 0
		END AS lastgroupnode
	FROM w
	ORDER BY w.id, w.num ASC;
	
	RAISE NOTICE 'Creating points for edges traversed "backwards"';
	WITH w AS (
		SELECT id, geom, direction,
			batch_run_id, batch_item_id, group_id, sub_group_id,
			generate_series((SELECT ST_NumPoints(geom)), 1, -1) AS num, 
			CASE 
				WHEN id = firstgroupnode THEN 1
				ELSE 0
			END AS firstgroupedge,
			CASE 
				WHEN id = lastgroupnode THEN 1
				ELSE 0
			END AS lastgroupedge
		FROM sheffield.vw_batch_run_results_base
		WHERE batch_run_id = batchRunId
		AND direction = 0		
		AND group_id IS NOT NULL
		AND sub_group_id IS NOT NULL
		ORDER BY id
	),
	r AS (
		SELECT rid, geom FROM terrain.dtm_extent
	)
	INSERT INTO sheffield.batch_run_res_points (geom, batch_run_res_id, batch_run_id, batch_item_id, group_id, sub_group_id, dtm_id, first_node, last_node)
	SELECT ST_PointN(w.geom, w.num), 
		w.id, w.batch_run_id, w.batch_item_id, w.group_id, w.sub_group_id,
		(SELECT r.rid FROM r WHERE ST_Contains(r.geom, ST_PointN(w.geom, w.num))),
		CASE 
			WHEN w.firstgroupedge = 1 AND w.direction = 1 AND w.num = 1 THEN 1
			WHEN w.firstgroupedge = 1 AND w.direction = 0 AND w.num = MAX(w.num) OVER (PARTITION BY w.sub_group_id) THEN 1
			ELSE 0 
		END AS firstgroupnode,
		CASE 
			WHEN w.lastgroupedge = 1 AND w.direction = 1 AND w.num = MAX(w.num) OVER (PARTITION BY w.sub_group_id) THEN 1
			WHEN w.lastgroupedge = 1 AND w.direction = 0 AND w.num = 1 THEN 1
			ELSE 0
		END AS lastgroupnode
	FROM w
	ORDER BY w.id, w.num desc;

	RAISE NOTICE 'Looking up altitude for each point';
	WITH r AS (
		SELECT rid, rast FROM terrain.dtm
	),
	p AS (
		SELECT id, geom, dtm_id FROM sheffield.batch_run_res_points WHERE batch_run_id = batchRunId
	)
	UPDATE sheffield.batch_run_res_points SET altitude = ST_Value(r.rast, p.geom) 
	FROM r, p
	WHERE sheffield.batch_run_res_points.id = p.id
	AND p.dtm_id = r.rid
	AND batch_run_id = batchRunId; 

	RAISE NOTICE 'Calculating distance between each point';
	FOR rec IN 
		SELECT DISTINCT group_id
		FROM sheffield.batch_run_res_points
		WHERE batch_run_id = batchRunId
	LOOP
		UPDATE sheffield.batch_run_res_points SET distance = s.dist
		FROM (
			SELECT id, 
			CASE 
				WHEN first_node = 1 THEN 0
				ELSE ST_Distance(geom, lag(geom) OVER (PARTITION BY group_id ORDER BY batch_run_res_id, id))
			END AS dist
			FROM sheffield.batch_run_res_points
			WHERE group_id = rec.group_id
			ORDER BY batch_run_res_id, id
		) s
		WHERE sheffield.batch_run_res_points.id = s.id;
	END LOOP;
END 
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION sheffield.setbatchrunpoints(integer)
  OWNER TO postgres;

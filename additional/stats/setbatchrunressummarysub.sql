-- Function: sheffield.setbatchrunressummarysub(integer, integer)

-- DROP FUNCTION sheffield.setbatchrunressummarysub(integer, integer);

CREATE OR REPLACE FUNCTION sheffield.setbatchrunressummarysub(
    batchrunid integer,
    direction integer)
  RETURNS void AS
$BODY$
DECLARE

rec record;
BEGIN

		--Clean up
		DELETE FROM sheffield.batch_run_res_summary_sub WHERE batch_run_id = batchRunId;

		FOR rec IN
			SELECT i.id AS batch_item_id 
			FROM sheffield.batch_runs r
			JOIN sheffield.batches b ON r.batch_id = b.id
			LEFT JOIN sheffield.batch_items i ON b.id = i.batch_id
			WHERE r.id = batchRunId
		LOOP
			BEGIN
				RAISE NOTICE 'Processing %', rec.batch_item_id;
				PERFORM sheffield.setBatchRunResSummarySubItem(rec.batch_item_id, direction);
			EXCEPTION
				WHEN OTHERS THEN
				RAISE NOTICE 'Failed to set batch summary information for batch item %, % %', rec.batch_item_id, SQLERRM, SQLSTATE;
			END;
		END LOOP;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION sheffield.setbatchrunressummarysub(integer, integer)
  OWNER TO postgres;
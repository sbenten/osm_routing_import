-- Function: setbatchrunressummarysub(integer, integer)

-- DROP FUNCTION setbatchrunressummarysub(integer, integer);

CREATE OR REPLACE FUNCTION setbatchrunressummarysub(
    batchrunid integer,
    direction integer)
  RETURNS void AS
$BODY$
DECLARE

rec record;
BEGIN

		--Clean up
		DELETE FROM batch_run_res_summary_sub WHERE batch_run_id = batchRunId;

		FOR rec IN
			SELECT i.id AS batch_item_id 
			FROM batch_runs r
			JOIN batches b ON r.batch_id = b.id
			LEFT JOIN batch_items i ON b.id = i.batch_id
			WHERE r.id = batchRunId
		LOOP
			BEGIN
				RAISE NOTICE 'Processing %', rec.batch_item_id;
				PERFORM setBatchRunResSummarySubItem(rec.batch_item_id, direction);
			EXCEPTION
				WHEN OTHERS THEN
				RAISE NOTICE 'Failed to set batch summary information for batch item %, % %', rec.batch_item_id, SQLERRM, SQLSTATE;
			END;
		END LOOP;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION setbatchrunressummarysub(integer, integer)
  OWNER TO postgres;
-- Function: setbatchrunressummarysubitem(integer, integer)

-- DROP FUNCTION setbatchrunressummarysubitem(integer, integer);

CREATE OR REPLACE FUNCTION setbatchrunressummarysubitem(
    batchitemid integer,
    direction integer)
  RETURNS void AS
$BODY$
DECLARE
rec record;

v_batch_id integer;
v_batch_run_id integer;
v_batch_item_id integer;
v_import_census_id integer;
v_group_id integer;
v_sub_group_id integer;
v_group_description character varying;
v_sub_group_description character varying;
v_mode character varying;
v_mode_filter integer;
v_sub_mode_filter integer;
v_batch_item_description character varying;
v_itemsource geometry(Point, 27700);
v_itemtarget geometry(Point, 27700);
v_active_length double precision;
v_active_cost_time double precision;
v_active_ascent double precision;
v_active_descent double precision;
v_active_cost_met double precision;
v_imd_code character varying;
v_imd_name character varying;
v_imd_ovrk integer;
v_imd_ovr_decile integer;
v_imd_ovr_quintile integer;
v_imd_hlthrk integer;
v_imd_hlth_decile integer;
v_imd_hlth_quintile integer;
			

BEGIN

	FOR rec IN
		SELECT DISTINCT group_id, sub_group_id
		FROM vw_batch_run_results_base
		WHERE batch_item_id = batchItemId
	LOOP
		BEGIN
			--NOTE: JUST USE GEOM FROM BASE VIEW
			--Attempt to create a LineString
			--However, these may be MutiLineStrings, so try and simplify later
			/*SELECT ST_MakeLine(i.geom) --ST_LineMerge(ST_Collect(i.geom)) 
			INTO v_geom
			FROM (
				SELECT geom 
				FROM batch_run_res_points
				WHERE sub_group_id = rec.sub_group_id
				ORDER BY batch_run_res_id, id
			) i;*/

			/*SELECT ST_LineMerge(ST_Collect(geom)) 
			INTO v_unknown
			FROM vw_batch_run_results_base
			WHERE sub_group_id = rec.sub_group_id;*/

			/*SELECT ST_LineMerge(ST_Collect(i.geom)) 
			INTO v_unknown
			FROM (
				SELECT geom 
				FROM vw_batch_run_results_base
				WHERE sub_group_id = rec.sub_group_id
				ORDER BY resseq
			) i;

			RAISE NOTICE '%', GeometryType(v_unknown);
			IF GeometryType(v_unknown) = 'MULTILINESTRING' THEN
				SELECT ST_MakeLine((dumped.dump_geom).geom) INTO v_geom 
				FROM (	
					SELECT ST_DUMP(v_unknown) AS dump_geom
				) AS dumped;
			ELSE
				v_geom := ST_MakeLine(v_unknown);
			END IF;*/
			
			SELECT
				batch_id,
				batch_run_id,
				batch_item_id,
				import_census_id,
				group_id,
				sub_group_id,
				group_description,
				sub_group_description,
				mode,
				mode_filter,
				sub_mode_filter,
				batch_item_description,
				itemsource,
				itemtarget
			INTO
				v_batch_id,
				v_batch_run_id,
				v_batch_item_id,
				v_import_census_id,
				v_group_id,
				v_sub_group_id,
				v_group_description,
				v_sub_group_description,
				v_mode,
				v_mode_filter,
				v_sub_mode_filter,
				v_batch_item_description,
				v_itemsource,
				v_itemtarget
			FROM vw_batch_run_results_base
			WHERE sub_group_id = rec.sub_group_id
			AND itemsource IS NOT NULL
			LIMIT 1;

			--Retrieve some IMD information
			SELECT 
				code, 
				name, 
				ovrk2015, 
				decile, 
				quintile, 
				hlth2015, 
				hlthdecile, 
				hlthquintile
			INTO 
				v_imd_code,
				v_imd_name,
				v_imd_ovrk,
				v_imd_ovr_decile,
				v_imd_ovr_quintile,
				v_imd_hlthrk,
				v_imd_hlth_decile,
				v_imd_hlth_quintile
			FROM lsoa_imd_sheffield --TODO Alter to use sheffield schema
			WHERE ST_Contains(geom, (CASE WHEN direction = 1 THEN v_itemsource ELSE v_itemtarget END))
			OR ST_Touches(geom, (CASE WHEN direction = 1 THEN v_itemsource ELSE v_itemtarget END));

			--Retrieve just the portion attibuted to active travel
			SELECT
				Coalesce(sum(length_m), 0),
				Coalesce(sum(delay_time_cost), 0),
				Coalesce(sum(totalascent), 0),
				Coalesce(sum(totaldescent), 0),
				Coalesce(sum(delay_met_cost), 0)
			INTO
				v_active_length,
				v_active_cost_time,
				v_active_ascent,
				v_active_descent,
				v_active_cost_met
			FROM vw_batch_run_results_base
			WHERE sub_group_id = rec.sub_group_id
			AND sub_mode_filter IN (3, 4);

			INSERT INTO batch_run_res_summary_sub
			SELECT nextval('batch_run_res_summary_sub_id_seq'),
				v_batch_id,
				v_batch_run_id,
				v_batch_item_id,
				v_group_id,
				v_sub_group_id,
				v_group_description,
				v_sub_group_description,
				v_mode,
				v_mode_filter,
				v_sub_mode_filter,
				v_batch_item_description,
				v_itemsource,
				v_itemtarget,
				Coalesce(sum(length_m), 0),
				sum(cost_time),
				sum(delay_time_cost),
				sum(totalascent),
				sum(totaldescent),
				sum(cost_met), 
				sum(delay_met_cost), 
				sum(delay_time_cost) * '00:00:01'::interval,
				to_char(sum(delay_time_cost) * '00:00:01'::interval, 'HH24:MI:SS'::text),
				sum((getfloatsetting('weight_female_average'::character varying) - getfloatsetting('weight_female_standard_deviation'::character varying)) * delay_met_cost / 60::double precision), --TODO Error in setting the MET cost calculates the MET in minutes, so needs dividing here into seconds
				sum(getfloatsetting('weight_female_average'::character varying) * delay_met_cost / 60::double precision),
				sum((getfloatsetting('weight_female_average'::character varying) + getfloatsetting('weight_female_standard_deviation'::character varying)) * delay_met_cost / 60::double precision),
				sum((getfloatsetting('weight_male_average'::character varying) - getfloatsetting('weight_male_standard_deviation'::character varying)) * delay_met_cost / 60::double precision),
				sum(getfloatsetting('weight_male_average'::character varying) * delay_met_cost / 60::double precision),
				sum((getfloatsetting('weight_male_average'::character varying) + getfloatsetting('weight_male_standard_deviation'::character varying)) * delay_met_cost / 60::double precision),
				v_active_length,
				v_active_cost_time,
				v_active_ascent,
				v_active_descent,
				v_active_cost_met, 
				v_active_cost_time * '00:00:01'::interval,
				to_char(v_active_cost_time * '00:00:01'::interval, 'HH24:MI:SS'::text),
				(getfloatsetting('weight_female_average'::character varying) - getfloatsetting('weight_female_standard_deviation'::character varying)) * v_active_cost_met / 60::double precision,
				getfloatsetting('weight_female_average'::character varying) * v_active_cost_met / 60::double precision,
				(getfloatsetting('weight_female_average'::character varying) + getfloatsetting('weight_female_standard_deviation'::character varying)) * v_active_cost_met / 60::double precision,
				(getfloatsetting('weight_male_average'::character varying) - getfloatsetting('weight_male_standard_deviation'::character varying)) * v_active_cost_met / 60::double precision,
				getfloatsetting('weight_male_average'::character varying) * v_active_cost_met / 60::double precision,
				(getfloatsetting('weight_male_average'::character varying) + getfloatsetting('weight_male_standard_deviation'::character varying)) * v_active_cost_met / 60::double precision,
				v_imd_code,
				v_imd_name,
				v_imd_ovrk,
				v_imd_ovr_decile,
				v_imd_ovr_quintile,
				v_imd_hlthrk,
				v_imd_hlth_decile,
				v_imd_hlth_quintile
			FROM vw_batch_run_results_base
			WHERE sub_group_id = rec.sub_group_id;
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE '% % % %', rec.group_id, rec.sub_group_id, SQLERRM, SQLSTATE;
		END;
	END LOOP;

END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION setbatchrunressummarysubitem(integer, integer)
  OWNER TO postgres;

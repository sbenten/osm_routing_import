-- Function: sheffield.setbatchrunsummary()

-- DROP FUNCTION sheffield.setbatchrunsummary();

CREATE OR REPLACE FUNCTION sheffield.setbatchrunsummary()
  RETURNS void AS
$BODY$
/*
batch_run_res_summary is a pivot of the data so that the summary for all modes is available for each individual mode.
Insert the results data for each group in the batch with a bbox of the extent of the groups per batch_item.
Used for viz purposes in the QGis atlas and for summary data.
The geom is the extent of the flow by all the modes of transport.
*/
BEGIN 

	INSERT INTO sheffield.batch_run_res_summary (batch_run_id, 
		batch_item_id, 
		group_id,
		batch_item_description,
		mode_filter,
		source,
		target,
		home_imd_code,
		home_imd_name,
		home_imd_rank,
		home_decile,
		home_quintile,
		home_imd_health_rank,
		home_health_decile,
		home_health_quintile)
	--Get basic details for each flow and by the method of transport
	SELECT DISTINCT batch_run_id, 
		batch_item_id, 
		group_id,
		batch_item_description,
		mode_filter,
		source,
		target,
		home_imd_code,
		home_imd_name,
		home_imd_rank,
		home_decile,
		home_quintile,
		home_imd_health_rank,
		home_health_decile,
		home_health_quintile
	FROM sheffield.batch_run_res_summary_sub;

	
	WITH w AS (
		--Get the extent of travel for all the modes of transport for each flow
		SELECT r.batch_run_id, r.batch_item_id,
			ST_SetSRID(ST_Extent(r.resgeom), 27700) AS geom
		FROM sheffield.vw_batch_run_results_base r
		GROUP BY r.batch_run_id, r.batch_item_id
	)
	UPDATE sheffield.batch_run_res_summary SET geom = w.geom
	FROM w
	WHERE sheffield.batch_run_res_summary.batch_item_id = w.batch_item_id;

	WITH t1 AS (
		SELECT batch_run_id, batch_item_id, group_id, 
			SUM(length_agg_cost) AS car_length_agg_cost,
			SUM(time_agg_cost) AS car_time_agg_cost,
			SUM(delay_time_agg_cost) AS car_delay_time_agg_cost,
			SUM(ascent_agg_cost) AS car_ascent_agg_cost,
			SUM(descent_agg_cost) AS car_descent_agg_cost,
			SUM(met_agg_cost) AS car_met_agg_cost,
			SUM(delay_met_agg_cost) AS car_delay_met_agg_cost,
			sum(delay_time_agg_cost) * '00:00:01'::interval AS car_delay_time_agg_interval,
			to_char(sum(delay_time_agg_cost) * '00:00:01'::interval, 'HH24:MI:SS'::text) AS car_delay_time_agg_format,
			SUM(female_minus_1sd_agg_calories) AS car_female_minus_1sd_agg_calories,
			SUM(female_average_agg_calories) AS car_female_average_agg_calories,
			SUM(female_plus_1sd_agg_calories) AS car_female_plus_1sd_agg_calories,
			SUM(male_minus_1sd_agg_calories) AS car_male_minus_1sd_agg_calories,
			SUM(male_average_agg_calories) AS car_male_average_agg_calories,
			SUM(male_plus_1sd_agg_calories) AS car_male_plus_1sd_agg_calories,
			SUM(active_length_agg_cost) AS car_active_length_agg_cost,
			SUM(active_time_agg_cost) AS car_active_time_agg_cost,
			SUM(active_ascent_agg_cost) AS car_active_ascent_agg_cost,
			SUM(active_descent_agg_cost) AS car_active_descent_agg_cost,
			SUM(active_met_agg_cost) AS car_active_met_agg_cost,
			sum(active_time_agg_cost) * '00:00:01'::interval AS car_active_delay_time_agg_interval,
			to_char(sum(active_time_agg_cost) * '00:00:01'::interval, 'HH24:MI:SS'::text) AS car_active_delay_time_agg_format,
			SUM(active_female_minus_1sd_agg_calories) AS car_active_female_minus_1sd_agg_calories,
			SUM(active_female_average_agg_calories) AS car_active_female_average_agg_calories,
			SUM(active_female_plus_1sd_agg_calories) AS car_active_female_plus_1sd_agg_calories,
			SUM(active_male_minus_1sd_agg_calories) AS car_active_male_minus_1sd_agg_calories,
			SUM(active_male_average_agg_calories) AS car_active_male_average_agg_calories,
			SUM(active_male_plus_1sd_agg_calories) AS car_active_male_plus_1sd_agg_calories
		FROM sheffield.batch_run_res_summary_sub
		WHERE mode_filter = 1 --Car opptimistic about parking
		GROUP BY batch_run_id, batch_item_id, group_id
	)
	UPDATE sheffield.batch_run_res_summary SET 
			car_length_agg_cost = t1.car_length_agg_cost,
			car_time_agg_cost = t1. car_time_agg_cost,
			car_delay_time_agg_cost = t1.car_delay_time_agg_cost,
			car_ascent_agg_cost = t1.car_ascent_agg_cost,
			car_descent_agg_cost = t1.car_descent_agg_cost,
			car_met_agg_cost = t1.car_met_agg_cost,
			car_delay_met_agg_cost = t1.car_delay_met_agg_cost,
			car_delay_time_agg_interval = t1.car_delay_time_agg_interval,
			car_delay_time_agg_format = t1.car_delay_time_agg_format,
			car_female_minus_1sd_agg_calories = t1.car_female_minus_1sd_agg_calories,
			car_female_average_agg_calories = t1.car_female_average_agg_calories,
			car_female_plus_1sd_agg_calories = t1.car_female_plus_1sd_agg_calories,
			car_male_minus_1sd_agg_calories = t1.car_male_minus_1sd_agg_calories,
			car_male_average_agg_calories = t1.car_male_average_agg_calories,
			car_male_plus_1sd_agg_calories = t1.car_male_plus_1sd_agg_calories,
			car_active_length_agg_cost = t1.car_active_length_agg_cost,
			car_active_time_agg_cost = t1.car_active_time_agg_cost,
			car_active_ascent_agg_cost = t1.car_active_ascent_agg_cost,
			car_active_descent_agg_cost = t1.car_active_descent_agg_cost,
			car_active_met_agg_cost = t1.car_active_met_agg_cost,
			car_active_delay_time_agg_interval = t1.car_active_delay_time_agg_interval,
			car_active_delay_time_agg_format = t1.car_active_delay_time_agg_format,
			car_active_female_minus_1sd_agg_calories = t1.car_active_female_minus_1sd_agg_calories,
			car_active_female_average_agg_calories = t1.car_active_female_average_agg_calories,
			car_active_female_plus_1sd_agg_calories = t1.car_active_female_plus_1sd_agg_calories,
			car_active_male_minus_1sd_agg_calories = t1.car_active_male_minus_1sd_agg_calories,
			car_active_male_average_agg_calories = t1.car_active_male_average_agg_calories,
			car_active_male_plus_1sd_agg_calories = t1.car_active_male_plus_1sd_agg_calories
	FROM t1
	WHERE sheffield.batch_run_res_summary.batch_item_id = t1.batch_item_id;

	WITH t2 AS (
	SELECT batch_run_id, batch_item_id, group_id, 
		SUM(length_agg_cost) AS park_length_agg_cost,
		SUM(time_agg_cost) AS park_time_agg_cost,
		SUM(delay_time_agg_cost) AS park_delay_time_agg_cost,
		SUM(ascent_agg_cost) AS park_ascent_agg_cost,
		SUM(descent_agg_cost) AS park_descent_agg_cost,
		SUM(met_agg_cost) AS park_met_agg_cost,
		SUM(delay_met_agg_cost) AS park_delay_met_agg_cost,
		sum(delay_time_agg_cost) * '00:00:01'::interval AS park_delay_time_agg_interval,
		to_char(sum(delay_time_agg_cost) * '00:00:01'::interval, 'HH24:MI:SS'::text) AS park_delay_time_agg_format,
		SUM(female_minus_1sd_agg_calories) AS park_female_minus_1sd_agg_calories,
		SUM(female_average_agg_calories) AS park_female_average_agg_calories,
		SUM(female_plus_1sd_agg_calories) AS park_female_plus_1sd_agg_calories,
		SUM(male_minus_1sd_agg_calories) AS park_male_minus_1sd_agg_calories,
		SUM(male_average_agg_calories) AS park_male_average_agg_calories,
		SUM(male_plus_1sd_agg_calories) AS park_male_plus_1sd_agg_calories,
		SUM(active_length_agg_cost) AS park_active_length_agg_cost,
		SUM(active_time_agg_cost) AS park_active_time_agg_cost,
		SUM(active_ascent_agg_cost) AS park_active_ascent_agg_cost,
		SUM(active_descent_agg_cost) AS park_active_descent_agg_cost,
		SUM(active_met_agg_cost) AS park_active_met_agg_cost,
		sum(active_time_agg_cost) * '00:00:01'::interval AS park_active_delay_time_agg_interval,
		to_char(sum(active_time_agg_cost) * '00:00:01'::interval, 'HH24:MI:SS'::text) AS park_active_delay_time_agg_format,
		SUM(active_female_minus_1sd_agg_calories) AS park_active_female_minus_1sd_agg_calories,
		SUM(active_female_average_agg_calories) AS park_active_female_average_agg_calories,
		SUM(active_female_plus_1sd_agg_calories) AS park_active_female_plus_1sd_agg_calories,
		SUM(active_male_minus_1sd_agg_calories) AS park_active_male_minus_1sd_agg_calories,
		SUM(active_male_average_agg_calories) AS park_active_male_average_agg_calories,
		SUM(active_male_plus_1sd_agg_calories) AS park_active_male_plus_1sd_agg_calories
	FROM sheffield.batch_run_res_summary_sub
	WHERE mode_filter = 2 --Car pessimistic about parking
	GROUP BY batch_run_id, batch_item_id, group_id
	)
	UPDATE sheffield.batch_run_res_summary SET 
		park_length_agg_cost = t2.park_length_agg_cost,
		park_time_agg_cost = t2.park_time_agg_cost,
		park_delay_time_agg_cost = t2.park_delay_time_agg_cost,
		park_ascent_agg_cost = t2.park_ascent_agg_cost,
		park_descent_agg_cost = t2.park_descent_agg_cost,
		park_met_agg_cost = t2.park_met_agg_cost,
		park_delay_met_agg_cost = t2.park_delay_met_agg_cost,
		park_delay_time_agg_interval = t2.park_delay_time_agg_interval,
		park_delay_time_agg_format = t2.park_delay_time_agg_format,
		park_female_minus_1sd_agg_calories = t2.park_female_minus_1sd_agg_calories,
		park_female_average_agg_calories = t2.park_female_average_agg_calories,
		park_female_plus_1sd_agg_calories = t2.park_female_plus_1sd_agg_calories,
		park_male_minus_1sd_agg_calories = t2.park_male_minus_1sd_agg_calories,
		park_male_average_agg_calories = t2.park_male_average_agg_calories,
		park_male_plus_1sd_agg_calories = t2.park_male_plus_1sd_agg_calories,
		park_active_length_agg_cost = t2.park_active_length_agg_cost,
		park_active_time_agg_cost = t2.park_active_time_agg_cost,
		park_active_ascent_agg_cost = t2.park_active_ascent_agg_cost,
		park_active_descent_agg_cost = t2.park_active_descent_agg_cost,
		park_active_met_agg_cost = t2.park_active_met_agg_cost,
		park_active_delay_time_agg_interval = t2.park_active_delay_time_agg_interval,
		park_active_delay_time_agg_format = t2.park_active_delay_time_agg_format,
		park_active_female_minus_1sd_agg_calories = t2.park_active_female_minus_1sd_agg_calories,
		park_active_female_average_agg_calories = t2.park_active_female_average_agg_calories,
		park_active_female_plus_1sd_agg_calories = t2.park_active_female_plus_1sd_agg_calories,
		park_active_male_minus_1sd_agg_calories = t2.park_active_male_minus_1sd_agg_calories,
		park_active_male_average_agg_calories = t2.park_active_male_average_agg_calories,
		park_active_male_plus_1sd_agg_calories = t2.park_active_male_plus_1sd_agg_calories
	FROM t2
	WHERE sheffield.batch_run_res_summary.batch_item_id = t2.batch_item_id;


	WITH t3 AS (
	SELECT batch_run_id, batch_item_id, group_id, 
		SUM(length_agg_cost) AS bike_length_agg_cost,
		SUM(time_agg_cost) AS bike_time_agg_cost,
		SUM(delay_time_agg_cost) AS bike_delay_time_agg_cost,
		SUM(ascent_agg_cost) AS bike_ascent_agg_cost,
		SUM(descent_agg_cost) AS bike_descent_agg_cost,
		SUM(met_agg_cost) AS bike_met_agg_cost,
		SUM(delay_met_agg_cost) AS bike_delay_met_agg_cost,
		sum(delay_time_agg_cost) * '00:00:01'::interval AS bike_delay_time_agg_interval,
		to_char(sum(delay_time_agg_cost) * '00:00:01'::interval, 'HH24:MI:SS'::text) AS bike_delay_time_agg_format,
		SUM(female_minus_1sd_agg_calories) AS bike_female_minus_1sd_agg_calories,
		SUM(female_average_agg_calories) AS bike_female_average_agg_calories,
		SUM(female_plus_1sd_agg_calories) AS bike_female_plus_1sd_agg_calories,
		SUM(male_minus_1sd_agg_calories) AS bike_male_minus_1sd_agg_calories,
		SUM(male_average_agg_calories) AS bike_male_average_agg_calories,
		SUM(male_plus_1sd_agg_calories) AS bike_male_plus_1sd_agg_calories,
		SUM(active_length_agg_cost) AS bike_active_length_agg_cost,
		SUM(active_time_agg_cost) AS bike_active_time_agg_cost,
		SUM(active_ascent_agg_cost) AS bike_active_ascent_agg_cost,
		SUM(active_descent_agg_cost) AS bike_active_descent_agg_cost,
		SUM(active_met_agg_cost) AS bike_active_met_agg_cost,
		sum(active_time_agg_cost) * '00:00:01'::interval AS bike_active_delay_time_agg_interval,
		to_char(sum(active_time_agg_cost) * '00:00:01'::interval, 'HH24:MI:SS'::text) AS bike_active_delay_time_agg_format,
		SUM(active_female_minus_1sd_agg_calories) AS bike_active_female_minus_1sd_agg_calories,
		SUM(active_female_average_agg_calories) AS bike_active_female_average_agg_calories,
		SUM(active_female_plus_1sd_agg_calories) AS bike_active_female_plus_1sd_agg_calories,
		SUM(active_male_minus_1sd_agg_calories) AS bike_active_male_minus_1sd_agg_calories,
		SUM(active_male_average_agg_calories) AS bike_active_male_average_agg_calories,
		SUM(active_male_plus_1sd_agg_calories) AS bike_active_male_plus_1sd_agg_calories
	FROM sheffield.batch_run_res_summary_sub
	WHERE mode_filter = 3 --Biking
	GROUP BY batch_run_id, batch_item_id, group_id
	)
	UPDATE sheffield.batch_run_res_summary SET 
		bike_length_agg_cost = t3.bike_length_agg_cost,
		bike_time_agg_cost = t3.bike_time_agg_cost,
		bike_delay_time_agg_cost = t3.bike_delay_time_agg_cost,
		bike_ascent_agg_cost = t3.bike_ascent_agg_cost,
		bike_descent_agg_cost = t3.bike_descent_agg_cost,
		bike_met_agg_cost = t3.bike_met_agg_cost,
		bike_delay_met_agg_cost = t3.bike_delay_met_agg_cost,
		bike_delay_time_agg_interval = t3.bike_delay_time_agg_interval,
		bike_delay_time_agg_format = t3.bike_delay_time_agg_format,
		bike_female_minus_1sd_agg_calories = t3.bike_female_minus_1sd_agg_calories,
		bike_female_average_agg_calories = t3.bike_female_average_agg_calories,
		bike_female_plus_1sd_agg_calories = t3.bike_female_plus_1sd_agg_calories,
		bike_male_minus_1sd_agg_calories = t3.bike_male_minus_1sd_agg_calories,
		bike_male_average_agg_calories = t3.bike_male_average_agg_calories,
		bike_male_plus_1sd_agg_calories = t3.bike_male_plus_1sd_agg_calories,
		bike_active_length_agg_cost = t3.bike_active_length_agg_cost,
		bike_active_time_agg_cost = t3.bike_active_time_agg_cost,
		bike_active_ascent_agg_cost = t3.bike_active_ascent_agg_cost,
		bike_active_descent_agg_cost = t3.bike_active_descent_agg_cost,
		bike_active_met_agg_cost = t3.bike_active_met_agg_cost,
		bike_active_delay_time_agg_interval = t3.bike_active_delay_time_agg_interval,
		bike_active_delay_time_agg_format = t3.bike_active_delay_time_agg_format,
		bike_active_female_minus_1sd_agg_calories = t3.bike_active_female_minus_1sd_agg_calories,
		bike_active_female_average_agg_calories = t3.bike_active_female_average_agg_calories,
		bike_active_female_plus_1sd_agg_calories = t3.bike_active_female_plus_1sd_agg_calories,
		bike_active_male_minus_1sd_agg_calories = t3.bike_active_male_minus_1sd_agg_calories,
		bike_active_male_average_agg_calories = t3.bike_active_male_average_agg_calories,
		bike_active_male_plus_1sd_agg_calories = t3.bike_active_male_plus_1sd_agg_calories
	FROM t3
	WHERE sheffield.batch_run_res_summary.batch_item_id = t3.batch_item_id;


	WITH t4 AS (
	SELECT batch_run_id, batch_item_id, group_id, 
		SUM(length_agg_cost) AS walk_length_agg_cost,
		SUM(time_agg_cost) AS walk_time_agg_cost,
		SUM(delay_time_agg_cost) AS walk_delay_time_agg_cost,
		SUM(ascent_agg_cost) AS walk_ascent_agg_cost,
		SUM(descent_agg_cost) AS walk_descent_agg_cost,
		SUM(met_agg_cost) AS walk_met_agg_cost,
		SUM(delay_met_agg_cost) AS walk_delay_met_agg_cost,
		sum(delay_time_agg_cost) * '00:00:01'::interval AS walk_delay_time_agg_interval,
		to_char(sum(delay_time_agg_cost) * '00:00:01'::interval, 'HH24:MI:SS'::text) AS walk_delay_time_agg_format,
		SUM(female_minus_1sd_agg_calories) AS walk_female_minus_1sd_agg_calories,
		SUM(female_average_agg_calories) AS walk_female_average_agg_calories,
		SUM(female_plus_1sd_agg_calories) AS walk_female_plus_1sd_agg_calories,
		SUM(male_minus_1sd_agg_calories) AS walk_male_minus_1sd_agg_calories,
		SUM(male_average_agg_calories) AS walk_male_average_agg_calories,
		SUM(male_plus_1sd_agg_calories) AS walk_male_plus_1sd_agg_calories,
		SUM(active_length_agg_cost) AS walk_active_length_agg_cost,
		SUM(active_time_agg_cost) AS walk_active_time_agg_cost,
		SUM(active_ascent_agg_cost) AS walk_active_ascent_agg_cost,
		SUM(active_descent_agg_cost) AS walk_active_descent_agg_cost,
		SUM(active_met_agg_cost) AS walk_active_met_agg_cost,
		sum(active_time_agg_cost) * '00:00:01'::interval AS walk_active_delay_time_agg_interval,
		to_char(sum(active_time_agg_cost) * '00:00:01'::interval, 'HH24:MI:SS'::text) AS walk_active_delay_time_agg_format,
		SUM(active_female_minus_1sd_agg_calories) AS walk_active_female_minus_1sd_agg_calories,
		SUM(active_female_average_agg_calories) AS walk_active_female_average_agg_calories,
		SUM(active_female_plus_1sd_agg_calories) AS walk_active_female_plus_1sd_agg_calories,
		SUM(active_male_minus_1sd_agg_calories) AS walk_active_male_minus_1sd_agg_calories,
		SUM(active_male_average_agg_calories) AS walk_active_male_average_agg_calories,
		SUM(active_male_plus_1sd_agg_calories) AS walk_active_male_plus_1sd_agg_calories
	FROM sheffield.batch_run_res_summary_sub
	WHERE mode_filter = 4 --Walking
	GROUP BY batch_run_id, batch_item_id, group_id
	)
	UPDATE sheffield.batch_run_res_summary SET
		walk_length_agg_cost = t4.walk_length_agg_cost,
		walk_time_agg_cost = t4.walk_time_agg_cost,
		walk_delay_time_agg_cost = t4.walk_delay_time_agg_cost,
		walk_ascent_agg_cost = t4.walk_ascent_agg_cost,
		walk_descent_agg_cost = t4.walk_descent_agg_cost,
		walk_met_agg_cost = t4.walk_met_agg_cost,
		walk_delay_met_agg_cost = t4.walk_delay_met_agg_cost,
		walk_delay_time_agg_interval = t4.walk_delay_time_agg_interval,
		walk_delay_time_agg_format = t4.walk_delay_time_agg_format,
		walk_female_minus_1sd_agg_calories = t4.walk_female_minus_1sd_agg_calories,
		walk_female_average_agg_calories = t4.walk_female_average_agg_calories,
		walk_female_plus_1sd_agg_calories = t4.walk_female_plus_1sd_agg_calories,
		walk_male_minus_1sd_agg_calories = t4.walk_male_minus_1sd_agg_calories,
		walk_male_average_agg_calories = t4.walk_male_average_agg_calories,
		walk_male_plus_1sd_agg_calories = t4.walk_male_plus_1sd_agg_calories,
		walk_active_length_agg_cost = t4.walk_active_length_agg_cost,
		walk_active_time_agg_cost = t4.walk_active_time_agg_cost,
		walk_active_ascent_agg_cost = t4.walk_active_ascent_agg_cost,
		walk_active_descent_agg_cost = t4.walk_active_descent_agg_cost,
		walk_active_met_agg_cost = t4.walk_active_met_agg_cost,
		walk_active_delay_time_agg_interval = t4.walk_active_delay_time_agg_interval,
		walk_active_delay_time_agg_format = t4.walk_active_delay_time_agg_format,
		walk_active_female_minus_1sd_agg_calories = t4.walk_active_female_minus_1sd_agg_calories,
		walk_active_female_average_agg_calories = t4. walk_active_female_average_agg_calories,
		walk_active_female_plus_1sd_agg_calories = t4.walk_active_female_plus_1sd_agg_calories,
		walk_active_male_minus_1sd_agg_calories = t4.walk_active_male_minus_1sd_agg_calories,
		walk_active_male_average_agg_calories = t4.walk_active_male_average_agg_calories,
		walk_active_male_plus_1sd_agg_calories = t4.walk_active_male_plus_1sd_agg_calories
	FROM t4
	WHERE sheffield.batch_run_res_summary.batch_item_id = t4.batch_item_id;


	WITH t6 AS (
	SELECT batch_run_id, batch_item_id, group_id, 
		SUM(length_agg_cost) AS pt_length_agg_cost,
		SUM(time_agg_cost) AS pt_time_agg_cost,
		SUM(delay_time_agg_cost) AS pt_delay_time_agg_cost,
		SUM(ascent_agg_cost) AS pt_ascent_agg_cost,
		SUM(descent_agg_cost) AS pt_descent_agg_cost,
		SUM(met_agg_cost) AS pt_met_agg_cost,
		SUM(delay_met_agg_cost) AS pt_delay_met_agg_cost,
		sum(delay_time_agg_cost) * '00:00:01'::interval AS pt_delay_time_agg_interval,
		to_char(sum(delay_time_agg_cost) * '00:00:01'::interval, 'HH24:MI:SS'::text) AS pt_delay_time_agg_format,
		SUM(female_minus_1sd_agg_calories) AS pt_female_minus_1sd_agg_calories,
		SUM(female_average_agg_calories) AS pt_female_average_agg_calories,
		SUM(female_plus_1sd_agg_calories) AS pt_female_plus_1sd_agg_calories,
		SUM(male_minus_1sd_agg_calories) AS pt_male_minus_1sd_agg_calories,
		SUM(male_average_agg_calories) AS pt_male_average_agg_calories,
		SUM(male_plus_1sd_agg_calories) AS pt_male_plus_1sd_agg_calories,
		SUM(active_length_agg_cost) AS pt_active_length_agg_cost,
		SUM(active_time_agg_cost) AS pt_active_time_agg_cost,
		SUM(active_ascent_agg_cost) AS pt_active_ascent_agg_cost,
		SUM(active_descent_agg_cost) AS pt_active_descent_agg_cost,
		SUM(active_met_agg_cost) AS pt_active_met_agg_cost,
		sum(active_time_agg_cost) * '00:00:01'::interval AS pt_active_delay_time_agg_interval,
		to_char(sum(active_time_agg_cost) * '00:00:01'::interval, 'HH24:MI:SS'::text) AS pt_active_delay_time_agg_format,
		SUM(active_female_minus_1sd_agg_calories) AS pt_active_female_minus_1sd_agg_calories,
		SUM(active_female_average_agg_calories) AS pt_active_female_average_agg_calories,
		SUM(active_female_plus_1sd_agg_calories) AS pt_active_female_plus_1sd_agg_calories,
		SUM(active_male_minus_1sd_agg_calories) AS pt_active_male_minus_1sd_agg_calories,
		SUM(active_male_average_agg_calories) AS pt_active_male_average_agg_calories,
		SUM(active_male_plus_1sd_agg_calories) AS pt_active_male_plus_1sd_agg_calories		
	FROM sheffield.batch_run_res_summary_sub
	WHERE mode_filter = 6 --Public transport
	GROUP BY batch_run_id, batch_item_id, group_id
	)
	UPDATE sheffield.batch_run_res_summary SET
		pt_length_agg_cost = t6.pt_length_agg_cost,
		pt_time_agg_cost = t6.pt_time_agg_cost,
		pt_delay_time_agg_cost = t6.pt_delay_time_agg_cost,
		pt_ascent_agg_cost = t6.pt_ascent_agg_cost,
		pt_descent_agg_cost = t6.pt_descent_agg_cost,
		pt_met_agg_cost = t6.pt_met_agg_cost,
		pt_delay_met_agg_cost = t6.pt_delay_met_agg_cost,
		pt_delay_time_agg_interval = t6.pt_delay_time_agg_interval,
		pt_delay_time_agg_format = t6.pt_delay_time_agg_format,
		pt_female_minus_1sd_agg_calories = t6.pt_female_minus_1sd_agg_calories,
		pt_female_average_agg_calories = t6.pt_female_average_agg_calories,
		pt_female_plus_1sd_agg_calories = t6.pt_female_plus_1sd_agg_calories,
		pt_male_minus_1sd_agg_calories = t6.pt_male_minus_1sd_agg_calories,
		pt_male_average_agg_calories = t6.pt_male_average_agg_calories,
		pt_male_plus_1sd_agg_calories = t6.pt_male_plus_1sd_agg_calories,
		pt_active_length_agg_cost = t6.pt_active_length_agg_cost,
		pt_active_time_agg_cost = t6.pt_active_time_agg_cost,
		pt_active_ascent_agg_cost = t6.pt_active_ascent_agg_cost,
		pt_active_descent_agg_cost = t6.pt_active_descent_agg_cost,
		pt_active_met_agg_cost = t6.pt_active_met_agg_cost,
		pt_active_delay_time_agg_interval = t6.pt_active_delay_time_agg_interval,
		pt_active_delay_time_agg_format = t6.pt_active_delay_time_agg_format,
		pt_active_female_minus_1sd_agg_calories = t6.pt_active_female_minus_1sd_agg_calories,
		pt_active_female_average_agg_calories = t6.pt_active_female_average_agg_calories,
		pt_active_female_plus_1sd_agg_calories = t6.pt_active_female_plus_1sd_agg_calories,
		pt_active_male_minus_1sd_agg_calories = t6.pt_active_male_minus_1sd_agg_calories,
		pt_active_male_average_agg_calories = t6.pt_active_male_average_agg_calories,
		pt_active_male_plus_1sd_agg_calories = t6.pt_active_male_plus_1sd_agg_calories
	FROM t6
	WHERE sheffield.batch_run_res_summary.batch_item_id = t6.batch_item_id;


	--Store the current costs for the mode, just saves looking them up later
	UPDATE sheffield.batch_run_res_summary SET 
			length_agg_cost = CASE WHEN mode_filter = 1 THEN car_length_agg_cost
						WHEN mode_filter = 2 THEN park_length_agg_cost
						WHEN mode_filter = 3 THEN bike_length_agg_cost
						WHEN mode_filter = 4 THEN walk_length_agg_cost
						WHEN mode_filter = 6 THEN pt_length_agg_cost
					END,
			time_agg_cost = CASE WHEN mode_filter = 1 THEN car_time_agg_cost
						WHEN mode_filter = 2 THEN park_time_agg_cost
						WHEN mode_filter = 3 THEN bike_time_agg_cost
						WHEN mode_filter = 4 THEN walk_time_agg_cost
						WHEN mode_filter = 6 THEN pt_time_agg_cost
					END,
			delay_time_agg_cost = CASE WHEN mode_filter = 1 THEN car_delay_time_agg_cost
						WHEN mode_filter = 2 THEN park_delay_time_agg_cost
						WHEN mode_filter = 3 THEN bike_delay_time_agg_cost
						WHEN mode_filter = 4 THEN walk_delay_time_agg_cost
						WHEN mode_filter = 6 THEN pt_delay_time_agg_cost
					END,
			ascent_agg_cost = CASE WHEN mode_filter = 1 THEN car_ascent_agg_cost
						WHEN mode_filter = 2 THEN park_ascent_agg_cost
						WHEN mode_filter = 3 THEN bike_ascent_agg_cost
						WHEN mode_filter = 4 THEN walk_ascent_agg_cost
						WHEN mode_filter = 6 THEN pt_ascent_agg_cost
					END,
			descent_agg_cost = CASE WHEN mode_filter = 1 THEN car_descent_agg_cost
						WHEN mode_filter = 2 THEN park_descent_agg_cost
						WHEN mode_filter = 3 THEN bike_descent_agg_cost
						WHEN mode_filter = 4 THEN walk_descent_agg_cost
						WHEN mode_filter = 6 THEN pt_descent_agg_cost
					END,
			met_agg_cost = CASE WHEN mode_filter = 1 THEN car_met_agg_cost
						WHEN mode_filter = 2 THEN park_met_agg_cost
						WHEN mode_filter = 3 THEN bike_met_agg_cost
						WHEN mode_filter = 4 THEN walk_met_agg_cost
						WHEN mode_filter = 6 THEN pt_met_agg_cost
					END,
			delay_met_agg_cost = CASE WHEN mode_filter = 1 THEN car_delay_met_agg_cost
						WHEN mode_filter = 2 THEN park_delay_met_agg_cost
						WHEN mode_filter = 3 THEN bike_delay_met_agg_cost
						WHEN mode_filter = 4 THEN walk_delay_met_agg_cost
						WHEN mode_filter = 6 THEN pt_delay_met_agg_cost
					END,
			delay_time_agg_interval = CASE WHEN mode_filter = 1 THEN car_delay_time_agg_interval
						WHEN mode_filter = 2 THEN park_delay_time_agg_interval
						WHEN mode_filter = 3 THEN bike_delay_time_agg_interval
						WHEN mode_filter = 4 THEN walk_delay_time_agg_interval
						WHEN mode_filter = 6 THEN pt_delay_time_agg_interval
					END,
			delay_time_agg_format = CASE WHEN mode_filter = 1 THEN car_delay_time_agg_format
						WHEN mode_filter = 2 THEN park_delay_time_agg_format
						WHEN mode_filter = 3 THEN bike_delay_time_agg_format
						WHEN mode_filter = 4 THEN walk_delay_time_agg_format
						WHEN mode_filter = 6 THEN pt_delay_time_agg_format
					END,
			female_minus_1sd_agg_calories = CASE WHEN mode_filter = 1 THEN car_female_minus_1sd_agg_calories
						WHEN mode_filter = 2 THEN park_female_minus_1sd_agg_calories
						WHEN mode_filter = 3 THEN bike_female_minus_1sd_agg_calories
						WHEN mode_filter = 4 THEN walk_female_minus_1sd_agg_calories
						WHEN mode_filter = 6 THEN pt_female_minus_1sd_agg_calories
					END,
			female_average_agg_calories = CASE WHEN mode_filter = 1 THEN car_female_average_agg_calories
						WHEN mode_filter = 2 THEN park_female_average_agg_calories
						WHEN mode_filter = 3 THEN bike_female_average_agg_calories
						WHEN mode_filter = 4 THEN walk_female_average_agg_calories
						WHEN mode_filter = 6 THEN pt_female_average_agg_calories
					END,
			female_plus_1sd_agg_calories = CASE WHEN mode_filter = 1 THEN car_female_plus_1sd_agg_calories
						WHEN mode_filter = 2 THEN park_female_plus_1sd_agg_calories
						WHEN mode_filter = 3 THEN bike_female_plus_1sd_agg_calories
						WHEN mode_filter = 4 THEN walk_female_plus_1sd_agg_calories
						WHEN mode_filter = 6 THEN pt_female_plus_1sd_agg_calories
					END,
			male_minus_1sd_agg_calories = CASE WHEN mode_filter = 1 THEN car_male_minus_1sd_agg_calories
						WHEN mode_filter = 2 THEN park_male_minus_1sd_agg_calories
						WHEN mode_filter = 3 THEN bike_male_minus_1sd_agg_calories
						WHEN mode_filter = 4 THEN walk_male_minus_1sd_agg_calories
						WHEN mode_filter = 6 THEN pt_male_minus_1sd_agg_calories
					END,
			male_average_agg_calories = CASE WHEN mode_filter = 1 THEN car_male_average_agg_calories
						WHEN mode_filter = 2 THEN park_male_average_agg_calories
						WHEN mode_filter = 3 THEN bike_male_average_agg_calories
						WHEN mode_filter = 4 THEN walk_male_average_agg_calories
						WHEN mode_filter = 6 THEN pt_male_average_agg_calories
					END,
			male_plus_1sd_agg_calories = CASE WHEN mode_filter = 1 THEN car_male_plus_1sd_agg_calories
						WHEN mode_filter = 2 THEN park_male_plus_1sd_agg_calories
						WHEN mode_filter = 3 THEN bike_male_plus_1sd_agg_calories
						WHEN mode_filter = 4 THEN walk_male_plus_1sd_agg_calories
						WHEN mode_filter = 6 THEN pt_male_plus_1sd_agg_calories
					END,
			active_length_agg_cost = CASE WHEN mode_filter = 1 THEN car_active_length_agg_cost
						WHEN mode_filter = 2 THEN park_active_length_agg_cost
						WHEN mode_filter = 3 THEN bike_active_length_agg_cost
						WHEN mode_filter = 4 THEN walk_active_length_agg_cost
						WHEN mode_filter = 6 THEN pt_active_length_agg_cost
					END,
			active_time_agg_cost = CASE WHEN mode_filter = 1 THEN car_active_time_agg_cost
						WHEN mode_filter = 2 THEN park_active_time_agg_cost
						WHEN mode_filter = 3 THEN bike_active_time_agg_cost
						WHEN mode_filter = 4 THEN walk_active_time_agg_cost
						WHEN mode_filter = 6 THEN pt_active_time_agg_cost
					END,
			active_ascent_agg_cost = CASE WHEN mode_filter = 1 THEN car_active_ascent_agg_cost
						WHEN mode_filter = 2 THEN park_active_ascent_agg_cost
						WHEN mode_filter = 3 THEN bike_active_ascent_agg_cost
						WHEN mode_filter = 4 THEN walk_active_ascent_agg_cost
						WHEN mode_filter = 6 THEN pt_active_ascent_agg_cost
					END,
			active_descent_agg_cost = CASE WHEN mode_filter = 1 THEN car_active_descent_agg_cost
						WHEN mode_filter = 2 THEN park_active_descent_agg_cost
						WHEN mode_filter = 3 THEN bike_active_descent_agg_cost
						WHEN mode_filter = 4 THEN walk_active_descent_agg_cost
						WHEN mode_filter = 6 THEN pt_active_descent_agg_cost
					END,
			active_met_agg_cost = CASE WHEN mode_filter = 1 THEN car_active_met_agg_cost
						WHEN mode_filter = 2 THEN park_active_met_agg_cost
						WHEN mode_filter = 3 THEN bike_active_met_agg_cost
						WHEN mode_filter = 4 THEN walk_active_met_agg_cost
						WHEN mode_filter = 6 THEN pt_active_met_agg_cost
					END,
			active_delay_time_agg_interval = CASE WHEN mode_filter = 1 THEN car_active_delay_time_agg_interval
						WHEN mode_filter = 2 THEN park_active_delay_time_agg_interval
						WHEN mode_filter = 3 THEN bike_active_delay_time_agg_interval
						WHEN mode_filter = 4 THEN walk_active_delay_time_agg_interval
						WHEN mode_filter = 6 THEN pt_active_delay_time_agg_interval
					END,
			active_delay_time_agg_format = CASE WHEN mode_filter = 1 THEN car_active_delay_time_agg_format
						WHEN mode_filter = 2 THEN park_active_delay_time_agg_format
						WHEN mode_filter = 3 THEN bike_active_delay_time_agg_format
						WHEN mode_filter = 4 THEN walk_active_delay_time_agg_format
						WHEN mode_filter = 6 THEN pt_active_delay_time_agg_format
					END,
			active_female_minus_1sd_agg_calories = CASE WHEN mode_filter = 1 THEN car_active_female_minus_1sd_agg_calories
						WHEN mode_filter = 2 THEN park_active_female_minus_1sd_agg_calories
						WHEN mode_filter = 3 THEN bike_active_female_minus_1sd_agg_calories
						WHEN mode_filter = 4 THEN walk_active_female_minus_1sd_agg_calories
						WHEN mode_filter = 6 THEN pt_active_female_minus_1sd_agg_calories
					END,
			active_female_average_agg_calories = CASE WHEN mode_filter = 1 THEN car_active_female_average_agg_calories
						WHEN mode_filter = 2 THEN park_active_female_average_agg_calories
						WHEN mode_filter = 3 THEN bike_active_female_average_agg_calories
						WHEN mode_filter = 4 THEN walk_active_female_average_agg_calories
						WHEN mode_filter = 6 THEN pt_active_female_average_agg_calories
					END,
			active_female_plus_1sd_agg_calories = CASE WHEN mode_filter = 1 THEN car_active_female_plus_1sd_agg_calories
						WHEN mode_filter = 2 THEN park_active_female_plus_1sd_agg_calories
						WHEN mode_filter = 3 THEN bike_active_female_plus_1sd_agg_calories
						WHEN mode_filter = 4 THEN walk_active_female_plus_1sd_agg_calories
						WHEN mode_filter = 6 THEN pt_active_female_plus_1sd_agg_calories
					END,
			active_male_minus_1sd_agg_calories = CASE WHEN mode_filter = 1 THEN car_active_male_minus_1sd_agg_calories
						WHEN mode_filter = 2 THEN park_active_male_minus_1sd_agg_calories
						WHEN mode_filter = 3 THEN bike_active_male_minus_1sd_agg_calories
						WHEN mode_filter = 4 THEN walk_active_male_minus_1sd_agg_calories
						WHEN mode_filter = 6 THEN pt_active_male_minus_1sd_agg_calories
					END,
			active_male_average_agg_calories = CASE WHEN mode_filter = 1 THEN car_active_male_average_agg_calories
						WHEN mode_filter = 2 THEN park_active_male_average_agg_calories
						WHEN mode_filter = 3 THEN bike_active_male_average_agg_calories
						WHEN mode_filter = 4 THEN walk_active_male_average_agg_calories
						WHEN mode_filter = 6 THEN pt_active_male_average_agg_calories
					END,
			active_male_plus_1sd_agg_calories = CASE WHEN mode_filter = 1 THEN car_active_male_plus_1sd_agg_calories
						WHEN mode_filter = 2 THEN park_active_male_plus_1sd_agg_calories
						WHEN mode_filter = 3 THEN bike_active_male_plus_1sd_agg_calories
						WHEN mode_filter = 4 THEN walk_active_male_plus_1sd_agg_calories
						WHEN mode_filter = 6 THEN pt_active_male_plus_1sd_agg_calories
					END
	;



END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION sheffield.setbatchrunsummary()
  OWNER TO postgres;

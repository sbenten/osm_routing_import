-- Table: batch_run_res_summary

-- DROP TABLE batch_run_res_summary;

CREATE TABLE batch_run_res_summary
(
  batch_run_id integer NOT NULL,
  batch_item_id integer NOT NULL,
  group_id integer NOT NULL,
  batch_item_description character varying,
  mode_filter integer NOT NULL,
  source geometry(Point,27700),
  target geometry(Point,27700),
  home_imd_code character varying,
  home_imd_name character varying,
  home_imd_rank integer NOT NULL DEFAULT 0,
  home_decile integer NOT NULL DEFAULT 0,
  home_quintile integer NOT NULL DEFAULT 0,
  home_imd_health_rank integer NOT NULL DEFAULT 0,
  home_health_decile integer NOT NULL DEFAULT 0,
  home_health_quintile integer NOT NULL DEFAULT 0,
  geom geometry(Polygon,27700),
  length_agg_cost double precision,
  time_agg_cost double precision,
  delay_time_agg_cost double precision,
  ascent_agg_cost double precision,
  descent_agg_cost double precision,
  met_agg_cost double precision,
  delay_met_agg_cost double precision,
  delay_time_agg_interval interval,
  delay_time_agg_format character varying,
  female_minus_1sd_agg_calories double precision,
  female_average_agg_calories double precision,
  female_plus_1sd_agg_calories double precision,
  male_average_agg_calories double precision,
  male_minus_1sd_agg_calories double precision,
  male_plus_1sd_agg_calories double precision,
  active_length_agg_cost double precision,
  active_time_agg_cost double precision,
  active_ascent_agg_cost double precision,
  active_descent_agg_cost double precision,
  active_met_agg_cost double precision,
  active_delay_time_agg_interval interval,
  active_delay_time_agg_format character varying,
  active_female_minus_1sd_agg_calories double precision,
  active_female_average_agg_calories double precision,
  active_female_plus_1sd_agg_calories double precision,
  active_male_minus_1sd_agg_calories double precision,
  active_male_average_agg_calories double precision,
  active_male_plus_1sd_agg_calories double precision,
  car_length_agg_cost double precision,
  car_time_agg_cost double precision,
  car_delay_time_agg_cost double precision,
  car_ascent_agg_cost double precision,
  car_descent_agg_cost double precision,
  car_met_agg_cost double precision,
  car_delay_met_agg_cost double precision,
  car_delay_time_agg_interval interval,
  car_delay_time_agg_format character varying,
  car_female_minus_1sd_agg_calories double precision,
  car_female_average_agg_calories double precision,
  car_female_plus_1sd_agg_calories double precision,
  car_male_average_agg_calories double precision,
  car_male_minus_1sd_agg_calories double precision,
  car_male_plus_1sd_agg_calories double precision,
  car_active_length_agg_cost double precision,
  car_active_time_agg_cost double precision,
  car_active_ascent_agg_cost double precision,
  car_active_descent_agg_cost double precision,
  car_active_met_agg_cost double precision,
  car_active_delay_time_agg_interval interval,
  car_active_delay_time_agg_format character varying,
  car_active_female_minus_1sd_agg_calories double precision,
  car_active_female_average_agg_calories double precision,
  car_active_female_plus_1sd_agg_calories double precision,
  car_active_male_minus_1sd_agg_calories double precision,
  car_active_male_average_agg_calories double precision,
  car_active_male_plus_1sd_agg_calories double precision,
  park_length_agg_cost double precision,
  park_time_agg_cost double precision,
  park_delay_time_agg_cost double precision,
  park_ascent_agg_cost double precision,
  park_descent_agg_cost double precision,
  park_met_agg_cost double precision,
  park_delay_met_agg_cost double precision,
  park_delay_time_agg_interval interval,
  park_delay_time_agg_format character varying,
  park_female_minus_1sd_agg_calories double precision,
  park_female_average_agg_calories double precision,
  park_female_plus_1sd_agg_calories double precision,
  park_male_minus_1sd_agg_calories double precision,
  park_male_average_agg_calories double precision,
  park_male_plus_1sd_agg_calories double precision,
  park_active_length_agg_cost double precision,
  park_active_time_agg_cost double precision,
  park_active_ascent_agg_cost double precision,
  park_active_descent_agg_cost double precision,
  park_active_met_agg_cost double precision,
  park_active_delay_time_agg_interval interval,
  park_active_delay_time_agg_format character varying,
  park_active_female_minus_1sd_agg_calories double precision,
  park_active_female_average_agg_calories double precision,
  park_active_female_plus_1sd_agg_calories double precision,
  park_active_male_minus_1sd_agg_calories double precision,
  park_active_male_average_agg_calories double precision,
  park_active_male_plus_1sd_agg_calories double precision,
  bike_length_agg_cost double precision,
  bike_time_agg_cost double precision,
  bike_delay_time_agg_cost double precision,
  bike_ascent_agg_cost double precision,
  bike_descent_agg_cost double precision,
  bike_met_agg_cost double precision,
  bike_delay_met_agg_cost double precision,
  bike_delay_time_agg_interval interval,
  bike_delay_time_agg_format character varying,
  bike_female_minus_1sd_agg_calories double precision,
  bike_female_average_agg_calories double precision,
  bike_female_plus_1sd_agg_calories double precision,
  bike_male_minus_1sd_agg_calories double precision,
  bike_male_average_agg_calories double precision,
  bike_male_plus_1sd_agg_calories double precision,
  bike_active_length_agg_cost double precision,
  bike_active_time_agg_cost double precision,
  bike_active_ascent_agg_cost double precision,
  bike_active_descent_agg_cost double precision,
  bike_active_met_agg_cost double precision,
  bike_active_delay_time_agg_interval interval,
  bike_active_delay_time_agg_format character varying,
  bike_active_female_minus_1sd_agg_calories double precision,
  bike_active_female_average_agg_calories double precision,
  bike_active_female_plus_1sd_agg_calories double precision,
  bike_active_male_minus_1sd_agg_calories double precision,
  bike_active_male_average_agg_calories double precision,
  bike_active_male_plus_1sd_agg_calories double precision,
  walk_length_agg_cost double precision,
  walk_time_agg_cost double precision,
  walk_delay_time_agg_cost double precision,
  walk_ascent_agg_cost double precision,
  walk_descent_agg_cost double precision,
  walk_met_agg_cost double precision,
  walk_delay_met_agg_cost double precision,
  walk_delay_time_agg_interval interval,
  walk_delay_time_agg_format character varying,
  walk_female_minus_1sd_agg_calories double precision,
  walk_female_average_agg_calories double precision,
  walk_female_plus_1sd_agg_calories double precision,
  walk_male_minus_1sd_agg_calories double precision,
  walk_male_average_agg_calories double precision,
  walk_male_plus_1sd_agg_calories double precision,
  walk_active_length_agg_cost double precision,
  walk_active_time_agg_cost double precision,
  walk_active_ascent_agg_cost double precision,
  walk_active_descent_agg_cost double precision,
  walk_active_met_agg_cost double precision,
  walk_active_delay_time_agg_interval interval,
  walk_active_delay_time_agg_format character varying,
  walk_active_female_minus_1sd_agg_calories double precision,
  walk_active_female_average_agg_calories double precision,
  walk_active_female_plus_1sd_agg_calories double precision,
  walk_active_male_minus_1sd_agg_calories double precision,
  walk_active_male_average_agg_calories double precision,
  walk_active_male_plus_1sd_agg_calories double precision,
  pt_length_agg_cost double precision,
  pt_time_agg_cost double precision,
  pt_delay_time_agg_cost double precision,
  pt_ascent_agg_cost double precision,
  pt_descent_agg_cost double precision,
  pt_met_agg_cost double precision,
  pt_delay_met_agg_cost double precision,
  pt_delay_time_agg_interval interval,
  pt_delay_time_agg_format character varying,
  pt_female_minus_1sd_agg_calories double precision,
  pt_female_average_agg_calories double precision,
  pt_female_plus_1sd_agg_calories double precision,
  pt_male_minus_1sd_agg_calories double precision,
  pt_male_average_agg_calories double precision,
  pt_male_plus_1sd_agg_calories double precision,
  pt_active_length_agg_cost double precision,
  pt_active_time_agg_cost double precision,
  pt_active_ascent_agg_cost double precision,
  pt_active_descent_agg_cost double precision,
  pt_active_met_agg_cost double precision,
  pt_active_delay_time_agg_interval interval,
  pt_active_delay_time_agg_format character varying,
  pt_active_female_minus_1sd_agg_calories double precision,
  pt_active_female_average_agg_calories double precision,
  pt_active_female_plus_1sd_agg_calories double precision,
  pt_active_male_minus_1sd_agg_calories double precision,
  pt_active_male_average_agg_calories double precision,
  pt_active_male_plus_1sd_agg_calories double precision,
  exclude_stats boolean DEFAULT false,
  sample boolean DEFAULT false,
  visit boolean DEFAULT false,
  CONSTRAINT batch_run_res_summary_pkey1 PRIMARY KEY (group_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE batch_run_res_summary
  OWNER TO postgres;

-- Index: summary_batch_item_id_idx

-- DROP INDEX summary_batch_item_id_idx;

CREATE INDEX summary_batch_item_id_idx
  ON batch_run_res_summary
  USING btree
  (batch_item_id);

-- Index: summary_batch_run_id_idx

-- DROP INDEX summary_batch_run_id_idx;

CREATE INDEX summary_batch_run_id_idx
  ON batch_run_res_summary
  USING btree
  (batch_run_id);

-- Index: summary_group_id_idx

-- DROP INDEX summary_group_id_idx;

CREATE INDEX summary_group_id_idx
  ON batch_run_res_summary
  USING btree
  (group_id);

-- Index: summary_sub_mode_filter_idx

-- DROP INDEX summary_sub_mode_filter_idx;

CREATE INDEX summary_sub_mode_filter_idx
  ON batch_run_res_summary
  USING btree
  (mode_filter);


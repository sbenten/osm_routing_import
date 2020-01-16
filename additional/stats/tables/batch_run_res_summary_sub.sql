-- Sequence: batch_run_res_summary_sub_id_seq

-- DROP SEQUENCE batch_run_res_summary_sub_id_seq;

CREATE SEQUENCE batch_run_res_summary_sub_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE batch_run_res_summary_sub_id_seq
  OWNER TO postgres;

-- Table: batch_run_res_summary_sub

-- DROP TABLE batch_run_res_summary_sub;

CREATE TABLE batch_run_res_summary_sub
(
  id integer NOT NULL DEFAULT nextval('batch_run_res_summary_sub_id_seq'::regclass),
  batch_id integer NOT NULL,
  batch_run_id integer NOT NULL,
  batch_item_id integer NOT NULL,
  group_id integer NOT NULL,
  sub_group_id integer NOT NULL,
  group_description character varying,
  sub_group_description character varying,
  mode character varying,
  mode_filter integer NOT NULL,
  sub_mode_filter integer NOT NULL,
  batch_item_description character varying,
  source geometry(Point,27700),
  target geometry(Point,27700),
  length_agg_cost double precision NOT NULL,
  time_agg_cost double precision NOT NULL,
  delay_time_agg_cost double precision NOT NULL,
  ascent_agg_cost double precision NOT NULL,
  descent_agg_cost double precision NOT NULL,
  met_agg_cost double precision NOT NULL,
  delay_met_agg_cost double precision NOT NULL,
  delay_time_agg_interval interval NOT NULL,
  delay_time_agg_format character varying NOT NULL,
  female_minus_1sd_agg_calories double precision NOT NULL,
  female_average_agg_calories double precision NOT NULL,
  female_plus_1sd_agg_calories double precision NOT NULL,
  male_minus_1sd_agg_calories double precision NOT NULL,
  male_average_agg_calories double precision NOT NULL,
  male_plus_1sd_agg_calories double precision NOT NULL,
  active_length_agg_cost double precision NOT NULL,
  active_time_agg_cost double precision NOT NULL,
  active_ascent_agg_cost double precision NOT NULL,
  active_descent_agg_cost double precision NOT NULL,
  active_met_agg_cost double precision NOT NULL,
  active_time_agg_interval interval NOT NULL,
  active_time_agg_format character varying NOT NULL,
  active_female_minus_1sd_agg_calories double precision NOT NULL,
  active_female_average_agg_calories double precision NOT NULL,
  active_female_plus_1sd_agg_calories double precision NOT NULL,
  active_male_minus_1sd_agg_calories double precision NOT NULL,
  active_male_average_agg_calories double precision NOT NULL,
  active_male_plus_1sd_agg_calories double precision NOT NULL,
  home_imd_code character varying NOT NULL,
  home_imd_name character varying NOT NULL,
  home_imd_rank integer NOT NULL DEFAULT 0,
  home_decile integer NOT NULL DEFAULT 0,
  home_quintile integer NOT NULL DEFAULT 0,
  home_imd_health_rank integer NOT NULL DEFAULT 0,
  home_health_decile integer NOT NULL DEFAULT 0,
  home_health_quintile integer NOT NULL DEFAULT 0,
  CONSTRAINT batch_run_res_summary_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE batch_run_res_summary_sub
  OWNER TO postgres;

-- Index: batch_run_res_summary_sub_item_id_idx

-- DROP INDEX batch_run_res_summary_sub_item_id_idx;

CREATE INDEX batch_run_res_summary_sub_item_id_idx
  ON batch_run_res_summary_sub
  USING btree
  (batch_item_id);

-- Index: batch_run_res_summary_sub_mode_filter_idx

-- DROP INDEX batch_run_res_summary_sub_mode_filter_idx;

CREATE INDEX batch_run_res_summary_sub_mode_filter_idx
  ON batch_run_res_summary_sub
  USING btree
  (mode_filter);

-- Index: batch_run_res_summary_sub_source_idx

-- DROP INDEX batch_run_res_summary_sub_source_idx;

CREATE INDEX batch_run_res_summary_sub_source_idx
  ON batch_run_res_summary_sub
  USING gist
  (source);

-- Index: batch_run_res_summary_sub_target_idx

-- DROP INDEX batch_run_res_summary_sub_target_idx;

CREATE INDEX batch_run_res_summary_sub_target_idx
  ON batch_run_res_summary_sub
  USING gist
  (target);


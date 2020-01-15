-- Sequence: sheffield.batch_run_res_points_id_seq

-- DROP SEQUENCE sheffield.batch_run_res_points_id_seq;

CREATE SEQUENCE sheffield.batch_run_res_points_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE sheffield.batch_run_res_points_id_seq
  OWNER TO postgres;

-- Table: sheffield.batch_run_res_points

-- DROP TABLE sheffield.batch_run_res_points;

CREATE TABLE sheffield.batch_run_res_points
(
  id integer,
  geom geometry(Point,27700),
  batch_run_id integer,
  batch_item_id integer,
  group_id integer,
  sub_group_id integer,
  batch_run_res_id integer,
  dtm_id integer,
  first_node integer,
  last_node integer,
  altitude double precision,
  distance double precision,
  difference double precision,
  mode_filter integer,
  sub_mode_filter integer,
  seq integer,
  direction integer
)
WITH (
  OIDS=FALSE
);
ALTER TABLE sheffield.batch_run_res_points
  OWNER TO postgres;

-- Index: sheffield.res_points_mode_filter_idx

-- DROP INDEX sheffield.res_points_mode_filter_idx;

CREATE INDEX res_points_mode_filter_idx
  ON sheffield.batch_run_res_points
  USING btree
  (mode_filter);

-- Index: sheffield.res_points_sub_mode_filter_idx

-- DROP INDEX sheffield.res_points_sub_mode_filter_idx;

CREATE INDEX res_points_sub_mode_filter_idx
  ON sheffield.batch_run_res_points
  USING btree
  (sub_mode_filter);


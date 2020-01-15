-- Sequence: sheffield.census_flows_all_seq

-- DROP SEQUENCE sheffield.census_flows_all_seq;

CREATE SEQUENCE sheffield.census_flows_all_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE sheffield.census_flows_all_seq
  OWNER TO postgres;

-- Table: sheffield.census_flows_all

-- DROP TABLE sheffield.census_flows_all;

CREATE TABLE sheffield.census_flows_all
(
  source_oa character varying,
  target_oa character varying,
  count integer,
  source_geom geometry(MultiPolygon,27700),
  target_geom geometry(MultiPolygon,27700),
  code character varying(254),
  ovrk2015 bigint,
  decile integer NOT NULL DEFAULT 0,
  quintile integer NOT NULL DEFAULT 0,
  hlth2015 integer,
  hlthdecile integer,
  hlthquintile integer,
  id integer NOT NULL DEFAULT nextval('sheffield.census_flows_all_seq'::regclass),
  home_settlement_id character varying,
  work_settlement_id character varying,
  flow_direction character varying
)
WITH (
  OIDS=FALSE
);
ALTER TABLE sheffield.census_flows_all
  OWNER TO postgres;

-- Index: sheffield.census_flows_all_source_gist

-- DROP INDEX sheffield.census_flows_all_source_gist;

CREATE INDEX census_flows_all_source_gist
  ON sheffield.census_flows_all
  USING gist
  (source_geom);

-- Index: sheffield.census_flows_all_source_oa_idx

-- DROP INDEX sheffield.census_flows_all_source_oa_idx;

CREATE INDEX census_flows_all_source_oa_idx
  ON sheffield.census_flows_all
  USING btree
  (source_oa COLLATE pg_catalog."default");

-- Index: sheffield.census_flows_all_target_gist

-- DROP INDEX sheffield.census_flows_all_target_gist;

CREATE INDEX census_flows_all_target_gist
  ON sheffield.census_flows_all
  USING gist
  (target_geom);

-- Index: sheffield.census_flows_all_target_oa_idx

-- DROP INDEX sheffield.census_flows_all_target_oa_idx;

CREATE INDEX census_flows_all_target_oa_idx
  ON sheffield.census_flows_all
  USING btree
  (target_oa COLLATE pg_catalog."default");


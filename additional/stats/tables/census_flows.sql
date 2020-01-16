-- Sequence: census_flows_seq

-- DROP SEQUENCE census_flows_seq;

CREATE SEQUENCE census_flows_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE census_flows_seq
  OWNER TO postgres;

-- Table: census_flows

-- DROP TABLE census_flows;

CREATE TABLE census_flows
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
  geom geometry(LineString,27700),
  id integer NOT NULL DEFAULT nextval('census_flows_seq'::regclass),
  home_settlement_id character varying,
  work_settlement_id character varying,
  flow_direction character varying
)
WITH (
  OIDS=FALSE
);
ALTER TABLE census_flows
  OWNER TO postgres;

-- Index: census_flows_source_gist

-- DROP INDEX census_flows_source_gist;

CREATE INDEX census_flows_source_gist
  ON census_flows
  USING gist
  (source_geom);

-- Index: census_flows_source_oa_idx

-- DROP INDEX census_flows_source_oa_idx;

CREATE INDEX census_flows_source_oa_idx
  ON census_flows
  USING btree
  (source_oa COLLATE pg_catalog."default");

-- Index: census_flows_target_gist

-- DROP INDEX census_flows_target_gist;

CREATE INDEX census_flows_target_gist
  ON census_flows
  USING gist
  (target_geom);

-- Index: census_flows_target_oa_idx

-- DROP INDEX census_flows_target_oa_idx;

CREATE INDEX census_flows_target_oa_idx
  ON census_flows
  USING btree
  (target_oa COLLATE pg_catalog."default");


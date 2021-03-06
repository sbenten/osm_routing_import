﻿-- Table: lsoa_imd_sheffield

-- DROP TABLE lsoa_imd_sheffield;

CREATE TABLE lsoa_imd_sheffield
(
  id integer NOT NULL,
  geom geometry(MultiPolygon,27700),
  gid integer,
  code character varying(254),
  name character varying(254),
  label character varying(254),
  ruc11cd character varying(254),
  ruc11 character varying(254),
  ovrk2015 bigint,
  decile integer,
  quintile integer,
  hlth2015 integer,
  hlthdecile integer,
  hlthquintile integer,
  CONSTRAINT lsoa_imd_sheffield_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE lsoa_imd_sheffield
  OWNER TO postgres;

-- Index: lsoa_imd_sheffield_geom_idx

-- DROP INDEX lsoa_imd_sheffield_geom_idx;

CREATE INDEX lsoa_imd_sheffield_geom_idx
  ON lsoa_imd_sheffield
  USING gist
  (geom);


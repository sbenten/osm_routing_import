
CREATE TABLE sheffield.lsoa_imd_sheffield_pt
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
  stop_count integer,
  morning_stop_time_count integer,
  evening_stop_time_count integer,
  total_stop_time_count integer,
  stop_norm numeric,
  morning_stop_time_norm numeric,
  evening_stop_time_norm numeric,
  total_stop_time_norm numeric,
  stop_count_b10 integer,
  morning_stop_time_count_b10 integer,
  evening_stop_time_count_b10 integer,
  total_stop_time_count_b10 integer,
  stop_count_b25 integer,
  morning_stop_time_count_b25 integer,
  evening_stop_time_count_b25 integer,
  total_stop_time_count_b25 integer,
  CONSTRAINT lsoa_imd_sheffield_pt_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE sheffield.lsoa_imd_sheffield_pt
  OWNER TO postgres;

-- Index: sheffield.lsoa_imd_sheffield_pt_geom_idx

-- DROP INDEX sheffield.lsoa_imd_sheffield_pt_geom_idx;

CREATE INDEX lsoa_imd_sheffield_pt_geom_idx
  ON sheffield.lsoa_imd_sheffield_pt
  USING gist
  (geom);


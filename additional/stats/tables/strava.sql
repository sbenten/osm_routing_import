-- Table: sheffield.strava

-- DROP TABLE sheffield.strava;

CREATE TABLE sheffield.strava
(
  id bigint NOT NULL,
  geom geometry(MultiLineString,27700),
  osm_id numeric,
  osm_name character varying(254),
  osm_meta character varying(254),
  osm_source numeric,
  osm_target numeric,
  clazz numeric,
  flags numeric,
  source numeric,
  target numeric,
  km numeric,
  kmh numeric,
  cost numeric,
  reverse_co numeric,
  x1 numeric,
  y1 numeric,
  x2 numeric,
  y2 numeric,
  total_athcnt integer,
  total_rathcnt integer,
  total_actcnt integer,
  total_ractcnt integer,
  total_tathcnt integer,
  total_tactcnt integer,
  total_acttime double precision,
  total_racttime double precision,
  total_cmtcnt integer,
  total_rcmtcnt integer,
  total_tcmtcnt integer,
  CONSTRAINT strava_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE sheffield.strava
  OWNER TO postgres;

-- Index: sheffield.sidx_strava_geom

-- DROP INDEX sheffield.sidx_strava_geom;

CREATE INDEX sidx_strava_geom
  ON sheffield.strava
  USING gist
  (geom);


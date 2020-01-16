-- Table: accidents

-- DROP TABLE accidents;

CREATE TABLE accidents
(
  id character varying NOT NULL,
  severity integer,
  police_attended integer,
  pedestrian boolean,
  cyclist boolean,
  geom geometry(Point,27700),
  date timestamp without time zone,
  CONSTRAINT accidents_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE accidents
  OWNER TO postgres;

-- Index: accidents_geom_idx

-- DROP INDEX accidents_geom_idx;

CREATE INDEX accidents_geom_idx
  ON accidents
  USING gist
  (geom);
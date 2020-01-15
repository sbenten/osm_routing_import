-- Table: sheffield.accidents

-- DROP TABLE sheffield.accidents;

CREATE TABLE sheffield.accidents
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
ALTER TABLE sheffield.accidents
  OWNER TO postgres;

-- Index: sheffield.accidents_geom_idx

-- DROP INDEX sheffield.accidents_geom_idx;

CREATE INDEX accidents_geom_idx
  ON sheffield.accidents
  USING gist
  (geom);
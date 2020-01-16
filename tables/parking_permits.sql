-- Table: parking_permits

-- DROP TABLE parking_permits;

CREATE TABLE parking_permits
(
  uid integer NOT NULL,
  geom geometry(MultiPolygon,27700),
  "OBJECTID" bigint,
  "Zone" character varying(80),
  "Shapearea" numeric,
  "Shapelen" numeric,
  id bigint,
  layer character varying(100),
  path character varying(200),
  CONSTRAINT parking_permits_pkey PRIMARY KEY (uid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE parking_permits
  OWNER TO postgres;

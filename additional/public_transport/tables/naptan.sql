-- Table: import.naptan

-- DROP TABLE import.naptan;

CREATE TABLE import.naptan
(
  atcocode character varying,
  naptancode character varying,
  commonname character varying,
  landmark character varying,
  street character varying,
  indicator character varying,
  nptglocalityref character varying,
  easting integer,
  northing integer,
  stoptype character varying,
  administrativearearef character varying,
  geom geometry(Point,27700),
  longitude double precision,
  latitude double precision,
  import_geom geometry(Point,27700),
  type character varying
)
WITH (
  OIDS=FALSE
);
ALTER TABLE import.naptan
  OWNER TO postgres;

-- Index: import.naptan_gist

-- DROP INDEX import.naptan_gist;

CREATE INDEX naptan_gist
  ON import.naptan
  USING gist
  (geom);


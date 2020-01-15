-- Sequence: import.public_stops_id_seq

-- DROP SEQUENCE import.public_stops_id_seq;

CREATE SEQUENCE import.public_stops_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE import.public_stops_id_seq
  OWNER TO postgres;

-- Table: import.public_transport_stops

-- DROP TABLE import.public_transport_stops;

CREATE TABLE import.public_transport_stops
(
  id integer NOT NULL DEFAULT nextval('import.public_stops_id_seq'::regclass),
  import_geom geometry(Point,27700),
  osm_id bigint,
  atcocode character varying,
  name character varying,
  landmark character varying,
  type character varying,
  naptan character varying,
  way_point geometry(Point,27700),
  geom geometry(Point,27700),
  cluster_id integer,
  CONSTRAINT public_stops_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE import.public_transport_stops
  OWNER TO postgres;

-- Index: import.public_stops_atco_code

-- DROP INDEX import.public_stops_atco_code;

CREATE INDEX public_stops_atco_code
  ON import.public_transport_stops
  USING btree
  (atcocode COLLATE pg_catalog."default");

-- Index: import.public_stops_geom_idx

-- DROP INDEX import.public_stops_geom_idx;

CREATE INDEX public_stops_geom_idx
  ON import.public_transport_stops
  USING gist
  (import_geom);

-- Index: import.public_stops_osm_id

-- DROP INDEX import.public_stops_osm_id;

CREATE INDEX public_stops_osm_id
  ON import.public_transport_stops
  USING btree
  (osm_id);

-- Index: import.public_transport_stops_geom_gist

-- DROP INDEX import.public_transport_stops_geom_gist;

CREATE INDEX public_transport_stops_geom_gist
  ON import.public_transport_stops
  USING gist
  (geom);

-- Index: import.public_transport_stops_import_geom_gist

-- DROP INDEX import.public_transport_stops_import_geom_gist;

CREATE INDEX public_transport_stops_import_geom_gist
  ON import.public_transport_stops
  USING gist
  (import_geom);

-- Index: import.public_transport_stops_way_point_gist

-- DROP INDEX import.public_transport_stops_way_point_gist;

CREATE INDEX public_transport_stops_way_point_gist
  ON import.public_transport_stops
  USING gist
  (way_point);


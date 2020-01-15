-- Sequence: import.ways_id_seq

-- DROP SEQUENCE import.ways_id_seq;

CREATE SEQUENCE import.ways_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE import.ways_id_seq
  OWNER TO postgres;

-- Table: import.ways

-- DROP TABLE import.ways;

CREATE TABLE import.ways
(
  id serial NOT NULL,
  geom geometry(LineString,27700),
  osm_id character varying,
  name character varying,
  highway character varying,
  z_order integer,
  attrs hstore,
  CONSTRAINT ways_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE import.ways
  OWNER TO postgres;

-- Index: import.sidx_ways_geom

-- DROP INDEX import.sidx_ways_geom;

CREATE INDEX sidx_ways_geom
  ON import.ways
  USING gist
  (geom);


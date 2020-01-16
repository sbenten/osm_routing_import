-- Sequence: way_crossings_id_seq

-- DROP SEQUENCE way_crossings_id_seq;

CREATE SEQUENCE way_crossings_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE way_crossings_id_seq
  OWNER TO postgres;

-- Table: way_crossings

-- DROP TABLE way_crossings;

CREATE TABLE way_crossings
(
  id integer NOT NULL DEFAULT nextval('way_crossings_id_seq'::regclass),
  geom geometry(Point,27700),
  osm_id bigint NOT NULL,
  type character varying,
  CONSTRAINT way_crossings_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE way_crossings
  OWNER TO postgres;

-- Index: way_crossings_gist

-- DROP INDEX way_crossings_gist;

CREATE INDEX way_crossings_gist
  ON way_crossings
  USING gist
  (geom);


-- Sequence: import.way_crossings_id_seq

-- DROP SEQUENCE import.way_crossings_id_seq;

CREATE SEQUENCE import.way_crossings_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE import.way_crossings_id_seq
  OWNER TO postgres;

-- Table: import.way_crossings

-- DROP TABLE import.way_crossings;

CREATE TABLE import.way_crossings
(
  id integer NOT NULL DEFAULT nextval('import.way_crossings_id_seq'::regclass),
  geom geometry(Point,27700),
  osm_id bigint NOT NULL,
  type character varying,
  CONSTRAINT way_crossings_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE import.way_crossings
  OWNER TO postgres;

-- Index: import.way_crossings_gist

-- DROP INDEX import.way_crossings_gist;

CREATE INDEX way_crossings_gist
  ON import.way_crossings
  USING gist
  (geom);


-- Sequence: import.way_points_id_seq

-- DROP SEQUENCE import.way_points_id_seq;

CREATE SEQUENCE import.way_points_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE import.way_points_id_seq
  OWNER TO postgres;

-- Table: import.way_points

-- DROP TABLE import.way_points;

CREATE TABLE import.way_points
(
  id integer NOT NULL DEFAULT nextval('import.way_points_id_seq'::regclass),
  geom geometry(Point,27700),
  ways_clean_id integer NOT NULL,
  seq integer NOT NULL,
  dtm_id integer NOT NULL,
  altitude double precision,
  difference double precision,
  CONSTRAINT way_points_pkey PRIMARY KEY (id),
  CONSTRAINT way_points_ways_clean_id_fkey FOREIGN KEY (ways_clean_id)
      REFERENCES import.ways_clean (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE import.way_points
  OWNER TO postgres;

-- Index: import.way_points_gist

-- DROP INDEX import.way_points_gist;

CREATE INDEX way_points_gist
  ON import.way_points
  USING gist
  (geom);


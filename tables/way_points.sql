-- Sequence: way_points_id_seq

-- DROP SEQUENCE way_points_id_seq;

CREATE SEQUENCE way_points_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE way_points_id_seq
  OWNER TO postgres;

-- Table: way_points

-- DROP TABLE way_points;

CREATE TABLE way_points
(
  id integer NOT NULL DEFAULT nextval('way_points_id_seq'::regclass),
  geom geometry(Point,27700),
  ways_clean_id integer NOT NULL,
  seq integer NOT NULL,
  dtm_id integer NOT NULL,
  altitude double precision,
  difference double precision,
  CONSTRAINT way_points_pkey PRIMARY KEY (id),
  CONSTRAINT way_points_ways_clean_id_fkey FOREIGN KEY (ways_clean_id)
      REFERENCES ways_clean (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE way_points
  OWNER TO postgres;

-- Index: way_points_gist

-- DROP INDEX way_points_gist;

CREATE INDEX way_points_gist
  ON way_points
  USING gist
  (geom);


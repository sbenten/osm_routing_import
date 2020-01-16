-- Sequence: ways_clean_vertices_pgr_id_seq

-- DROP SEQUENCE ways_clean_vertices_pgr_id_seq;

CREATE SEQUENCE ways_clean_vertices_pgr_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE ways_clean_vertices_pgr_id_seq
  OWNER TO postgres;

-- Table: ways_clean_vertices_pgr

-- DROP TABLE ways_clean_vertices_pgr;

CREATE TABLE ways_clean_vertices_pgr
(
  id bigserial NOT NULL,
  cnt integer,
  chk integer,
  ein integer,
  eout integer,
  the_geom geometry(Point,27700),
  CONSTRAINT ways_clean_vertices_pgr_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ways_clean_vertices_pgr
  OWNER TO postgres;

-- Index: ways_clean_vertices_pgr_the_geom_idx

-- DROP INDEX ways_clean_vertices_pgr_the_geom_idx;

CREATE INDEX ways_clean_vertices_pgr_the_geom_idx
  ON ways_clean_vertices_pgr
  USING gist
  (the_geom);


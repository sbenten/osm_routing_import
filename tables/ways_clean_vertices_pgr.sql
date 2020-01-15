-- Sequence: import.ways_clean_vertices_pgr_id_seq

-- DROP SEQUENCE import.ways_clean_vertices_pgr_id_seq;

CREATE SEQUENCE import.ways_clean_vertices_pgr_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE import.ways_clean_vertices_pgr_id_seq
  OWNER TO postgres;

-- Table: import.ways_clean_vertices_pgr

-- DROP TABLE import.ways_clean_vertices_pgr;

CREATE TABLE import.ways_clean_vertices_pgr
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
ALTER TABLE import.ways_clean_vertices_pgr
  OWNER TO postgres;

-- Index: import.ways_clean_vertices_pgr_the_geom_idx

-- DROP INDEX import.ways_clean_vertices_pgr_the_geom_idx;

CREATE INDEX ways_clean_vertices_pgr_the_geom_idx
  ON import.ways_clean_vertices_pgr
  USING gist
  (the_geom);


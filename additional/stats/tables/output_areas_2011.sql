-- Sequence: output_areas_2011_id_seq

-- DROP SEQUENCE output_areas_2011_id_seq;

CREATE SEQUENCE output_areas_2011_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE output_areas_2011_id_seq
  OWNER TO postgres;

-- Table: output_areas_2011

-- DROP TABLE output_areas_2011;

CREATE TABLE output_areas_2011
(
  id serial NOT NULL,
  geom geometry(MultiPolygon,27700),
  geo_code character varying(9),
  include boolean DEFAULT false,
  CONSTRAINT output_areas_2011_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE output_areas_2011
  OWNER TO postgres;

-- Index: output_areas_2011_geo_code_idx

-- DROP INDEX output_areas_2011_geo_code_idx;

CREATE INDEX output_areas_2011_geo_code_idx
  ON output_areas_2011
  USING btree
  (geo_code COLLATE pg_catalog."default");

-- Index: sidx_output_areas_2011_geom

-- DROP INDEX sidx_output_areas_2011_geom;

CREATE INDEX sidx_output_areas_2011_geom
  ON output_areas_2011
  USING gist
  (geom);  
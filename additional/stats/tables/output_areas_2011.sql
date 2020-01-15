-- Sequence: import.output_areas_2011_id_seq

-- DROP SEQUENCE import.output_areas_2011_id_seq;

CREATE SEQUENCE import.output_areas_2011_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE import.output_areas_2011_id_seq
  OWNER TO postgres;

-- Table: import.output_areas_2011

-- DROP TABLE import.output_areas_2011;

CREATE TABLE import.output_areas_2011
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
ALTER TABLE import.output_areas_2011
  OWNER TO postgres;

-- Index: import.output_areas_2011_geo_code_idx

-- DROP INDEX import.output_areas_2011_geo_code_idx;

CREATE INDEX output_areas_2011_geo_code_idx
  ON import.output_areas_2011
  USING btree
  (geo_code COLLATE pg_catalog."default");

-- Index: import.sidx_output_areas_2011_geom

-- DROP INDEX import.sidx_output_areas_2011_geom;

CREATE INDEX sidx_output_areas_2011_geom
  ON import.output_areas_2011
  USING gist
  (geom);  
﻿-- Sequence: traveline_operators_id_seq

-- DROP SEQUENCE traveline_operators_id_seq;

CREATE SEQUENCE traveline_operators_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE traveline_operators_id_seq
  OWNER TO postgres;

-- Table: traveline_operators

-- DROP TABLE traveline_operators;

CREATE TABLE traveline_operators
(
  id integer NOT NULL DEFAULT nextval('traveline_operators_id_seq'::regclass),
  file_id integer NOT NULL,
  national_code character varying NOT NULL,
  code character varying NOT NULL,
  short_name character varying NOT NULL,
  CONSTRAINT traveline_operators_pkey PRIMARY KEY (id),
  CONSTRAINT traveline_operators_file_id_fkey FOREIGN KEY (file_id)
      REFERENCES traveline_files (file_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE traveline_operators
  OWNER TO postgres;

-- Sequence: import.traveline_standard_services_id_seq

-- DROP SEQUENCE import.traveline_standard_services_id_seq;

CREATE SEQUENCE import.traveline_standard_services_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE import.traveline_standard_services_id_seq
  OWNER TO postgres;

-- Table: import.traveline_standard_services

-- DROP TABLE import.traveline_standard_services;

CREATE TABLE import.traveline_standard_services
(
  id integer NOT NULL DEFAULT nextval('import.traveline_standard_services_id_seq'::regclass),
  file_id integer NOT NULL,
  origin character varying NOT NULL,
  destination character varying NOT NULL,
  section_id character varying NOT NULL,
  direction character varying NOT NULL,
  journey_pattern_timing_id character varying NOT NULL,
  CONSTRAINT traveline_standard_services_pkey PRIMARY KEY (id),
  CONSTRAINT traveline_standard_services_file_id_fkey FOREIGN KEY (file_id)
      REFERENCES import.traveline_files (file_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE import.traveline_standard_services
  OWNER TO postgres;

-- Sequence: traveline_services_id_seq

-- DROP SEQUENCE traveline_services_id_seq;

CREATE SEQUENCE traveline_services_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE traveline_services_id_seq
  OWNER TO postgres;

-- Table: traveline_services

-- DROP TABLE traveline_services;

CREATE TABLE traveline_services
(
  id integer NOT NULL DEFAULT nextval('traveline_services_id_seq'::regclass),
  file_id integer NOT NULL,
  service_code character varying NOT NULL,
  line_name character varying NOT NULL,
  start_date character varying NOT NULL,
  end_date character varying,
  operator_code character varying NOT NULL,
  mode character varying NOT NULL,
  description character varying NOT NULL,
  days_week xml,
  CONSTRAINT traveline_services_pkey PRIMARY KEY (id),
  CONSTRAINT traveline_services_file_id_fkey FOREIGN KEY (file_id)
      REFERENCES traveline_files (file_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE traveline_services
  OWNER TO postgres;

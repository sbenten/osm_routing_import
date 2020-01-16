-- Sequence: traveline_files_id_seq

-- DROP SEQUENCE traveline_files_id_seq;

CREATE SEQUENCE traveline_files_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE traveline_files_id_seq
  OWNER TO postgres;

-- Table: traveline_files

-- DROP TABLE traveline_files;

CREATE TABLE traveline_files
(
  file_id integer NOT NULL DEFAULT nextval('traveline_files_id_seq'::regclass),
  file_name character varying NOT NULL,
  import_date timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT traveline_file_pkey PRIMARY KEY (file_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE traveline_files
  OWNER TO postgres;

-- Sequence: import.traveline_files_id_seq

-- DROP SEQUENCE import.traveline_files_id_seq;

CREATE SEQUENCE import.traveline_files_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE import.traveline_files_id_seq
  OWNER TO postgres;

-- Table: import.traveline_files

-- DROP TABLE import.traveline_files;

CREATE TABLE import.traveline_files
(
  file_id integer NOT NULL DEFAULT nextval('import.traveline_files_id_seq'::regclass),
  file_name character varying NOT NULL,
  import_date timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT traveline_file_pkey PRIMARY KEY (file_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE import.traveline_files
  OWNER TO postgres;

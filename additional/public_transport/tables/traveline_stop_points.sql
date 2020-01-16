-- Sequence: traveline_stop_points_id_seq

-- DROP SEQUENCE traveline_stop_points_id_seq;

CREATE SEQUENCE traveline_stop_points_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE traveline_stop_points_id_seq
  OWNER TO postgres;

-- Table: traveline_stop_points

-- DROP TABLE traveline_stop_points;

CREATE TABLE traveline_stop_points
(
  id integer NOT NULL DEFAULT nextval('traveline_stop_points_id_seq'::regclass),
  file_id integer NOT NULL,
  atcocode character varying NOT NULL,
  name character varying NOT NULL,
  CONSTRAINT traveline_stop_points_pkey PRIMARY KEY (id),
  CONSTRAINT traveline_stop_points_file_id_fkey FOREIGN KEY (file_id)
      REFERENCES traveline_files (file_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE traveline_stop_points
  OWNER TO postgres;

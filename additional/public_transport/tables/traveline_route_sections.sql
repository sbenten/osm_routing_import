-- Sequence: import.traveline_route_sections_id_seq

-- DROP SEQUENCE import.traveline_route_sections_id_seq;

CREATE SEQUENCE import.traveline_route_sections_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE import.traveline_route_sections_id_seq
  OWNER TO postgres;

-- Table: import.traveline_route_sections

-- DROP TABLE import.traveline_route_sections;

CREATE TABLE import.traveline_route_sections
(
  id integer NOT NULL DEFAULT nextval('import.traveline_route_sections_id_seq'::regclass),
  file_id integer NOT NULL,
  route_id character varying NOT NULL,
  route_link_id character varying NOT NULL,
  from_stop_point_ref character varying NOT NULL,
  to_stop_point_ref character varying NOT NULL,
  direction character varying NOT NULL,
  CONSTRAINT traveline_route_sections_pkey PRIMARY KEY (id),
  CONSTRAINT traveline_route_sections_file_id_fkey FOREIGN KEY (file_id)
      REFERENCES import.traveline_files (file_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE import.traveline_route_sections
  OWNER TO postgres;

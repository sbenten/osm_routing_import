-- Sequence: traveline_route_sections_id_seq

-- DROP SEQUENCE traveline_route_sections_id_seq;

CREATE SEQUENCE traveline_route_sections_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE traveline_route_sections_id_seq
  OWNER TO postgres;

-- Table: traveline_route_sections

-- DROP TABLE traveline_route_sections;

CREATE TABLE traveline_route_sections
(
  id integer NOT NULL DEFAULT nextval('traveline_route_sections_id_seq'::regclass),
  file_id integer NOT NULL,
  route_id character varying NOT NULL,
  route_link_id character varying NOT NULL,
  from_stop_point_ref character varying NOT NULL,
  to_stop_point_ref character varying NOT NULL,
  direction character varying NOT NULL,
  CONSTRAINT traveline_route_sections_pkey PRIMARY KEY (id),
  CONSTRAINT traveline_route_sections_file_id_fkey FOREIGN KEY (file_id)
      REFERENCES traveline_files (file_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE traveline_route_sections
  OWNER TO postgres;

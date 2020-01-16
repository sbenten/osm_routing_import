-- Sequence: traveline_routes_id_seq

-- DROP SEQUENCE traveline_routes_id_seq;

CREATE SEQUENCE traveline_routes_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE traveline_routes_id_seq
  OWNER TO postgres;

-- Table: traveline_routes

-- DROP TABLE traveline_routes;

CREATE TABLE traveline_routes
(
  id integer NOT NULL DEFAULT nextval('traveline_routes_id_seq'::regclass),
  file_id integer NOT NULL,
  route_id character varying NOT NULL,
  description character varying NOT NULL,
  CONSTRAINT traveline_routes_pkey PRIMARY KEY (id),
  CONSTRAINT traveline_routes_file_id_fkey FOREIGN KEY (file_id)
      REFERENCES traveline_files (file_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE traveline_routes
  OWNER TO postgres;

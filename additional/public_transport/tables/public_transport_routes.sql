-- Sequence: import.public_transport_routes_id_seq

-- DROP SEQUENCE import.public_transport_routes_id_seq;

CREATE SEQUENCE import.public_transport_routes_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE import.public_transport_routes_id_seq
  OWNER TO postgres;

-- Table: import.public_transport_routes

-- DROP TABLE import.public_transport_routes;

CREATE TABLE import.public_transport_routes
(
  id integer NOT NULL DEFAULT nextval('import.public_transport_routes_id_seq'::regclass),
  import_file_id integer,
  route_section_ref character varying NOT NULL,
  description character varying NOT NULL,
  public_transport_service_id integer,
  direction double precision,
  CONSTRAINT public_transport_routes_pkey PRIMARY KEY (id),
  CONSTRAINT public_transport_service_id_fkey FOREIGN KEY (public_transport_service_id)
      REFERENCES import.public_transport_services (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE import.public_transport_routes
  OWNER TO postgres;

-- Index: import.public_transport_routes_route_section_ref_idx

-- DROP INDEX import.public_transport_routes_route_section_ref_idx;

CREATE INDEX public_transport_routes_route_section_ref_idx
  ON import.public_transport_routes
  USING btree
  (route_section_ref COLLATE pg_catalog."default");


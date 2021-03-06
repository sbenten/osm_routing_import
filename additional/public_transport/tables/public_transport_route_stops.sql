﻿-- Sequence: public_transport_route_stops_id_seq

-- DROP SEQUENCE public_transport_route_stops_id_seq;

CREATE SEQUENCE public_transport_route_stops_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public_transport_route_stops_id_seq
  OWNER TO postgres;

-- Table: public_transport_route_stops

-- DROP TABLE public_transport_route_stops;

CREATE TABLE public_transport_route_stops
(
  id integer NOT NULL DEFAULT nextval('public_transport_route_stops_id_seq'::regclass),
  public_transport_route_id integer NOT NULL,
  public_transport_stop_id integer,
  import_file_id integer,
  route_link_id character varying NOT NULL,
  atco_code character varying NOT NULL,
  direction character varying NOT NULL,
  CONSTRAINT public_transport_route_stops_pkey PRIMARY KEY (id),
  CONSTRAINT public_transport_route_stops_route_id_fkey FOREIGN KEY (public_transport_route_id)
      REFERENCES public_transport_routes (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public_transport_route_stops
  OWNER TO postgres;

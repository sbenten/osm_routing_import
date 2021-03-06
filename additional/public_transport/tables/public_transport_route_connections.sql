﻿-- Sequence: public_transport_route_connections_id_seq

-- DROP SEQUENCE public_transport_route_connections_id_seq;

CREATE SEQUENCE public_transport_route_connections_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public_transport_route_connections_id_seq
  OWNER TO postgres;

-- Table: public_transport_route_connections

-- DROP TABLE public_transport_route_connections;

CREATE TABLE public_transport_route_connections
(
  id integer NOT NULL DEFAULT nextval('public_transport_route_connections_id_seq'::regclass),
  geom geometry(LineString,27700),
  public_transport_route_id integer,
  transport_mode character varying,
  cost double precision,
  reverse_cost double precision,
  cost_time double precision,
  reverse_cost_time double precision,
  cost_met double precision,
  reverse_cost_met double precision,
  length_m double precision,
  startaltitude double precision,
  endaltitude double precision,
  totalascent double precision,
  totaldescent double precision,
  curveindex double precision,
  oneway character varying,
  percentslope double precision,
  reversepercentslope double precision,
  angleslope double precision,
  reverseangleslope double precision,
  speed smallint,
  terrain_index double precision,
  import_file_id integer,
  route_link_id character varying,
  source_atco_code character varying,
  target_atco_code character varying,
  direction character varying,
  CONSTRAINT public_transport_route_walks_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public_transport_route_connections
  OWNER TO postgres;

-- Index: public_transport_route_walks_geom_idx

-- DROP INDEX public_transport_route_walks_geom_idx;

CREATE INDEX public_transport_route_walks_geom_idx
  ON public_transport_route_connections
  USING gist
  (geom);


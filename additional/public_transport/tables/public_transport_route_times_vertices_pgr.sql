-- Sequence: public_transport_route_times_vertices_pgr_id_seq

-- DROP SEQUENCE public_transport_route_times_vertices_pgr_id_seq;

CREATE SEQUENCE public_transport_route_times_vertices_pgr_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public_transport_route_times_vertices_pgr_id_seq
  OWNER TO postgres;

-- Table: public_transport_route_times_vertices_pgr

-- DROP TABLE public_transport_route_times_vertices_pgr;

CREATE TABLE public_transport_route_times_vertices_pgr
(
  id bigint NOT NULL DEFAULT nextval('public_transport_route_times_vertices_pgr_id_seq'::regclass),
  cnt integer,
  chk integer,
  ein integer,
  eout integer,
  the_geom geometry(Point,27700),
  CONSTRAINT public_transport_route_times_vertices_pgr_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public_transport_route_times_vertices_pgr
  OWNER TO postgres;

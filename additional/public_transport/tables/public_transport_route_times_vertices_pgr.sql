-- Sequence: import.public_transport_route_times_vertices_pgr_id_seq

-- DROP SEQUENCE import.public_transport_route_times_vertices_pgr_id_seq;

CREATE SEQUENCE import.public_transport_route_times_vertices_pgr_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE import.public_transport_route_times_vertices_pgr_id_seq
  OWNER TO postgres;

-- Table: import.public_transport_route_times_vertices_pgr

-- DROP TABLE import.public_transport_route_times_vertices_pgr;

CREATE TABLE import.public_transport_route_times_vertices_pgr
(
  id bigint NOT NULL DEFAULT nextval('import.public_transport_route_times_vertices_pgr_id_seq'::regclass),
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
ALTER TABLE import.public_transport_route_times_vertices_pgr
  OWNER TO postgres;

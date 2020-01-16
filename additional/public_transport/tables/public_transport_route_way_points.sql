-- Sequence: public_transport_route_way_points_id_seq

-- DROP SEQUENCE public_transport_route_way_points_id_seq;

CREATE SEQUENCE public_transport_route_way_points_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public_transport_route_way_points_id_seq
  OWNER TO postgres;

-- Table: public_transport_route_way_points

-- DROP TABLE public_transport_route_way_points;

CREATE TABLE public_transport_route_way_points
(
  id integer NOT NULL DEFAULT nextval('public_transport_route_way_points_id_seq'::regclass),
  geom geometry(Point,27700),
  public_transport_route_way_id integer NOT NULL,
  dtm_id integer NOT NULL,
  altitude double precision,
  CONSTRAINT public_transport_route_way_points_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public_transport_route_way_points
  OWNER TO postgres;

-- Index: public_transport_route_way_points_gist

-- DROP INDEX public_transport_route_way_points_gist;

CREATE INDEX public_transport_route_way_points_gist
  ON public_transport_route_way_points
  USING gist
  (geom);


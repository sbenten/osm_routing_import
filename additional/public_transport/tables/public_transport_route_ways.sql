-- Sequence: public_transport_route_ways_id_seq

-- DROP SEQUENCE public_transport_route_ways_id_seq;

CREATE SEQUENCE public_transport_route_ways_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public_transport_route_ways_id_seq
  OWNER TO postgres;

-- Table: public_transport_route_ways

-- DROP TABLE public_transport_route_ways;

CREATE TABLE public_transport_route_ways
(
  id integer NOT NULL DEFAULT nextval('public_transport_route_ways_id_seq'::regclass),
  geom geometry(LineString,27700),
  public_transport_route_id integer,
  transport_mode character varying,
  cost double precision,
  reverse_cost double precision,
  cost_time double precision,
  reverse_cost_time double precision,
  cost_met double precision,
  reverse_cost_met double precision,
  source integer,
  target integer,
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
  CONSTRAINT public_transport_route_ways_pkey PRIMARY KEY (id),
  CONSTRAINT public_transport_route_id_fkey FOREIGN KEY (public_transport_route_id)
      REFERENCES public_transport_routes (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public_transport_route_ways
  OWNER TO postgres;

-- Index: public_transport_route_ways_geom_gist

-- DROP INDEX public_transport_route_ways_geom_gist;

CREATE INDEX public_transport_route_ways_geom_gist
  ON public_transport_route_ways
  USING gist
  (geom);

-- Index: public_transport_route_ways_source_idx

-- DROP INDEX public_transport_route_ways_source_idx;

CREATE INDEX public_transport_route_ways_source_idx
  ON public_transport_route_ways
  USING btree
  (source);

-- Index: public_transport_route_ways_target_idx

-- DROP INDEX public_transport_route_ways_target_idx;

CREATE INDEX public_transport_route_ways_target_idx
  ON public_transport_route_ways
  USING btree
  (target);


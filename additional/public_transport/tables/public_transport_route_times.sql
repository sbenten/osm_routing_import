-- Sequence: public_transport_route_times_id_seq

-- DROP SEQUENCE public_transport_route_times_id_seq;

CREATE SEQUENCE public_transport_route_times_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public_transport_route_times_id_seq
  OWNER TO postgres;


-- Table: public_transport_route_times

-- DROP TABLE public_transport_route_times;

CREATE TABLE public_transport_route_times
(
  id integer NOT NULL DEFAULT nextval('public_transport_route_times_id_seq'::regclass),
  file_id integer,
  route_id character varying NOT NULL,
  route_link_id character varying NOT NULL,
  direction character varying NOT NULL,
  source integer,
  target integer,
  geom geometry(LineString,27700),
  line_name character varying,
  operator_name character varying,
  public_transport_route_id integer NOT NULL,
  route_description character varying,
  route_direction double precision,
  source_public_transport_route_stop_id integer NOT NULL,
  source_atco_code character varying NOT NULL,
  source_public_transport_stop_id integer NOT NULL,
  source_naptan_code character varying,
  source_stop_name character varying,
  source_stop_landmark character varying,
  source_timing_status character varying NOT NULL,
  source_cluster_id integer,
  source_geom geometry(Point,27700),
  target_public_transport_route_stop_id integer NOT NULL,
  target_atco_code character varying NOT NULL,
  target_public_transport_stop_id integer NOT NULL,
  target_naptan_code character varying,
  target_stop_name character varying,
  target_stop_landmark character varying,
  target_timing_status character varying NOT NULL,
  target_cluster_id integer,
  target_geom geometry(Point,27700),
  journey_pattern_section_id character varying NOT NULL,
  journey_pattern_timing_id character varying NOT NULL,
  runtime interval NOT NULL,
  agg_runtime interval NOT NULL,
  vehicle_journey_code character varying NOT NULL,
  vehicle_service_code character varying NOT NULL,
  service_code character varying NOT NULL,
  departure_time time without time zone NOT NULL,
  stop_time time without time zone NOT NULL,
  monday boolean NOT NULL,
  tuesday boolean NOT NULL,
  wednesday boolean NOT NULL,
  thursday boolean NOT NULL,
  friday boolean NOT NULL,
  saturday boolean NOT NULL,
  sunday boolean NOT NULL,
  public_transport_route_way_id integer,
  transport_mode character varying NOT NULL DEFAULT 'bus'::character varying,
  length_m double precision NOT NULL DEFAULT 0.0,
  startaltitude double precision NOT NULL DEFAULT 0.0,
  endaltitude double precision NOT NULL DEFAULT 0.0,
  totalascent double precision NOT NULL DEFAULT 0.0,
  totaldescent double precision NOT NULL DEFAULT 0.0,
  curveindex double precision NOT NULL DEFAULT 1.0,
  cost double precision NOT NULL DEFAULT 0.0,
  reverse_cost double precision NOT NULL DEFAULT 0.0,
  cost_time double precision NOT NULL DEFAULT 0.0,
  reverse_cost_time double precision NOT NULL DEFAULT 0.0,
  cost_met double precision NOT NULL DEFAULT 0.0,
  reverse_cost_met double precision NOT NULL DEFAULT 0.0,
  oneway character varying NOT NULL DEFAULT '1'::character varying,
  speed smallint NOT NULL DEFAULT 5,
  terrain_index double precision NOT NULL DEFAULT 1.0,
  percentslope double precision,
  reversepercentslope double precision,
  angleslope double precision,
  reverseangleslope double precision,
  public_transport_route_connection_way_id integer,
  CONSTRAINT public_transport_route_times_pkey PRIMARY KEY (id),
  CONSTRAINT source_public_transport_route_stop_id_fkey FOREIGN KEY (source_public_transport_route_stop_id)
      REFERENCES public_transport_route_stops (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE,
  CONSTRAINT source_public_transport_stop_id_fkey FOREIGN KEY (source_public_transport_stop_id)
      REFERENCES public_transport_stops (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE,
  CONSTRAINT target_public_transport_route_stop_id_fkey FOREIGN KEY (target_public_transport_route_stop_id)
      REFERENCES public_transport_route_stops (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE,
  CONSTRAINT target_public_transport_stop_id_fkey FOREIGN KEY (target_public_transport_stop_id)
      REFERENCES public_transport_stops (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public_transport_route_times
  OWNER TO postgres;

-- Index: public_transport_route_times_geom_gist

-- DROP INDEX public_transport_route_times_geom_gist;

CREATE INDEX public_transport_route_times_geom_gist
  ON public_transport_route_times
  USING gist
  (geom);

-- Index: public_transport_route_times_source_geom_gist

-- DROP INDEX public_transport_route_times_source_geom_gist;

CREATE INDEX public_transport_route_times_source_geom_gist
  ON public_transport_route_times
  USING gist
  (source_geom);

-- Index: public_transport_route_times_source_idx

-- DROP INDEX public_transport_route_times_source_idx;

CREATE INDEX public_transport_route_times_source_idx
  ON public_transport_route_times
  USING btree
  (source);

-- Index: public_transport_route_times_target_geom_gist

-- DROP INDEX public_transport_route_times_target_geom_gist;

CREATE INDEX public_transport_route_times_target_geom_gist
  ON public_transport_route_times
  USING gist
  (target_geom);

-- Index: public_transport_route_times_target_idx

-- DROP INDEX public_transport_route_times_target_idx;

CREATE INDEX public_transport_route_times_target_idx
  ON public_transport_route_times
  USING btree
  (target);

-- Index: public_transport_route_times_vehicle_jcode_idx

-- DROP INDEX public_transport_route_times_vehicle_jcode_idx;

CREATE INDEX public_transport_route_times_vehicle_jcode_idx
  ON public_transport_route_times
  USING btree
  (vehicle_journey_code COLLATE pg_catalog."default");


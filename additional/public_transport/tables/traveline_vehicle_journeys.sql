-- Sequence: traveline_vehicle_journeys_id_seq

-- DROP SEQUENCE traveline_vehicle_journeys_id_seq;

CREATE SEQUENCE traveline_vehicle_journeys_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE traveline_vehicle_journeys_id_seq
  OWNER TO postgres;

-- Table: traveline_vehicle_journeys

-- DROP TABLE traveline_vehicle_journeys;

CREATE TABLE traveline_vehicle_journeys
(
  id integer NOT NULL DEFAULT nextval('traveline_vehicle_journeys_id_seq'::regclass),
  file_id integer NOT NULL,
  operator_code character varying,
  vehicle_journey_code character varying NOT NULL,
  vehicle_service_code character varying NOT NULL,
  line_ref character varying NOT NULL,
  service_code character varying NOT NULL,
  departure_time time without time zone NOT NULL,
  days_week xml,
  monday boolean,
  tuesday boolean,
  wednesday boolean,
  thursday boolean,
  friday boolean,
  saturday boolean,
  sunday boolean,
  CONSTRAINT traveline_vehicle_journeys_pkey PRIMARY KEY (id),
  CONSTRAINT traveline_vehicle_journeys_file_id_fkey FOREIGN KEY (file_id)
      REFERENCES traveline_files (file_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE traveline_vehicle_journeys
  OWNER TO postgres;

-- Index: traveline_vehicle_journeys_service_code_idx

-- DROP INDEX traveline_vehicle_journeys_service_code_idx;

CREATE INDEX traveline_vehicle_journeys_service_code_idx
  ON traveline_vehicle_journeys
  USING btree
  (service_code COLLATE pg_catalog."default");


-- Sequence: traveline_journey_patterns_id_seq

-- DROP SEQUENCE traveline_journey_patterns_id_seq;

CREATE SEQUENCE traveline_journey_patterns_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 4513708
  CACHE 1;
ALTER TABLE traveline_journey_patterns_id_seq
  OWNER TO postgres;

-- Table: traveline_journey_patterns

-- DROP TABLE traveline_journey_patterns;

CREATE TABLE traveline_journey_patterns
(
  id integer NOT NULL DEFAULT nextval('traveline_journey_patterns_id_seq'::regclass),
  file_id integer NOT NULL,
  section_id character varying NOT NULL,
  journey_pattern_timing_id character varying NOT NULL,
  from_stop_point_ref character varying NOT NULL,
  from_timing_status character varying NOT NULL,
  route_link_id character varying NOT NULL,
  runtime interval NOT NULL,
  to_stop_point_ref character varying NOT NULL,
  to_timing_status character varying NOT NULL,
  CONSTRAINT traveline_journey_patterns_pkey PRIMARY KEY (id),
  CONSTRAINT traveline_journey_patterns_file_id_fkey FOREIGN KEY (file_id)
      REFERENCES traveline_files (file_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE traveline_journey_patterns
  OWNER TO postgres;

-- Index: traveline_journey_patterns_route_link_id_idx

-- DROP INDEX traveline_journey_patterns_route_link_id_idx;

CREATE INDEX traveline_journey_patterns_route_link_id_idx
  ON traveline_journey_patterns
  USING btree
  (route_link_id COLLATE pg_catalog."default");

-- Index: traveline_journey_patterns_section_id_idx

-- DROP INDEX traveline_journey_patterns_section_id_idx;

CREATE INDEX traveline_journey_patterns_section_id_idx
  ON traveline_journey_patterns
  USING btree
  (section_id COLLATE pg_catalog."default");


-- Sequence: way_restrictions_id_seq

-- DROP SEQUENCE way_restrictions_id_seq;

CREATE SEQUENCE way_restrictions_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE way_restrictions_id_seq
  OWNER TO postgres;

-- Table: way_restrictions

-- DROP TABLE way_restrictions;

CREATE TABLE way_restrictions
(
  id integer NOT NULL DEFAULT nextval('way_restrictions_id_seq'::regclass),
  restriction character varying,
  from_osm_id character varying,
  to_osm_id character varying,
  car_cost double precision NOT NULL DEFAULT 10000000.0,
  bike_cost double precision NOT NULL DEFAULT 1.0,
  walk_cost double precision NOT NULL DEFAULT 0.0,
  from_id integer NOT NULL,
  to_id integer NOT NULL,
  bus_cost double precision NOT NULL DEFAULT 10000000.0,
  tram_cost double precision NOT NULL DEFAULT 10000000.0,
  investigate integer NOT NULL DEFAULT 0,
  train_cost double precision NOT NULL DEFAULT 10000000.0,
  CONSTRAINT ways_restrictions_pkey PRIMARY KEY (id),
  CONSTRAINT ways_from_id_fkey FOREIGN KEY (from_id)
      REFERENCES ways_clean (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT ways_to_id_fkey FOREIGN KEY (to_id)
      REFERENCES ways_clean (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE way_restrictions
  OWNER TO postgres;

-- Index: from_idx

-- DROP INDEX from_idx;

CREATE INDEX from_idx
  ON way_restrictions
  USING btree
  (from_id);

-- Index: to_idx

-- DROP INDEX to_idx;

CREATE INDEX to_idx
  ON way_restrictions
  USING btree
  (to_id);


-- Sequence: batch_items_id_seq

-- DROP SEQUENCE batch_items_id_seq;

CREATE SEQUENCE batch_items_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE batch_items_id_seq
  OWNER TO postgres;

-- Table: batch_items

-- DROP TABLE batch_items;

CREATE TABLE batch_items
(
  id integer NOT NULL DEFAULT nextval('batch_items_id_seq'::regclass),
  batch_id integer NOT NULL,
  source geometry(Point,27700) NOT NULL,
  target geometry(Point,27700),
  description character varying,
  source_node geometry(Point,27700),
  target_node geometry(Point,27700),
  import_census_id integer,
  walk_source_node geometry(Point,27700),
  walk_target_node geometry(Point,27700),
  cycle_source_node geometry(Point,27700),
  cycle_target_node geometry(Point,27700),
  car_source_node geometry(Point,27700),
  car_target_node geometry(Point,27700),
  CONSTRAINT batch_items_pkey PRIMARY KEY (id),
  CONSTRAINT batch_items_batch_id_fkey FOREIGN KEY (batch_id)
      REFERENCES batches (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE batch_items
  OWNER TO postgres;

-- Index: batch_item_source_gist

-- DROP INDEX batch_item_source_gist;

CREATE INDEX batch_item_source_gist
  ON batch_items
  USING gist
  (source);

-- Index: batch_item_target_gist

-- DROP INDEX batch_item_target_gist;

CREATE INDEX batch_item_target_gist
  ON batch_items
  USING gist
  (target);

-- Index: batch_items_batch_id_idx

-- DROP INDEX batch_items_batch_id_idx;

CREATE INDEX batch_items_batch_id_idx
  ON batch_items
  USING btree
  (batch_id);

-- Index: batch_run_res_run_idx

-- DROP INDEX batch_run_res_run_idx;

CREATE INDEX batch_run_res_run_idx
  ON batch_items
  USING btree
  (batch_id);


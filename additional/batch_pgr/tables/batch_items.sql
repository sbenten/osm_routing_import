-- Sequence: sheffield.batch_items_id_seq

-- DROP SEQUENCE sheffield.batch_items_id_seq;

CREATE SEQUENCE sheffield.batch_items_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE sheffield.batch_items_id_seq
  OWNER TO postgres;

-- Table: sheffield.batch_items

-- DROP TABLE sheffield.batch_items;

CREATE TABLE sheffield.batch_items
(
  id integer NOT NULL DEFAULT nextval('sheffield.batch_items_id_seq'::regclass),
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
      REFERENCES sheffield.batches (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE sheffield.batch_items
  OWNER TO postgres;

-- Index: sheffield.batch_item_source_gist

-- DROP INDEX sheffield.batch_item_source_gist;

CREATE INDEX batch_item_source_gist
  ON sheffield.batch_items
  USING gist
  (source);

-- Index: sheffield.batch_item_target_gist

-- DROP INDEX sheffield.batch_item_target_gist;

CREATE INDEX batch_item_target_gist
  ON sheffield.batch_items
  USING gist
  (target);

-- Index: sheffield.batch_items_batch_id_idx

-- DROP INDEX sheffield.batch_items_batch_id_idx;

CREATE INDEX batch_items_batch_id_idx
  ON sheffield.batch_items
  USING btree
  (batch_id);

-- Index: sheffield.batch_run_res_run_idx

-- DROP INDEX sheffield.batch_run_res_run_idx;

CREATE INDEX batch_run_res_run_idx
  ON sheffield.batch_items
  USING btree
  (batch_id);


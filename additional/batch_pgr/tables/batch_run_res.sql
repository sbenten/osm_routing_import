-- Sequence: sheffield.batch_run_res_group_id_seq

-- DROP SEQUENCE sheffield.batch_run_res_group_id_seq;

CREATE SEQUENCE sheffield.batch_run_res_group_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE sheffield.batch_run_res_group_id_seq
  OWNER TO postgres;

-- Sequence: sheffield.batch_run_res_id_seq

-- DROP SEQUENCE sheffield.batch_run_res_id_seq;

CREATE SEQUENCE sheffield.batch_run_res_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE sheffield.batch_run_res_id_seq
  OWNER TO postgres;

-- Sequence: sheffield.batch_run_res_sub_group_id_seq

-- DROP SEQUENCE sheffield.batch_run_res_sub_group_id_seq;

CREATE SEQUENCE sheffield.batch_run_res_sub_group_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE sheffield.batch_run_res_sub_group_id_seq
  OWNER TO postgres;

-- Table: sheffield.batch_run_res

-- DROP TABLE sheffield.batch_run_res;

CREATE TABLE sheffield.batch_run_res
(
  id integer NOT NULL DEFAULT nextval('sheffield.batch_run_res_id_seq'::regclass),
  batch_run_id integer NOT NULL,
  batch_item_id integer NOT NULL,
  group_id integer,
  mode character varying,
  itemsource geometry(Point,27700),
  itemtarget geometry(Point,27700),
  itemsourceway integer,
  itemtargetway integer,
  itemsourcepos double precision,
  itemtargetpos double precision,
  resseq integer,
  resnodeid integer,
  resedgeid integer,
  rescost double precision,
  resgeom geometry(LineString,27700),
  resstreetname character varying,
  errmsg character varying,
  resdelay double precision,
  sub_group_description character varying,
  sub_group_id integer,
  virtual_time_cost double precision DEFAULT 0.0,
  virtual_met_cost double precision DEFAULT 0.0,
  virtual_length_m double precision DEFAULT 0.0,
  virtual_built_up boolean DEFAULT false,
  group_description character varying,
  batch_item_description character varying,
  mode_filter integer,
  sub_mode_filter integer,
  CONSTRAINT batch_run_res_pkey PRIMARY KEY (id),
  CONSTRAINT batch_run_res_run_fkey FOREIGN KEY (batch_run_id)
      REFERENCES sheffield.batch_runs (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE sheffield.batch_run_res
  OWNER TO postgres;

-- Index: sheffield.batch_item_id_idx

-- DROP INDEX sheffield.batch_item_id_idx;

CREATE INDEX batch_item_id_idx
  ON sheffield.batch_run_res
  USING btree
  (batch_run_id);

-- Index: sheffield.batch_run_id_idx

-- DROP INDEX sheffield.batch_run_id_idx;

CREATE INDEX batch_run_id_idx
  ON sheffield.batch_run_res
  USING btree
  (batch_run_id);

-- Index: sheffield.group_id_idx

-- DROP INDEX sheffield.group_id_idx;

CREATE INDEX group_id_idx
  ON sheffield.batch_run_res
  USING btree
  (group_id);

-- Index: sheffield.res_edge_id_idx

-- DROP INDEX sheffield.res_edge_id_idx;

CREATE INDEX res_edge_id_idx
  ON sheffield.batch_run_res
  USING btree
  (resedgeid);

-- Index: sheffield.res_node_id_idx

-- DROP INDEX sheffield.res_node_id_idx;

CREATE INDEX res_node_id_idx
  ON sheffield.batch_run_res
  USING btree
  (resnodeid);

-- Index: sheffield.sub_group_id_idx

-- DROP INDEX sheffield.sub_group_id_idx;

CREATE INDEX sub_group_id_idx
  ON sheffield.batch_run_res
  USING btree
  (sub_group_id);


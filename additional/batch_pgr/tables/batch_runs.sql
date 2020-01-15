-- Table: sheffield.batch_runs

-- DROP TABLE sheffield.batch_runs;

CREATE TABLE sheffield.batch_runs
(
  id integer NOT NULL DEFAULT nextval('sheffield.batch_runs_id_seq'::regclass),
  run_date timestamp without time zone NOT NULL DEFAULT now(),
  batch_id integer NOT NULL,
  batchname character varying,
  batchdescription character varying,
  errmsg character varying,
  CONSTRAINT batch_runs_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE sheffield.batch_runs
  OWNER TO postgres;

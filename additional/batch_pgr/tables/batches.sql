-- Sequence: sheffield.batches_id_seq

-- DROP SEQUENCE sheffield.batches_id_seq;

CREATE SEQUENCE sheffield.batches_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE sheffield.batches_id_seq
  OWNER TO postgres;

-- Table: sheffield.batches

-- DROP TABLE sheffield.batches;

CREATE TABLE sheffield.batches
(
  id integer NOT NULL DEFAULT nextval('sheffield.batches_id_seq'::regclass),
  name character varying,
  description character varying,
  CONSTRAINT batches_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE sheffield.batches
  OWNER TO postgres;

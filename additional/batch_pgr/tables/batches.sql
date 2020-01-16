-- Sequence: batches_id_seq

-- DROP SEQUENCE batches_id_seq;

CREATE SEQUENCE batches_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE batches_id_seq
  OWNER TO postgres;

-- Table: batches

-- DROP TABLE batches;

CREATE TABLE batches
(
  id integer NOT NULL DEFAULT nextval('batches_id_seq'::regclass),
  name character varying,
  description character varying,
  CONSTRAINT batches_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE batches
  OWNER TO postgres;

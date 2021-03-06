﻿-- Table: wf01buk_oa_v2

-- DROP TABLE wf01buk_oa_v2;

CREATE TABLE wf01buk_oa_v2
(
  source_oa character varying NOT NULL,
  target_oa character varying NOT NULL,
  count integer,
  source_found boolean DEFAULT false,
  target_found boolean DEFAULT false,
  CONSTRAINT wf01buk_oa_v2_pkey PRIMARY KEY (source_oa, target_oa)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE wf01buk_oa_v2
  OWNER TO postgres;

-- Index: wf01buk_oa_v2_source_oa_idx

-- DROP INDEX wf01buk_oa_v2_source_oa_idx;

CREATE INDEX wf01buk_oa_v2_source_oa_idx
  ON wf01buk_oa_v2
  USING btree
  (source_oa COLLATE pg_catalog."default");

-- Index: wf01buk_oa_v2_target_oa_idx

-- DROP INDEX wf01buk_oa_v2_target_oa_idx;

CREATE INDEX wf01buk_oa_v2_target_oa_idx
  ON wf01buk_oa_v2
  USING btree
  (target_oa COLLATE pg_catalog."default");


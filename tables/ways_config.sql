-- Table: ways_config

-- DROP TABLE ways_config;

CREATE TABLE ways_config
(
  name character varying NOT NULL,
  type character varying NOT NULL,
  network_speed smallint NOT NULL DEFAULT 5,
  urban_speed smallint NOT NULL DEFAULT 5,
  CONSTRAINT ways_config_pkey PRIMARY KEY (name, type)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ways_config
  OWNER TO postgres;

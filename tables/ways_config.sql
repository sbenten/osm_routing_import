-- Table: import.ways_config

-- DROP TABLE import.ways_config;

CREATE TABLE import.ways_config
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
ALTER TABLE import.ways_config
  OWNER TO postgres;

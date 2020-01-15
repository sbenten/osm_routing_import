-- Table: import.settings

-- DROP TABLE import.settings;

CREATE TABLE import.settings
(
  name character varying NOT NULL,
  val character varying NOT NULL,
  description character varying NOT NULL,
  CONSTRAINT settings_name_key UNIQUE (name)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE import.settings
  OWNER TO postgres;

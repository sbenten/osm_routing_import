-- Table: settings

-- DROP TABLE settings;

CREATE TABLE settings
(
  name character varying NOT NULL,
  val character varying NOT NULL,
  description character varying NOT NULL,
  CONSTRAINT settings_name_key UNIQUE (name)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE settings
  OWNER TO postgres;

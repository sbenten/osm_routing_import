-- Table: os_open_names

-- DROP TABLE os_open_names;

CREATE TABLE os_open_names
(
  id character varying NOT NULL,
  geom geometry(MultiPoint,27700),
  name character varying(254),
  type character varying(254),
  sub_type character varying(254),
  x numeric,
  y numeric,
  outcode character varying(254),
  CONSTRAINT os_open_names_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE os_open_names
  OWNER TO postgres;
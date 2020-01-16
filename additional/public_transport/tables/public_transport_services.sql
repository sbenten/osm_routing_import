-- Sequence: public_transport_services_id_seq

-- DROP SEQUENCE public_transport_services_id_seq;

CREATE SEQUENCE public_transport_services_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public_transport_services_id_seq
  OWNER TO postgres;

-- Table: public_transport_services

-- DROP TABLE public_transport_services;

CREATE TABLE public_transport_services
(
  id integer NOT NULL DEFAULT nextval('public_transport_services_id_seq'::regclass),
  import_file_id integer,
  service_code character varying NOT NULL,
  line_name character varying NOT NULL,
  start_date character varying NOT NULL,
  end_date character varying,
  mode character varying NOT NULL,
  description character varying NOT NULL,
  national_operator_code character varying NOT NULL,
  operator_code character varying NOT NULL,
  operator_name character varying NOT NULL,
  CONSTRAINT public_transport_services_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public_transport_services
  OWNER TO postgres;
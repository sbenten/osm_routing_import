-- Sequence: import.public_transport_links_id_seq

-- DROP SEQUENCE import.public_transport_links_id_seq;

CREATE SEQUENCE import.public_transport_links_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE import.public_transport_links_id_seq
  OWNER TO postgres;

-- Table: import.public_transport_links

-- DROP TABLE import.public_transport_links;

CREATE TABLE import.public_transport_links
(
  parent_vehicle_journey_code character varying NOT NULL,
  vehicle_journey_code character varying NOT NULL,
  CONSTRAINT public_transport_links_pkey PRIMARY KEY (parent_vehicle_journey_code, vehicle_journey_code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE import.public_transport_links
  OWNER TO postgres;

-- Index: import.public_transport_link_vehicle_journey_codes_idx

-- DROP INDEX import.public_transport_link_vehicle_journey_codes_idx;

CREATE INDEX public_transport_link_vehicle_journey_codes_idx
  ON import.public_transport_links
  USING btree
  (vehicle_journey_code COLLATE pg_catalog."default");


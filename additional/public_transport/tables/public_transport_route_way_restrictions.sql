-- Sequence: import.public_transport_route_way_restrictions_id_seq

-- DROP SEQUENCE import.public_transport_route_way_restrictions_id_seq;

CREATE SEQUENCE import.public_transport_route_way_restrictions_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE import.public_transport_route_way_restrictions_id_seq
  OWNER TO postgres;

-- Table: import.public_transport_route_way_restrictions

-- DROP TABLE import.public_transport_route_way_restrictions;

CREATE TABLE import.public_transport_route_way_restrictions
(
  id integer NOT NULL DEFAULT nextval('import.public_transport_route_way_restrictions_id_seq'::regclass),
  restriction character varying,
  cost double precision NOT NULL DEFAULT 10000000.0,
  from_id integer NOT NULL,
  to_id integer NOT NULL,
  CONSTRAINT public_transport_route_way_restrictions_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE import.public_transport_route_way_restrictions
  OWNER TO postgres;

-- Index: import.public_transport_route_way_restrictions_from_idx

-- DROP INDEX import.public_transport_route_way_restrictions_from_idx;

CREATE INDEX public_transport_route_way_restrictions_from_idx
  ON import.public_transport_route_way_restrictions
  USING btree
  (from_id);

-- Index: import.public_transport_route_way_restrictions_to_idx

-- DROP INDEX import.public_transport_route_way_restrictions_to_idx;

CREATE INDEX public_transport_route_way_restrictions_to_idx
  ON import.public_transport_route_way_restrictions
  USING btree
  (to_id);


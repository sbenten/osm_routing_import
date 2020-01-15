-- Sequence: import.ways_clean_id_seq

-- DROP SEQUENCE import.ways_clean_id_seq;

CREATE SEQUENCE import.ways_clean_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE import.ways_clean_id_seq
  OWNER TO postgres;


-- Table: sheffield.ways_clean

-- DROP TABLE sheffield.ways_clean;

CREATE TABLE sheffield.ways_clean
(
  id integer NOT NULL,
  ways_id integer,
  geom geometry(LineString,27700),
  osm_id character varying,
  name character varying,
  highway character varying,
  z_order integer,
  attrs hstore,
  source integer,
  target integer,
  length_m double precision,
  built_up boolean,
  has_bridge boolean,
  has_tunnel boolean,
  has_parking boolean,
  curve_index double precision,
  terrain_index double precision,
  car_cost double precision,
  car_reverse_cost double precision,
  bus_cost double precision,
  bus_reverse_cost double precision,
  tram_cost double precision,
  tram_reverse_cost double precision,
  cycle_cost double precision,
  cycle_reverse_cost double precision,
  walk_cost double precision,
  walk_reverse_cost double precision,
  car_cost_time double precision,
  car_reverse_cost_time double precision,
  bus_cost_time double precision,
  bus_reverse_cost_time double precision,
  tram_cost_time double precision,
  tram_reverse_cost_time double precision,
  cycle_cost_time double precision,
  cycle_reverse_cost_time double precision,
  walk_cost_time double precision,
  walk_reverse_cost_time double precision,
  car_cost_met double precision,
  car_reverse_cost_met double precision,
  bus_cost_met double precision,
  bus_reverse_cost_met double precision,
  tram_cost_met double precision,
  tram_reverse_cost_met double precision,
  cycle_cost_met double precision,
  cycle_reverse_cost_met double precision,
  walk_cost_met double precision,
  walk_reverse_cost_met double precision,
  car_speed smallint,
  bus_speed smallint,
  tram_speed smallint,
  cycle_speed smallint,
  walk_speed smallint,
  car_allow boolean,
  bus_allow boolean,
  cycle_allow boolean,
  walk_allow boolean,
  tram_allow boolean,
  park_allow boolean,
  car_oneway smallint,
  bus_oneway smallint,
  tram_oneway smallint,
  cycle_oneway smallint,
  walk_oneway smallint,
  startaltitude double precision,
  endaltitude double precision,
  percentslope double precision,
  reversepercentslope double precision,
  angleslope double precision,
  reverseangleslope double precision,
  totalascent double precision,
  totaldescent double precision,
  train_cost double precision,
  train_reverse_cost double precision,
  train_cost_time double precision,
  train_reverse_cost_time double precision,
  train_cost_met double precision,
  train_reverse_cost_met double precision,
  train_allow boolean,
  train_oneway smallint,
  train_speed smallint,
  has_permit boolean NOT NULL DEFAULT false,
  bicycle_infrastructure character varying NOT NULL DEFAULT 'none'::character varying,
  total_accidents integer NOT NULL DEFAULT 0,
  pedestrian_accidents integer NOT NULL DEFAULT 0,
  cyclist_accidents integer NOT NULL DEFAULT 0,
  total_count integer NOT NULL DEFAULT 0,
  bike_count integer NOT NULL DEFAULT 0,
  walk_count integer NOT NULL DEFAULT 0,
  strava_commute_count integer NOT NULL DEFAULT 0,
  strava_weighted integer NOT NULL DEFAULT 0,
  bike_weighted integer NOT NULL DEFAULT 0,
  total_accident_weighted integer NOT NULL DEFAULT 0,
  cycle_accident_weighted integer NOT NULL DEFAULT 0,
  CONSTRAINT ways_clean_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE sheffield.ways_clean
  OWNER TO postgres;

-- Index: sheffield.source_idx

-- DROP INDEX sheffield.source_idx;

CREATE INDEX source_idx
  ON sheffield.ways_clean
  USING btree
  (source);

-- Index: sheffield.target_idx

-- DROP INDEX sheffield.target_idx;

CREATE INDEX target_idx
  ON sheffield.ways_clean
  USING btree
  (target);

-- Index: sheffield.ways_clean_gist

-- DROP INDEX sheffield.ways_clean_gist;

CREATE INDEX ways_clean_gist
  ON sheffield.ways_clean
  USING gist
  (geom);


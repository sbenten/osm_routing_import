-- Table: dft.accidents

-- DROP TABLE dft.accidents;

CREATE TABLE dft.accidents
(
  id character varying NOT NULL,
  location_easting_osgr integer,
  location_northing_osgr integer,
  longitude double precision,
  latitude double precision,
  police_force integer NOT NULL,
  accident_severity integer NOT NULL,
  number_of_vehicles integer NOT NULL,
  number_of_casualties integer NOT NULL,
  date_text character varying NOT NULL,
  day_of_week integer NOT NULL,
  time_text character varying,
  local_authority_district integer NOT NULL,
  local_authority_highway character varying NOT NULL,
  first_road_class integer NOT NULL,
  first_road_number integer NOT NULL,
  road_type integer NOT NULL,
  speed_limit integer NOT NULL,
  junction_detail integer NOT NULL,
  junction_control integer NOT NULL,
  second_road_class integer NOT NULL,
  second_road_number integer NOT NULL,
  ped_xing_human_control integer NOT NULL,
  ped_xing_physical_facilities integer NOT NULL,
  light_conditions integer NOT NULL,
  weather_conditions integer NOT NULL,
  road_surface_conditions integer NOT NULL,
  special_conditions_at_site integer NOT NULL,
  carriageway_hazards integer NOT NULL,
  urban_or_rural_area integer NOT NULL,
  police_attended integer NOT NULL,
  lsoa_of_accident_location character varying,
  study boolean DEFAULT false,
  pedestrian boolean DEFAULT false,
  cyclist boolean DEFAULT false,
  CONSTRAINT accidents_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE dft.accidents
  OWNER TO postgres;

-- Table: dft.accidents_ex

-- DROP TABLE dft.accidents_ex;

CREATE TABLE dft.accidents_ex
(
  accident_id character varying NOT NULL,
  geom geometry(Point,27700),
  date timestamp without time zone,
  CONSTRAINT accidents_ex_accident_id_fkey FOREIGN KEY (accident_id)
      REFERENCES dft.accidents (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE dft.accidents_ex
  OWNER TO postgres;

-- Index: dft.accidents_ex_geom_idx

-- DROP INDEX dft.accidents_ex_geom_idx;

CREATE INDEX accidents_ex_geom_idx
  ON dft.accidents_ex
  USING gist
  (geom);

-- Table: dft.casualities

-- DROP TABLE dft.casualities;

CREATE TABLE dft.casualities
(
  accident_id character varying NOT NULL,
  vehicle_reference integer NOT NULL,
  reference integer NOT NULL,
  class integer NOT NULL,
  sex integer NOT NULL,
  age_band integer NOT NULL,
  severity integer NOT NULL,
  pedestrian_location integer NOT NULL,
  pedestrian_movement integer NOT NULL,
  car_passenger integer NOT NULL,
  bus_or_coach_passenger integer NOT NULL,
  pedestrian_road_maintenance_worker integer NOT NULL,
  casuality_type integer NOT NULL,
  casuality_home_area_type integer NOT NULL,
  age integer,
  casuality_imd_decile integer,
  CONSTRAINT accidents_ex_accident_id_fkey FOREIGN KEY (accident_id)
      REFERENCES dft.accidents (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE dft.casualities
  OWNER TO postgres;

-- Index: dft.casuality_severity_idx

-- DROP INDEX dft.casuality_severity_idx;

CREATE INDEX casuality_severity_idx
  ON dft.casualties
  USING btree
  (severity);

-- Index: dft.casuality_type_idx

-- DROP INDEX dft.casuality_type_idx;

CREATE INDEX casuality_type_idx
  ON dft.casualties
  USING btree
  (casuality_type);

-- Table: dft.vehicles

-- DROP TABLE dft.vehicles;

CREATE TABLE dft.vehicles
(
  accident_id character varying NOT NULL,
  reference integer NOT NULL,
  type integer NOT NULL,
  towing_and_articulation integer NOT NULL,
  manoevre integer NOT NULL,
  restricted_lane integer NOT NULL,
  junction_location integer NOT NULL,
  skidding_and_overturning integer NOT NULL,
  hit_object_in_carriageway integer NOT NULL,
  leaving_carriageway integer NOT NULL,
  hit_object_off_cariageway integer NOT NULL,
  first_point_of_impact integer NOT NULL,
  left_hand_drive integer NOT NULL,
  journey_purpose_of_driver integer NOT NULL,
  sex_of_driver integer NOT NULL,
  age_band_of_driver integer NOT NULL,
  engine_capacity integer NOT NULL,
  propulsion_code integer NOT NULL,
  age_of_vehicle integer NOT NULL,
  driver_imd_decile integer NOT NULL,
  driver_home_area_type integer NOT NULL,
  age_of_driver integer,
  vehicle_imd_decile integer,
  CONSTRAINT accidents_ex_accident_id_fkey FOREIGN KEY (accident_id)
      REFERENCES dft.accidents (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE dft.vehicles
  OWNER TO postgres;

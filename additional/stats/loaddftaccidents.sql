/*
A loose collection of scripts to load data accident data from DfT.
1. COPY the CSV files into PostgreSQL one at a time as NULL values and additional columns make for errors.
   Uncomment and comment the lines as you go.
2. Then create a point for the accident in the accidents_ex table.
3. Limit the data to the study area.
4. Copy back to the study schema for ease of use.
5. Update highway edges with accident counts.
*/

COPY dft.accidents(id,
	location_easting_osgr,
	location_northing_osgr,
	longitude,
	latitude,
	police_force,
	accident_severity,
	number_of_vehicles,
	number_of_casualties,
	date_text,
	day_of_week,
	time_text,
	local_authority_district,
	local_authority_highway,
	first_road_class,
	first_road_number,
	road_type,
	speed_limit,
	junction_detail,
	junction_control,
	second_road_class,
	second_road_number,
	ped_xing_human_control,
	ped_xing_physical_facilities,
	light_conditions,
	weather_conditions,
	road_surface_conditions,
	special_conditions_at_site,
	carriageway_hazards,
	urban_or_rural_area,
	police_attended,
	lsoa_of_accident_location) 
--FROM 'D:\Department for Transport\2011_Accidents.csv' DELIMITER ',' CSV HEADER;
--FROM 'D:\Department for Transport\2012_Accidents.csv' DELIMITER ',' CSV HEADER;
--FROM 'D:\Department for Transport\2013_Accidents.csv' DELIMITER ',' CSV HEADER;
--FROM 'D:\Department for Transport\2014_Accidents.csv' DELIMITER ',' CSV HEADER;
--FROM 'D:\Department for Transport\2015_Accidents.csv' DELIMITER ',' CSV HEADER;
--NULLs in speed limit
--FROM 'D:\Department for Transport\2016_Accidents.csv' DELIMITER ',' CSV HEADER;
--NULLs in long/lat
--FROM 'D:\Department for Transport\2017_Accidents.csv' DELIMITER ',' CSV HEADER;
FROM 'D:\Department for Transport\2018_Accidents.csv' DELIMITER ',' CSV HEADER;


COPY dft.casualties (
	accident_id ,
	vehicle_reference,
	reference,
	class,
	sex,
	age, --since 2014
	age_band,
	severity,
	pedestrian_location,
	pedestrian_movement,
	car_passenger,
	bus_or_coach_passenger,
	pedestrian_road_maintenance_worker,
	casualty_type,
	casualty_home_area_type,
	casualty_imd_decile) --since 2015
--FROM 'D:\Department for Transport\2011_Casualties.csv' DELIMITER ',' CSV HEADER;
--FROM 'D:\Department for Transport\2012_Casualties.csv' DELIMITER ',' CSV HEADER;
--FROM 'D:\Department for Transport\2013_Casualties.csv' DELIMITER ',' CSV HEADER;
--FROM 'D:\Department for Transport\2014_Casualties.csv' DELIMITER ',' CSV HEADER;
--FROM 'D:\Department for Transport\2015_Casualties.csv' DELIMITER ',' CSV HEADER;
--FROM 'D:\Department for Transport\2016_Casualties.csv' DELIMITER ',' CSV HEADER;
--FROM 'D:\Department for Transport\2017_Casualties.csv' DELIMITER ',' CSV HEADER;
FROM 'D:\Department for Transport\2018_Casualties.csv' DELIMITER ',' CSV HEADER;




COPY dft.vehicles (
	accident_id,
	reference,
	type,
	towing_and_articulation,
	manoevre,
	restricted_lane,
	junction_location,
	skidding_and_overturning,
	hit_object_in_carriageway,
	leaving_carriageway,
	hit_object_off_cariageway,
	first_point_of_impact,
	left_hand_drive,
	journey_purpose_of_driver,
	sex_of_driver,
	age_of_driver, --since 2014
	age_band_of_driver,
	engine_capacity,
	propulsion_code,
	age_of_vehicle,
	driver_imd_decile,
	driver_home_area_type,
	vehicle_imd_decile) --since 2015
--FROM 'D:\Department for Transport\2011_Vehicles.csv' DELIMITER ',' CSV HEADER;
--FROM 'D:\Department for Transport\2012_Vehicles.csv' DELIMITER ',' CSV HEADER;
--FROM 'D:\Department for Transport\2013_Vehicles.csv' DELIMITER ',' CSV HEADER;
--FROM 'D:\Department for Transport\2014_Vehicles.csv' DELIMITER ',' CSV HEADER;
--FROM 'D:\Department for Transport\2015_Vehicles.csv' DELIMITER ',' CSV HEADER;
--FROM 'D:\Department for Transport\2016_Vehicles.csv' DELIMITER ',' CSV HEADER;
--FROM 'D:\Department for Transport\2017_Vehicles.csv' DELIMITER ',' CSV HEADER;
FROM 'D:\Department for Transport\2018_Vehicles.csv' DELIMITER ',' CSV HEADER;

--Now it's all imported add the geometry and real date time value
INSERT INTO dft.accidents_ex
SELECT id,
	ST_SetSRID(ST_MakePoint(location_easting_osgr, location_northing_osgr), 27700),
	To_TimeStamp(date_text || ' ' || time_text, 'DD/MM/YYYY HH24:MI')
FROM dft.accidents
WHERE NOT EXISTS (
	SELECT accident_id 
	FROM dft.accidents_ex
	WHERE dft.accidents_ex.accident_id = dft.accidents.id
);

--Geographically limit accidents to within study area
WITH x AS (
	SELECT geom
	FROM ttw_boundaries
	WHERE objectid = 118
),
y AS (
	SELECT a.accident_id
	FROM dft.accidents_ex a, x
	WHERE ST_Contains(x.geom, a.geom)
)
UPDATE dft.accidents SET study = true
FROM y
WHERE id = y.accident_id

--accident involving pedestrian casualty
WITH x AS (
	SELECT accident_id FROM dft.casualties WHERE casuality_type = 0
)
UPDATE dft.accidents SET pedestrian = true
FROM x
WHERE id = x.accident_id

--accident involving cyclist casualty
WITH x AS (
	SELECT accident_id FROM dft.casualties WHERE casuality_type = 1
)
UPDATE dft.accidents SET cyclist = true
FROM x
WHERE id = x.accident_id

SELECT * FROM dft.casualties
WHERE casuality_type In (0, 1)

/*
Codes in columns of interest...

Casualty class
1	Driver or rider
2	Passenger
3	Pedestrian


Casualty type
0	Pedestrian
1	Cyclist
2	Motorcycle 50cc and under rider or passenger
3	Motorcycle 125cc and under rider or passenger
4	Motorcycle over 125cc and up to 500cc rider or  passenger
5	Motorcycle over 500cc rider or passenger
8	Taxi/Private hire car occupant
9	Car occupant
10	Minibus (8 - 16 passenger seats) occupant
11	Bus or coach occupant (17 or more pass seats)
16	Horse rider
17	Agricultural vehicle occupant
18	Tram occupant
19	Van / Goods vehicle (3.5 tonnes mgw or under) occupant
20	Goods vehicle (over 3.5t. and under 7.5t.) occupant
21	Goods vehicle (7.5 tonnes mgw and over) occupant
22	Mobility scooter rider
23	Electric motorcycle rider or passenger
90	Other vehicle occupant
97	Motorcycle - unknown cc rider or passenger
98	Goods vehicle (unknown weight) occupant
*/


/*
Copy back across to study area schema for later analysis
*/
DROP TABLE accidents

CREATE TABLE accidents AS
SELECT a.id, a.accident_severity as severity, a.police_attended, a.pedestrian, a.cyclist, x.geom, x.date
FROM dft.accidents a
JOIN dft.accidents_ex x ON x.accident_id = a.id
WHERE a.study = true;

ALTER TABLE accidents RENAME COLUMN accident_id TO id;
ALTER TABLE accidents ADD CONSTRAINT accidents_pkey PRIMARY KEY (id);


/*
Update highway edges with accident counts
*/
UPDATE ways_clean SET cyclist_accidents = COALESCE(x.accident_count, 0)
FROM (
	SELECT w.id, count(a.geom) AS accident_count
	FROM ways_clean w
	LEFT JOIN accidents a ON ST_Contains(ST_Buffer(w.geom, 10.0), a.geom) 
	WHERE w.cycle_allow AND
	a.cyclist = true
	GROUP BY w.id	
) x 
WHERE ways_clean.id = x.id;


UPDATE ways_clean SET pedestrian_accidents = COALESCE(x.accident_count, 0)
FROM (
	SELECT w.id, count(a.geom) AS accident_count
	FROM ways_clean w
	LEFT JOIN accidents a ON ST_Contains(ST_Buffer(w.geom, 10.0), a.geom) 
	WHERE w.walk_allow AND
	a.pedestrian = true
	GROUP BY w.id	
) x 
WHERE ways_clean.id = x.id;


UPDATE ways_clean SET total_accidents = COALESCE(x.accident_count, 0)
FROM (
	SELECT w.id, count(a.geom) AS accident_count
	FROM ways_clean w
	LEFT JOIN accidents a ON ST_Contains(ST_Buffer(w.geom, 10.0), a.geom) 
	GROUP BY w.id	
) x 
WHERE ways_clean.id = x.id;
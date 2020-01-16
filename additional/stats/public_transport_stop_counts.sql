/*
Create some data to analyse the availability of public transport by LSOA
We have all the bits already....lsoa polygons with deprivation decile data, public transport stop points and timetable data...
*/
/* 
Create a copy of the lsoa table for data wrangling
*/
CREATE TABLE lsoa_imd_sheffield_pt AS
SELECT * FROM lsoa_imd_sheffield;

ALTER TABLE lsoa_imd_sheffield_pt 
	ADD CONSTRAINT lsoa_imd_sheffield_pt_pkey PRIMARY KEY (id);

CREATE INDEX lsoa_imd_sheffield_pt_geom_idx
  ON lsoa_imd_sheffield_pt
  USING gist
  (geom);

ALTER TABLE lsoa_imd_sheffield_pt
	ADD COLUMN stop_count integer,
	ADD COLUMN morning_stop_time_count integer,
	ADD COLUMN evening_stop_time_count integer,
	ADD COLUMN total_stop_time_count integer;
/*
Calculate the density of stops and the availability of services
*/
DO
$$
DECLARE
rec record;
v_stop_count integer;
v_morning_stop_time_count integer;
v_evening_stop_time_count integer;

BEGIN

	FOR rec IN
		SELECT id, label, geom FROM lsoa_imd_sheffield_pt
	LOOP

		SELECT count(1) INTO v_stop_count
		FROM public_transport_stops
		WHERE ST_Contains(rec.geom, geom);

		RAISE NOTICE '%, %', rec.label, v_stop_count;

		SELECT count(1) INTO v_morning_stop_time_count
		FROM public_transport_route_times
		WHERE ST_Contains(rec.geom, geom)
		AND stop_time >= '07:00:00'::time without time zone
		AND stop_time <= '09:00:00'::time without time zone;

		SELECT count(1) INTO v_evening_stop_time_count
		FROM public_transport_route_times
		WHERE ST_Contains(rec.geom, geom)
		AND stop_time >= '16:00:00'::time without time zone
		AND stop_time <= '18:00:00'::time without time zone;

		UPDATE lsoa_imd_sheffield_pt
		SET stop_count = v_stop_count,
			morning_stop_time_count = v_morning_stop_time_count,
			evening_stop_time_count = v_evening_stop_time_count,
			total_stop_time_count = (v_morning_stop_time_count + v_evening_stop_time_count)
		WHERE id = rec.id;

	END LOOP;
END
$$ language plpgsql;

/*
Normalise the counts by converting each to a percentage
*/
ALTER TABLE lsoa_imd_sheffield_pt
	ADD COLUMN stop_norm decimal,
	ADD COLUMN morning_stop_time_norm decimal,
	ADD COLUMN evening_stop_time_norm decimal,
	ADD COLUMN total_stop_time_norm decimal;

UPDATE lsoa_imd_sheffield_pt SET
	stop_norm = (stop_count / ST_Area(geom)) * 1000,
	morning_stop_time_norm = (morning_stop_time_count / ST_Area(geom)) * 1000,
	evening_stop_time_norm = (evening_stop_time_count / ST_Area(geom)) * 1000,
	total_stop_time_norm = (total_stop_time_count / ST_Area(geom)) * 1000;

/*
Repeat, exceot with a buffer of 10 meters, so small lsoa's or those with no major roads can see if a service is just over the boundary
*/
ALTER TABLE lsoa_imd_sheffield_pt
	ADD COLUMN stop_count_b10 integer,
	ADD COLUMN morning_stop_time_count_b10 integer,
	ADD COLUMN evening_stop_time_count_b10 integer,
	ADD COLUMN total_stop_time_count_b10 integer;	


DO
$$
DECLARE
rec record;
v_stop_count integer;
v_morning_stop_time_count integer;
v_evening_stop_time_count integer;

BEGIN

	FOR rec IN
		SELECT id, label, ST_Buffer(geom, 10) AS geom FROM lsoa_imd_sheffield_pt
	LOOP

		SELECT count(1) INTO v_stop_count
		FROM public_transport_stops
		WHERE ST_Intersects(rec.geom, geom);

		RAISE NOTICE '%, %', rec.label, v_stop_count;

		SELECT count(1) INTO v_morning_stop_time_count
		FROM public_transport_route_times
		WHERE ST_Intersects(rec.geom, geom)
		AND stop_time >= '07:00:00'::time without time zone
		AND stop_time <= '09:00:00'::time without time zone;

		RAISE NOTICE '%, %', rec.label, v_morning_stop_time_count;

		SELECT count(1) INTO v_evening_stop_time_count
		FROM public_transport_route_times
		WHERE ST_Intersects(rec.geom, geom)
		AND stop_time >= '16:00:00'::time without time zone
		AND stop_time <= '18:00:00'::time without time zone;

		RAISE NOTICE '%, %', rec.label, v_evening_stop_time_count;

		UPDATE lsoa_imd_sheffield_pt
		SET stop_count_b10 = v_stop_count,
			morning_stop_time_count_b10 = v_morning_stop_time_count,
			evening_stop_time_count_b10 = v_evening_stop_time_count,
			total_stop_time_count_b10 = (v_morning_stop_time_count + v_evening_stop_time_count)
		WHERE id = rec.id;

	END LOOP;
END
$$ language plpgsql;

	
/*
And with a 25 meter buffer...
*/
ALTER TABLE lsoa_imd_sheffield_pt
	ADD COLUMN stop_count_b25 integer,
	ADD COLUMN morning_stop_time_count_b25 integer,
	ADD COLUMN evening_stop_time_count_b25 integer,
	ADD COLUMN total_stop_time_count_b25 integer;	


DO
$$
DECLARE
rec record;
v_stop_count integer;
v_morning_stop_time_count integer;
v_evening_stop_time_count integer;

BEGIN

	FOR rec IN
		SELECT id, label, ST_Buffer(geom, 25) AS geom FROM lsoa_imd_sheffield_pt
	LOOP

		SELECT count(1) INTO v_stop_count
		FROM public_transport_stops
		WHERE ST_Intersects(rec.geom, geom);

		RAISE NOTICE '%, %', rec.label, v_stop_count;

		SELECT count(1) INTO v_morning_stop_time_count
		FROM public_transport_route_times
		WHERE ST_Intersects(rec.geom, geom)
		AND stop_time >= '07:00:00'::time without time zone
		AND stop_time <= '09:00:00'::time without time zone;

		RAISE NOTICE '%, %', rec.label, v_morning_stop_time_count;

		SELECT count(1) INTO v_evening_stop_time_count
		FROM public_transport_route_times
		WHERE ST_Intersects(rec.geom, geom)
		AND stop_time >= '16:00:00'::time without time zone
		AND stop_time <= '18:00:00'::time without time zone;

		RAISE NOTICE '%, %', rec.label, v_evening_stop_time_count;

		UPDATE lsoa_imd_sheffield_pt
		SET stop_count_b25 = v_stop_count,
			morning_stop_time_count_b25 = v_morning_stop_time_count,
			evening_stop_time_count_b25 = v_evening_stop_time_count,
			total_stop_time_count_b25 = (v_morning_stop_time_count + v_evening_stop_time_count)
		WHERE id = rec.id;

	END LOOP;
END
$$ language plpgsql;
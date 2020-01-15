/*
A collection of scripts to allow analysis of basic flow direction from census travel to work data
Not to be confused with the sampling and modelling of flows by different modes (perhaps should have used a better naming convention...)
Table creation scripts kept within this file 
Check inward or outward flows from city and town centers from the sampled data.
*/
/*
First, just those records that have been sampled for routing
*/
CREATE TABLE sheffield.census_flows AS 
SELECT * 
FROM import.wf01buk_oa_v2
WHERE source_found = true AND target_found = true;

CREATE INDEX census_flows_source_oa_idx
  ON sheffield.census_flows
  USING btree
  (source_oa COLLATE pg_catalog."default");

CREATE INDEX census_flows_target_oa_idx
  ON sheffield.census_flows
  USING btree
  (target_oa COLLATE pg_catalog."default");

ALTER TABLE sheffield.census_flows 
	ADD COLUMN sampled boolean DEFAULT false,
	ADD COLUMN source_geom geometry(MultiPolygon,27700),
	ADD COLUMN target_geom geometry(MultiPolygon,27700);

CREATE INDEX census_flows_source_gist 
  ON sheffield.census_flows 
  USING gist (source_geom);

CREATE INDEX census_flows_target_gist 
  ON sheffield.census_flows 
  USING gist (target_geom);

UPDATE sheffield.census_flows SET sampled = TRUE
WHERE EXISTS (
	SELECT c.source_oa
	FROM import.census_flow_sample c
	WHERE c.source_oa = sheffield.census_flows.source_oa
	AND c.target_oa = sheffield.census_flows.target_oa
);

DELETE FROM sheffield.census_flows WHERE sampled = FALSE;

ALTER TABLE sheffield.census_flows 
	DROP COLUMN source_found,
	DROP COLUMN target_found,
	DROP COLUMN sampled;

/*
Assign source and target OA polygons to each record
*/ 
WITH x AS (
	SELECT geo_code, geom FROM import.output_areas_2011 WHERE include = true
)
UPDATE sheffield.census_flows 
SET source_geom = x.geom
FROM x
WHERE sheffield.census_flows.source_oa = x.geo_code;


WITH x AS (
	SELECT geo_code, geom FROM import.output_areas_2011 WHERE include = true
)
UPDATE sheffield.census_flows 
SET target_geom = x.geom
FROM x
WHERE sheffield.census_flows.target_oa = x.geo_code;

/*
Add some basic IMD info based on geographic overlap of differnet areal polygons
*/
ALTER TABLE sheffield.census_flows 
	ADD COLUMN code character varying(254),
	ADD COLUMN ovrk2015 bigint,
	ADD COLUMN decile integer NOT NULL DEFAULT 0,
	ADD COLUMN quintile integer NOT NULL DEFAULT 0,
	ADD COLUMN hlth2015 integer,
	ADD COLUMN hlthdecile integer,
	ADD COLUMN hlthquintile integer;


UPDATE sheffield.census_flows SET
	code = x.code, 
	ovrk2015 = x.ovrk2015, 
	decile = x.decile, 
	quintile = x.quintile, 
	hlth2015 = x.hlth2015, 
	hlthdecile = x.hlthdecile, 
	hlthquintile = x.hlthquintile
FROM (
	SELECT * FROM sheffield.lsoa_imd_sheffield
) x
WHERE ST_Within(sheffield.census_flows.source_geom, x.geom) OR ST_Overlaps(sheffield.census_flows.source_geom, x.geom);

/*
Add a Euclidean flow line
*/
ALTER TABLE sheffield.census_flows ADD COLUMN geom geometry(LineString,27700);

UPDATE sheffield.census_flows SET geom = ST_Makeline(ST_Centroid(source_geom), ST_Centroid(target_geom));

/*
Probably ought to have a surraget identifier
*/

CREATE SEQUENCE sheffield.census_flows_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

ALTER TABLE sheffield.census_flows ADD COLUMN id INTEGER NOT NULL DEFAULT nextval('sheffield.census_flows_seq'::regclass);

/*
REMOVE OA flows where the same home and work is specified
*/
DELETE FROM sheffield.census_flows WHERE source_oa = target_oa;

/*
Check which is the closest major settlement to flow home and work locations and assign  
If the same home and work settlement check which is closest and assign in/out flow
If different assign outflow(?)
*/
ALTER TABLE sheffield.census_flows
	ADD COLUMN home_settlement_id character varying,
	ADD COLUMN work_settlement_id character varying,
	ADD COLUMN flow_direction character varying;

/*
What's the closest town or city with a Euclidean distance?
*/
DO
$$
DECLARE
rec record;
v_source_name character varying;
v_target_name character varying;
BEGIN

	FOR rec IN
		SELECT id, source_geom, target_geom
		FROM sheffield.census_flows
	LOOP
		SELECT id INTO v_source_name
		FROM sheffield.os_open_names
		WHERE sub_type IN ('City', 'Town')
		ORDER BY ST_Centroid(rec.source_geom) <-> geom
		LIMIT 1;

		SELECT id INTO v_target_name
		FROM sheffield.os_open_names
		WHERE sub_type IN ('City', 'Town')
		ORDER BY ST_Centroid(rec.target_geom) <-> geom
		LIMIT 1;

		RAISE NOTICE '% % %', rec.id, v_source_name, v_target_name;

		UPDATE sheffield.census_flows SET 
			home_settlement_id = v_source_name,
			work_settlement_id = v_target_name
		WHERE id = rec.id;
	END LOOP;
END
$$
LANGUAGE plpgsql;

/*
If the home and work settlement are different, you're commuting between settlements
*/
UPDATE sheffield.census_flows SET flow_direction = 'out_in' WHERE home_settlement_id != work_settlement_id;
/*
If the same, you're either travelling inwards, or outwards...
*/
DO
$$
DECLARE
rec record;
v_source_dist float;
v_target_dist float;
BEGIN

	FOR rec IN
		SELECT id, home_settlement_id, work_settlement_id,
			ST_Centroid(source_geom) AS source_center,
			ST_Centroid(target_geom) AS target_center
		FROM sheffield.census_flows
		WHERE home_settlement_id = work_settlement_id
	LOOP
		SELECT ST_Distance(rec.source_center, geom) INTO v_source_dist
		FROM sheffield.os_open_names
		WHERE id = rec.home_settlement_id;

		SELECT ST_Distance(rec.target_center, geom) INTO v_target_dist
		FROM sheffield.os_open_names
		WHERE id = rec.work_settlement_id;

		RAISE NOTICE '% % %', rec.id, v_source_dist, v_target_dist;

		UPDATE sheffield.census_flows SET 
			flow_direction = CASE WHEN v_source_dist > v_target_dist THEN 'in' ELSE 'out' END
		WHERE id = rec.id;

	END LOOP;
END
$$
LANGUAGE plpgsql;
/*
Do some mapping and r stats from here on...
*/
/*
---------------------------------------------------------------------------------------------------------------------
*/

/*
To check some potential sampling issues, repeat the above process with ALL records in the study region
Also, leave in the home worker records
*/
CREATE TABLE sheffield.census_flows_all AS 
SELECT * 
FROM import.wf01buk_oa_v2
WHERE source_found = true AND target_found = true;

CREATE INDEX census_flows_all_source_oa_idx
  ON sheffield.census_flows_all
  USING btree
  (source_oa COLLATE pg_catalog."default");

CREATE INDEX census_flows_all_target_oa_idx
  ON sheffield.census_flows_all
  USING btree
  (target_oa COLLATE pg_catalog."default");

ALTER TABLE sheffield.census_flows_all 
	ADD COLUMN sampled boolean DEFAULT false,
	ADD COLUMN source_geom geometry(MultiPolygon,27700),
	ADD COLUMN target_geom geometry(MultiPolygon,27700);

CREATE INDEX census_flows_all_source_gist 
  ON sheffield.census_flows_all 
  USING gist (source_geom);

CREATE INDEX census_flows_all_target_gist 
  ON sheffield.census_flows_all 
  USING gist (target_geom);

ALTER TABLE sheffield.census_flows_all 
	DROP COLUMN source_found,
	DROP COLUMN target_found,
	DROP COLUMN sampled;

/*
Assign source and target polygons
*/
WITH x AS (
	SELECT geo_code, geom FROM import.output_areas_2011 WHERE include = true
)
UPDATE sheffield.census_flows_all 
SET source_geom = x.geom
FROM x
WHERE sheffield.census_flows_all.source_oa = x.geo_code;


WITH x AS (
	SELECT geo_code, geom FROM import.output_areas_2011 WHERE include = true
)
UPDATE sheffield.census_flows_all 
SET target_geom = x.geom
FROM x
WHERE sheffield.census_flows_all.target_oa = x.geo_code;

/*
Add some IDM deciles
*/
ALTER TABLE sheffield.census_flows_all 
	ADD COLUMN code character varying(254),
	ADD COLUMN ovrk2015 bigint,
	ADD COLUMN decile integer NOT NULL DEFAULT 0,
	ADD COLUMN quintile integer NOT NULL DEFAULT 0,
	ADD COLUMN hlth2015 integer,
	ADD COLUMN hlthdecile integer,
	ADD COLUMN hlthquintile integer;

UPDATE sheffield.census_flows_all SET
	code = x.code, 
	ovrk2015 = x.ovrk2015, 
	decile = x.decile, 
	quintile = x.quintile, 
	hlth2015 = x.hlth2015, 
	hlthdecile = x.hlthdecile, 
	hlthquintile = x.hlthquintile
FROM (
	SELECT * FROM sheffield.lsoa_imd_sheffield
) x
WHERE ST_Within(sheffield.census_flows_all.source_geom, x.geom) OR ST_Overlaps(sheffield.census_flows_all.source_geom, x.geom);

/*
Again, probably ought to have a surragate identifier
*/
CREATE SEQUENCE sheffield.census_flows_all_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

ALTER TABLE sheffield.census_flows_all ADD COLUMN id INTEGER NOT NULL DEFAULT nextval('sheffield.census_flows_all_seq'::regclass);

/*
Check which is the closest major settlement to flow home and work locations and assign  
If the same home and work settlement check which is closest and assign in/out flow
If different assign outflow(?)
*/
ALTER TABLE sheffield.census_flows_all
	ADD COLUMN home_settlement_id character varying,
	ADD COLUMN work_settlement_id character varying,
	ADD COLUMN flow_direction character varying;

DO
$$
DECLARE
rec record;
v_source_name character varying;
v_target_name character varying;
BEGIN

	FOR rec IN
		SELECT id, source_geom, target_geom
		FROM sheffield.census_flows_all
	LOOP
		SELECT id INTO v_source_name
		FROM sheffield.os_open_names
		WHERE sub_type IN ('City', 'Town')
		ORDER BY ST_Centroid(rec.source_geom) <-> geom
		LIMIT 1;

		SELECT id INTO v_target_name
		FROM sheffield.os_open_names
		WHERE sub_type IN ('City', 'Town')
		ORDER BY ST_Centroid(rec.target_geom) <-> geom
		LIMIT 1;

		RAISE NOTICE '% % %', rec.id, v_source_name, v_target_name;

		UPDATE sheffield.census_flows_all SET 
			home_settlement_id = v_source_name,
			work_settlement_id = v_target_name
		WHERE id = rec.id;
	END LOOP;
END
$$
LANGUAGE plpgsql;

/*
Commuting between settlements and home workers...
*/
UPDATE sheffield.census_flows_all SET flow_direction = 'out_in' WHERE home_settlement_id != work_settlement_id;
UPDATE sheffield.census_flows_all SET flow_direction = 'home' WHERE source_oa = target_oa;
/*
In flows or out flows...?
*/
DO
$$
DECLARE
rec record;
v_source_dist float;
v_target_dist float;
BEGIN

	FOR rec IN
		SELECT id, home_settlement_id, work_settlement_id,
			ST_Centroid(source_geom) AS source_center,
			ST_Centroid(target_geom) AS target_center
		FROM sheffield.census_flows_all
		WHERE home_settlement_id = work_settlement_id
		AND source_oa != target_oa
	LOOP
		SELECT ST_Distance(rec.source_center, geom) INTO v_source_dist
		FROM sheffield.os_open_names
		WHERE id = rec.home_settlement_id;

		SELECT ST_Distance(rec.target_center, geom) INTO v_target_dist
		FROM sheffield.os_open_names
		WHERE id = rec.work_settlement_id;

		RAISE NOTICE '% % %', rec.id, v_source_dist, v_target_dist;

		UPDATE sheffield.census_flows_all SET 
			flow_direction = CASE WHEN v_source_dist > v_target_dist THEN 'in' ELSE 'out' END
		WHERE id = rec.id;

	END LOOP;
END
$$
LANGUAGE plpgsql;
 
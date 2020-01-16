/*
Import the output areas from the UK Data Service via the QGis Data Manager. 
These polygons will be used as source and target areas for home and work destinations. 
However, these are UK wide, not just the study area.
Add a new column “include” to indicate which output areas are within the study area.
 */
ALTER TABLE output_areas_2011 ADD COLUMN include boolean DEFAULT false;
/*
Populate this column by setting the “include” flag to true where the polygon is contained within the study area. 
Just buffer the ways table so as not to include OAs that are on the edge of the network.
*/
DO
$$
DECLARE
BEGIN
 
WITH x AS (
	SELECT geom FROM ttw_bounaries WHERE ttwa11cd = 'E30000261'
)
	UPDATE output_areas_2011 SET include = true 
	FROM (
	SELECT o.id 
	FROM output_areas_2011 o, x
	WHERE ST_Overlaps(x.geom, o.geom) = true
	OR ST_Contains(x.geom, o.geom) = true
) y 
WHERE y.id = output_areas_2011.id;

END
$$
language plpgsql;
/*
Should now have a sensible amount to work with

SELECT Count(1) FROM output_areas_2011 --232296
SELECT Count(1) FROM output_areas_2011 WHERE include = true --2840
*/

/*
Now import the census data downloaded from the UK data service, using the PostgreSQL COPY command
Create a table to hold the data based on the census naming convention 
The COPY command won't work with the table definition backed up by PgAdmin due to the extra columns, so drop and recreate if it exists already.
*/ 
CREATE TABLE wf01buk_oa_v2
(
  source_oa character varying,
  target_oa character varying,
  count integer,
  CONSTRAINT wf01buk_oa_v2_pkey PRIMARY KEY (source_oa, target_oa)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE wf01buk_oa_v2
  OWNER TO postgres;
/*
Insert the census data

…Be patient…
Query returned successfully: 16857265 rows affected, 12:48 minutes execution time.
*/
COPY wf01buk_oa_v2 from 'D:\Users\sbent\OneDrive\Data\PhD\Census 2011\wf01buk_oa_v2.csv' DELIMITERS ',' CSV;
/* 
Add another column to flag which flows in the census data are within the study area
*/
ALTER TABLE wf01buk_oa_v2 ADD COLUMN source_found BOOLEAN DEFAULT false, ADD COLUMN target_found BOOLEAN DEFAULT false;
 /*
Now populate these new columns with the census flows within the study area
The UK output areas should already have been filtered to those within the study travel to work area if following this script carefully
Exclude those flows which are home workers i.e. Both source and target OA are the same
*/
DO
$$
DECLARE 
BEGIN

	UPDATE wf01buk_oa_v2 SET source_found = true WHERE EXISTS (
		SELECT geo_code FROM output_areas_2011 WHERE include = true AND GEO_CODE = wf01buk_oa_v2.source_oa
	);

	UPDATE wf01buk_oa_v2 SET target_found = true WHERE EXISTS (
		SELECT geo_code FROM output_areas_2011 WHERE include = true AND GEO_CODE = wf01buk_oa_v2.target_oa
	);

	UPDATE wf01buk_oa_v2 
	SET source_found = false, target_found = false
	WHERE source_oa = target_oa;

END
$$
language plpgsql;
/*
We are now going to sample the records for the region (there are still too many OA to OA flows to calculate a path for)
by selecting the top 10% most popular OA to OA flows. 
Then we will randonmly sample home and work locations from buildings within each OA. 
This is differnet to the usual OA centroid approach. 
As the census data contains the count of actual flows within each pairing we will 
divide that by 10 so we have a sample of the top 10% most popular flows weighted by the actual count. 
Numbers will be rounded up so we have whole numbers of samples.

This doesn't work correctly:
SELECT source_oa, target_oa, count,
SUM(count) OVER(ORDER BY count DESC) AS agg_count
FROM wf01buk_oa_v2
WHERE source_found = true AND target_found = true
ORDER BY count DESC

This is due to a limitation in the way the PostgreSQL SUM function works 
(it sum’s all the records with the same count value together – 
which is a problem when trying to get a 10% of the data, and the cut off is somewhere in the middle of multiple records all with a count of 6) 
the data is piped into another table containing only those records to be sampled.
*/
DO
$$
DECLARE
 
total bigint;
agg_count integer := 0;
rec record;
 
BEGIN
 
	SELECT SUM(count) INTO total
	FROM wf01buk_oa_v2
	WHERE source_found = true AND target_found = true;
 
        FOR rec IN
                SELECT source_oa, target_oa, count --, SUM(count) OVER(ORDER BY count DESC) AS agg_count
                FROM wf01buk_oa_v2
		WHERE source_found = true AND target_found = true
                ORDER BY count DESC
        LOOP
                IF agg_count <= (total / 10) THEN
                        agg_count = agg_count + rec.count;
 
                        INSERT INTO census_flow_sample (source_oa, target_oa, count, agg_count)
                        VALUES (rec.source_oa, rec.target_oa, rec.count, agg_count);
                ELSE
                        EXIT;
                END IF;
        END LOOP;
END $$
language plpgsql;
/*
Add some IMD data with ranks for the 2010 and 2015 deciles.
This data was added from QGis, using a spatial join of the boundaries SHP file to the actual data, rather than long hand in this script as it was easier.
This will be used to determine some special cases from each decile rank to focus on later.
*/ 
WITH x AS (
        SELECT geom FROM ttw_boundaries WHERE ttwa11cd = 'E30000261'
)
INSERT INTO lsoa_imd_sheffield 
SELECT i.* 
FROM lsoa_imd i, x
WHERE ST_Overlaps(x.geom, i.geom) = true
OR ST_Contains(x.geom, i.geom) = true;
/* 
Now classify the IMD data into deciles and quintiles for grouping:
*/
ALTER TABLE lsoa_imd_sheffield ADD COLUMN decile integer NOT NULL DEFAULT 0, ADD COLUMN quintile integer NOT NULL DEFAULT 0;
/*
Ranges created in QGIS with Equal Interval categories:
*/
UPDATE lsoa_imd_sheffield SET decile = CASE 
 WHEN ovrk2015 <= 3329.3 THEN 1
 WHEN ovrk2015 > 3329.3 AND ovrk2015 <= 6605.6 THEN 2
 WHEN ovrk2015 > 6605.6 AND ovrk2015 <= 9881.9 THEN 3
 WHEN ovrk2015 > 9881.9 AND ovrk2015 <= 13158.2 THEN 4
 WHEN ovrk2015 > 13158.2 AND ovrk2015 <= 16434.5 THEN 5
 WHEN ovrk2015 > 16434.5 AND ovrk2015 <= 19710.8 THEN 6
 WHEN ovrk2015 > 19710.8 AND ovrk2015 <= 22987.1 THEN 7
 WHEN ovrk2015 > 22987.1 AND ovrk2015 <= 26263.4 THEN 8
 WHEN ovrk2015 > 26263.4 AND ovrk2015 <= 29539.7 THEN 9
 WHEN ovrk2015 > 29539.7 THEN 10
 ELSE 0
 END;
 
UPDATE lsoa_imd_sheffield SET quintile = CASE 
        WHEN ovrk2015 <= 6605.6 THEN 1
        WHEN ovrk2015 > 6605.6 AND ovrk2015 <= 13158.2 THEN 2
        WHEN ovrk2015 > 13158.2 AND ovrk2015 <= 19710.8 THEN 3
        WHEN ovrk2015 > 19710.8 AND ovrk2015 <= 26263.4 THEN 4
        WHEN ovrk2015 > 26263.4 THEN 5
        ELSE 0
        END;

/*
NOW. FINALLY. GENERATE TEST DATA.
 
Create a proportionate amount of samples for the OA to OA flow based on the count of flows in the Census data.
*/ 
DO
$$
DECLARE
rec record;
i integer := 1;
BEGIN
        CREATE TEMPORARY TABLE tmpsource (rownum bigint, id integer, pnt geometry(Point, 27700)) 
        ON COMMIT DROP;
        
        CREATE TEMPORARY TABLE tmptarget (rownum bigint, id integer, pnt geometry(Point, 27700)) 
        ON COMMIT DROP;
 
        FOR rec IN 
                SELECT *, 
                CASE WHEN round(count / 10) = 0 THEN 1 ELSE round(count / 10) END AS sample_count
                FROM census_flow_sample
        LOOP    
                --Clean variables at the start of the loop
                i := 1;
                TRUNCATE TABLE tmpsource;
                TRUNCATE TABLE tmptarget;
 
                RAISE NOTICE 'Processing % to %', rec.source_oa, rec.target_oa;
 
                --Yes, this is correct, the count is used as opposed to the sample count as the Bernoulli random sample function used below
                --gets the number of records based on a percentage. It's fast, but doesn't return the exact amount of records, so err on the plus side. 
                INSERT INTO tmpsource 
                SELECT rownum, id, pnt 
                FROM generateRandomBuildingSample(rec.count, (SELECT geom FROM output_areas_2011 WHERE geo_code = rec.source_oa), 0);
                
                INSERT INTO tmptarget 
                SELECT rownum, id, pnt 
                FROM generateRandomBuildingSample(rec.count, (SELECT geom FROM output_areas_2011 WHERE geo_code = rec.target_oa), 0);     
 
                WHILE i < rec.sample_count LOOP
                        INSERT INTO census_flow_sample (source_oa, target_oa, source, target)
                        VALUES (rec.source_oa, rec.target_oa, 
                                (SELECT pnt FROM tmpsource WHERE rownum = i), 
                                (SELECT pnt FROM tmptarget WHERE rownum = i)
                        );                      
                        
                        i := i+1;
                END LOOP;
 
        END LOOP;
END
$$ language plpgsql;
/* 
Have a basic look at the direction of travel
*/
--ALTER TABLE census_flow_sample ADD COLUMN flow geometry(LineString, 27700);
UPDATE census_flow_sample SET flow = ST_MakeLine(source, target);
 
 
 
 
 
 
ADD SOME DESCRIPTIONS TO THE DATA
First import the os_open_names data clipped to within 5k of the boundary.
 
        ALTER TABLE census_flow_sample ADD COLUMN source_description character varying, ADD COLUMN target_description character varying
 
SELECT setFlowSampleDescriptions()
 
CREATE OR REPLACE FUNCTION setFlowSampleDescriptions() RETURNS VOID AS
$$
DECLARE
rec record;
BEGIN
 
        RAISE NOTICE 'Setting source descriptions';
        FOR rec IN
                SELECT id, source FROM census_flow_sample WHERE source IS NOT NULL
        LOOP
                UPDATE census_flow_sample SET source_description = (
                        SELECT o.name
                        FROM os_open_names o 
                        ORDER BY o.geom <-> rec.source
                        LIMIT 1
                )
                WHERE id = rec.id;              
        END LOOP;
 
        RAISE NOTICE 'Setting target descriptions';
        FOR rec IN
                SELECT id, target FROM census_flow_sample WHERE target IS NOT NULL
        LOOP
                UPDATE census_flow_sample SET target_description = (
                        SELECT o.name
                        FROM os_open_names o 
                        ORDER BY o.geom <-> rec.target
                        LIMIT 1
                )
                WHERE id = rec.id;              
        END LOOP;
 
END
$$ LANGUAGE plpgsql;
 
TRUNCATE TABLE census_flow_sample; 
 
ALTER TABLE census_flow_sample ADD COLUMN source_description character varying, ADD COLUMN target_description character varying;
 
INSERT INTO census_flow_sample
SELECT * FROM census_flow_sample;
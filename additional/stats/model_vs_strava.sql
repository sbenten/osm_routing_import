/*
Having aquired some Strava data for part of the study area via the UBDC we can compare the model results those commuters using Strava
Not made it into an R script yet...
*/
DO
$$
DECLARE

max_bike_count double precision;
max_strava_count double precision;
max_accident_count double precision;
max_bike_accident_count double precision;

BEGIN

	UPDATE ways_clean SET total_count = x.total_count
	FROM (
		SELECT resedgeid, COUNT(1) AS total_count
		FROM vw_batch_run_results_base
		GROUP BY resedgeid
	) x
	WHERE ways_clean.id = x.resedgeid;

	UPDATE ways_clean SET bike_count = x.bike_count
	FROM (
		SELECT resedgeid, COUNT(1) AS bike_count
		FROM vw_batch_run_results_base
		WHERE mode_filter = 3
		GROUP BY resedgeid
	) x
	WHERE ways_clean.id = x.resedgeid;

	UPDATE ways_clean SET walk_count = x.walk_count
	FROM (
		SELECT resedgeid, COUNT(1) AS walk_count
		FROM vw_batch_run_results_base
		WHERE mode_filter = 3
		GROUP BY resedgeid
	) x
	WHERE ways_clean.id = x.resedgeid;

	UPDATE ways_clean
	SET strava_commute_count = COALESCE(x.avg_count, 0)
	FROM (
		SELECT osm_id, avg(COALESCE(total_tcmtcnt, 0)) AS avg_count 
		FROM strava
		GROUP BY osm_id
	) x	
	WHERE ways_clean.osm_id = (x.osm_id :: character varying);
	
	SELECT max(bike_count), max(strava_commute_count), max(total_accidents), max(cyclist_accidents)
	INTO max_bike_count, max_strava_count, max_accident_count, max_bike_accident_count
	FROM ways_clean;

	UPDATE ways_clean SET 
		strava_weighted = CASE
			WHEN strava_commute_count = 0 THEN 0
			ELSE CEIL((strava_commute_count :: double precision / max_strava_count) * 100)
		END,
		bike_weighted = CASE
			WHEN bike_count = 0 THEN 0
			ELSE CEIL((bike_count :: double precision / max_bike_count) * 100)
		END,
		total_accident_weighted = CASE
			WHEN total_accidents = 0 THEN 0
			ELSE CEIL((total_accidents :: double precision / max_accident_count) * 100)
		END,
		cycle_accident_weighted = CASE
			WHEN cyclist_accidents = 0 THEN 0
			ELSE CEIL((cyclist_accidents :: double precision / max_bike_accident_count) * 100)
		END;

END
$$
language plpgsql;

/*
Checking basic percentage of highway use by Strava commuters
*/
SELECT max(bike_count), max(strava_commute_count), max(total_accidents), max(cyclist_accidents) FROM ways_clean;

SELECT ((strava_commute_count / 13815) * 100) :: integer FROM ways_clean; --13815 = maximum commuter count in Strava data

/*
Where are the major differences?
*/
SELECT bike_count, bike_weighted, strava_weighted, strava_commute_count , 
	total_accidents, total_accident_weighted, cyclist_accidents, cycle_accident_weighted,
	osm_id, name, highway, attrs, length_m, bicycle_infrastructure
FROM ways_clean 
--WHERE strava_weighted > 50 AND bicycle_infrastructure='segregated'
WHERE bike_weighted < (strava_weighted - 19) 
OR bike_weighted > (strava_weighted + 19)
ORDER BY strava_weighted DESC;

/*
Continue analysis in maps...
*/
CREATE FUNCTION setwayheights() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

	--Calculate the extent of each DTM tile
	WITH d AS (
		SELECT rid, rast FROM terrain.dtm
	)
	INSERT INTO terrain.dtm_extent (rid, geom)
	SELECT d.rid, (SELECT ST_SetSRID(ST_Extent(d.rast::geometry), 27700))
	FROM d
	GROUP BY d.rid;  

	--Recalculate indexes
	VACUUM ANALYZE;

	--Explode the linestrings into separate points and determine which raster they fall into
	 WITH w AS (
		SELECT id, geom, generate_series(1, (SELECT ST_NumPoints(geom))) AS num 
		FROM ways_clean
	),
	r AS (
		SELECT rid, geom FROM terrain.dtm_extent
	)
	INSERT INTO way_points (geom, ways_clean_id, seq, dtm_id)
	SELECT ST_PointN(w.geom, w.num), 
		w.id, w.num, 
		(SELECT r.rid FROM r WHERE ST_Contains(r.geom, ST_PointN(w.geom, w.num)))
	FROM w;

	--Lookup the altitude of each point within the raster image
	WITH r AS (
		SELECT rid, rast FROM terrain.dtm
	),
	p AS (
		SELECT id, geom, dtm_id FROM way_points
	)
	UPDATE way_points SET altitude = ST_Value(r.rast, p.geom) 
	FROM r, p
	WHERE way_points.id = p.id
	AND p.dtm_id = r.rid;  

	UPDATE way_points SET difference = y.difference
	FROM (
		SELECT x.id, x.ways_clean_id, x.seq, x.altitude, x.prevAltitude,
			(x.altitude - x.prevAltitude) AS difference
		FROM (
			SELECT p.id, p.ways_clean_id, p.seq, p.altitude,
			CASE WHEN v.altitude IS NULL THEN p.altitude
				ELSE v.altitude
			END AS prevAltitude
			FROM way_points p
			LEFT JOIN (
				SELECT id, ways_clean_id, seq, altitude
				FROM way_points 
			) v ON v.ways_clean_id = p.ways_clean_id AND v.seq = (p.seq -1)
		) x
	) y
	WHERE way_points.id = y.id;

	WITH a AS (
		SELECT ways_clean_id, SUM(difference) AS gained
		FROM way_points 
		WHERE difference > 0
		GROUP BY ways_clean_id
	)
	UPDATE ways_clean SET 
		totalascent = x.gained
	FROM (
		SELECT a.ways_clean_id, a.gained
		FROM a
	) x
	WHERE ways_clean.id = x.ways_clean_id;

	WITH a AS (
		SELECT ways_clean_id, SUM(difference) AS lost
		FROM way_points 
		WHERE difference < 0
		GROUP BY ways_clean_id
	)
	UPDATE ways_clean SET 
		totaldescent = x.lost
	FROM (
		SELECT a.ways_clean_id, a.lost
		FROM a
	) x
	WHERE ways_clean.id = x.ways_clean_id;

	WITH s AS (
		SELECT v.ways_clean_id, v.min, p.altitude 
		FROM vw_way_points_start_end v
		JOIN way_points p ON p.ways_clean_id = v.ways_clean_id AND p.seq = v.min
	),
	e AS (
		SELECT v.ways_clean_id, v.max, p.altitude
		FROM vw_way_points_start_end v
		JOIN way_points p ON p.ways_clean_id = v.ways_clean_id AND p.seq = v.max
	)
	UPDATE ways_clean SET 
		startaltitude = x.startaltitude,
		endaltitude = x.endaltitude,
		percentslope = x.percentslope,
		angleslope = x.angleslope,
		reversepercentslope = x.reversepercentslope,
		reverseangleslope = x.reverseangleslope,
		length_m = x.length
	FROM (
		SELECT c.id,
			s.altitude AS startaltitude, 
			e.altitude AS endaltitude,
			getPercentSlope((e.altitude - s.altitude), ST_Length(c.geom)) AS percentslope,
			getAngleOfSlope((e.altitude - s.altitude), ST_Length(c.geom)) AS angleslope,
			getPercentSlope((s.altitude - e.altitude), ST_Length(c.geom)) AS reversepercentslope,
			getAngleOfSlope((e.altitude - s.altitude), ST_Length(c.geom))  AS reverseangleslope,
			ST_Length(c.geom) AS length
		FROM ways_clean c
		JOIN s ON s.ways_clean_id = c.id 
		JOIN e ON e.ways_clean_id = c.id
	) x
	WHERE ways_clean.id = x.id;
END
$$;


ALTER FUNCTION setwayheights() OWNER TO postgres;
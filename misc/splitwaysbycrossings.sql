CREATE FUNCTION splitwaysbycrossings() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	--Keep track of the splits to the ways network
	CREATE TEMPORARY TABLE tmp (id integer, ln geometry(LineString, 27700));
		
	RAISE NOTICE '1. Processing crossings';

	--Split the ways network by the crossings
	WITH x AS (
		SELECT id, geom FROM way_crossings
	),
	w AS (
		SELECT id, geom FROM ways_clean 
	),
	p AS (
		SELECT ST_SetSRID(ST_Union(o.way_point), 27700) AS crossings, o.way_id, o.way_geom
		FROM (			
			SELECT x.id, x.geom AS way_point, w.id AS way_id, w.geom AS way_geom 
			FROM x, w
			WHERE ST_Intersects(x.geom, w.geom) = true
			AND (ST_Intersects(x.geom, ST_StartPoint(w.geom)) = false AND ST_Intersects(x.geom, ST_EndPoint(w.geom)) = false)
			ORDER BY w.id, ST_StartPoint(w.geom) <-> x.geom
		) o
		GROUP BY o.way_id, o.way_geom
	)
	INSERT INTO tmp (id, ln)
	SELECT p.way_id, 
		/*
			Should be able to use "ST_Split(p.way_geom, p.bus_stops)",
			having first snapped the point to the line.
			However, this results in an error "Splitter line has linear intersection with input"
			Haven't managed to track down the source of this error, 
			so falling back to some utilities written by Remi-C for an earlier version of PostGIS,
			which didn't support multi-point splitting of lines. 
			Slower, but more stable.
			Source: https://github.com/Remi-C/PPPP_utilities/blob/master/postgis/rc_Split_Line_By_Points.sql
		*/
		ST_SetSRID((rc_split_line_by_points(p.way_geom, p.crossings, 0.000001)).geom, 27700)
	FROM p;	

	RAISE NOTICE '2. Splitting the existing network';
	INSERT INTO ways_clean (geom, ways_id, osm_id, name, highway, z_order, attrs,
		car_allow, bus_allow, cycle_allow, walk_allow, has_bridge, has_tunnel, tram_allow)	
	SELECT t.ln, w.ways_id, w.osm_id, w.name, w.highway, w.z_order, w.attrs,
		car_allow, bus_allow, cycle_allow, walk_allow, has_bridge, has_tunnel, tram_allow
	FROM tmp t
	JOIN ways_clean w ON w.id = t.id;
	
	DELETE FROM ways_clean WHERE id IN (SELECT id FROM tmp);
		
END 
$$;


ALTER FUNCTION splitwaysbycrossings() OWNER TO postgres;
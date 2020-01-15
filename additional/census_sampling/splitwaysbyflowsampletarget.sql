CREATE FUNCTION splitwaysbyflowsampletarget() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
	rec record;
BEGIN
	--Keep track of the splits to the ways network
	CREATE TEMPORARY TABLE tmp (id integer, ln geometry(LineString, 27700));
		
	RAISE NOTICE '1. Processing sample points';

	WITH x AS (
		SELECT ST_SetSRID(ST_Union(o.point), 27700) AS targets, o.way_id, o.way_geom
		FROM (			
			SELECT s.*, 
				ST_LineInterpolatePoint((SELECT geom FROM ways_clean WHERE id = s.way_id), s.way_pos) AS point,
				w.geom AS way_geom
			FROM (
				SELECT i.*, 
					ST_LineLocatePoint((SELECT geom FROM ways_clean WHERE id = i.way_id), i.target) AS way_pos
				FROM (
					SELECT id, 
					target,
					nearestdriveablewaytopoint(target) :: int4 as way_id
					FROM census_flow_sample
					WHERE target IS NOT NULL
				) i
			) s
			JOIN ways_clean w ON w.id = s.way_id	
		) o
		GROUP BY o.way_id, o.way_geom
	)	
	INSERT INTO tmp (id, ln)
	SELECT x.way_id, 
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
		ST_SetSRID((rc_split_line_by_points(x.way_geom, x.targets, 0.000001)).geom, 27700)
	FROM x;	


	RAISE NOTICE '2. Splitting the existing network';
	INSERT INTO ways_clean (id, geom, ways_id, osm_id, name, highway, z_order, attrs,
		car_allow, bus_allow, cycle_allow, walk_allow, has_bridge, has_tunnel, tram_allow)	
	SELECT nextval('ways_clean_id_seq'), t.ln, w.ways_id, w.osm_id, w.name, w.highway, w.z_order, w.attrs,
		car_allow, bus_allow, cycle_allow, walk_allow, has_bridge, has_tunnel, tram_allow
	FROM tmp t
	JOIN ways_clean w ON w.id = t.id;

	DELETE FROM way_restrictions WHERE from_id IN  (SELECT id FROM tmp);
	DELETE FROM way_restrictions WHERE to_id IN  (SELECT id FROM tmp);
	DELETE FROM way_points WHERE ways_clean_id IN  (SELECT id FROM tmp);
	DELETE FROM ways_clean WHERE id IN (SELECT id FROM tmp);

	DROP TABLE tmp;	
END 
$$;


ALTER FUNCTION splitwaysbyflowsampletarget() OWNER TO postgres;
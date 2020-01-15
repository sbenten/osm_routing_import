CREATE FUNCTION setpublictransportroutes() RETURNS void
    LANGUAGE plpgsql
    AS $$
/*
Reads NaPTAN and Traveline imported data and creates stops, services, routes and ways for a public transport network.

PARAMS
n/a

RETURNS void
*/	
DECLARE 
rec record;
from_route_id integer;
from_type varchar;
from_id integer;
to_id integer;
BEGIN

	--Import the naptan data to the public_transport_stops table
	INSERT INTO public_transport_stops (import_geom, osm_id, atcocode, name, landmark, type, naptan, geom)
	SELECT import_geom, NULL, atcocode, commonname, landmark, type, naptancode, geom
	FROM naptan
	WHERE ST_Within(geom, (SELECT ST_Expand(ST_SetSRID(ST_Extent(c.geom), 27700), 100) FROM ways_clean c));

	--Add the services
	INSERT INTO public_transport_services (import_file_id, service_code, line_name, start_date, mode, description, 
		national_operator_code, operator_code, operator_name)
	SELECT DISTINCT s.file_id, s.service_code, s.line_name, s.start_date, s.mode, s.description, 
		COALESCE(o.national_code, o2.national_code), COALESCE(o.code, o2.code), COALESCE(o.short_name, o2.short_name)
	FROM traveline_services s
	LEFT JOIN traveline_operators o ON o.code = s.operator_code AND o.file_id = s.file_id
	LEFT JOIN traveline_operators o2 ON o2.file_id = s.file_id
	WHERE EXISTS (SELECT v.file_id FROM vw_stop_points_in_sheffield v WHERE v.file_id = s.file_id);

	--Next, the routes 
	--NOTE Untested, as the public_transport_service_id was added afterwards
	INSERT INTO public_transport_routes (public_transport_service_id, import_file_id, route_section_ref, description)
	SELECT s.id, r.file_id, r.route_id, r.description
	FROM traveline_routes r
	JOIN public_transport_services s on s.import_file_id = r.file_id
	WHERE EXISTS (SELECT v.file_id FROM vw_stop_points_in_sheffield v WHERE v.file_id = r.file_id);

	--Next, the route stops
	INSERT INTO public_transport_route_stops (public_transport_route_id, public_transport_stop_id, import_file_id, route_link_id, atco_code, direction)
	SELECT r.id, s.id, 
		x.file_id, x.route_link_id, x.stop_point, x.direction
	FROM (
	SELECT 'F' AS row_type, rs.file_id, rs.id, rs.route_id, rs.route_link_id, rs.from_stop_point_ref AS stop_point, rs.direction
	FROM traveline_route_sections rs
	JOIN (
		SELECT min(id) AS id, route_id
		FROM traveline_route_sections
		GROUP BY route_id
	) f ON f.id = rs.id
	UNION 
	SELECT 'A' AS row_type, rs.file_id, rs.id, rs.route_id, rs.route_link_id, rs.to_stop_point_ref AS stop_point, rs.direction
	FROM traveline_route_sections rs
	) x 
	JOIN public_transport_routes r ON r.route_section_ref = x.route_id
	JOIN public_transport_stops s ON s.atcocode = x.stop_point
	WHERE EXISTS (SELECT v.file_id FROM vw_stop_points_in_sheffield v WHERE v.file_id = x.file_id)
	ORDER BY x.id, x.row_type DESC;

	FOR rec IN
		--Select only those route sections with stop points in the study area
		--Looks a bit weird, but the layout of the public_transport_route_stops table is a record for each individual stop
		--When looking for the correct record with a source and destination this is required to capture all records
		SELECT id, file_id, route_id, route_link_id, from_stop_point_ref, to_stop_point_ref, direction, COALESCE(LAG(route_link_id) OVER(PARTITION BY route_id ORDER BY id), route_link_id) AS prev_route_link_id 
		FROM traveline_route_sections s
		WHERE EXISTS (SELECT 1 FROM public_transport_route_stops ps WHERE ps.route_link_id = s.route_link_id) 
	LOOP
		--Now find the public_transport_route_stop.id for each from and to stop_point
		SELECT rs.id, rs.public_transport_route_id, s.type INTO from_id, from_route_id, from_type
		FROM public_transport_route_stops rs
		JOIN public_transport_stops s ON rs.public_transport_stop_id = s.id
		WHERE rs.import_file_id = rec.file_id
		AND rs.atco_code = rec.from_stop_point_ref
		AND (rs.route_link_id = rec.route_link_id OR rs.route_link_id = rec.prev_route_link_id);

		SELECT rs.id INTO to_id
		FROM public_transport_route_stops rs
		JOIN public_transport_stops s ON rs.public_transport_stop_id = s.id
		WHERE rs.import_file_id = rec.file_id
		AND rs.atco_code = rec.to_stop_point_ref
		AND (rs.route_link_id = rec.route_link_id OR rs.route_link_id = rec.prev_route_link_id);
			
		--First check that both points are present
		IF from_id IS NOT NULL AND to_id IS NOT NULL THEN
			INSERT INTO public_transport_route_ways (public_transport_route_id, import_file_id, route_link_id, source_atco_code, target_atco_code, direction, transport_mode, source, target)
			VALUES (from_route_id, rec.file_id, rec.route_link_id, rec.from_stop_point_ref, rec.to_stop_point_ref, rec.direction, from_type, from_id, to_id);			
		END IF;

	END LOOP;

END; 
$$;


ALTER FUNCTION setpublictransportroutes() OWNER TO postgres;
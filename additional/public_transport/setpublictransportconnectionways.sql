CREATE FUNCTION setpublictransportconnectionways() RETURNS void
    LANGUAGE plpgsql
    AS $$
/*
Creates records in an interim table for connections between public transport services.
Limited to the morning and evening rush hours for the initial study.
First create a list of potential connections where someone can walk in under 10 minutes that is within 400m of another stop
Then create a single linestring for each walking route to connect the two stops

PARAMS
n/a

RETURNS void
*/
DECLARE

rec record;

BEGIN

	RAISE NOTICE 'Creating connections between stops...May take a while...';
	WITH x AS (
		SELECT w.public_transport_route_id,
			w.source AS public_transport_route_stop_id,
			w.import_file_id,
			w.route_link_id,
			t.stop_time,
			w.source_atco_code AS atco_code,
			s.geom, 
			w.direction
		FROM public_transport_route_times t
		JOIN public_transport_route_ways w ON w.id = t.public_transport_route_way_id
		JOIN public_transport_route_stops rs ON rs.id = t.source_public_transport_route_stop_id
		JOIN public_transport_stops s ON s.id = rs.public_transport_stop_id
	)
	INSERT INTO public_transport_route_connections (public_transport_route_id, transport_mode, import_file_id, route_link_id, source_atco_code, target_atco_code, direction)
	SELECT DISTINCT b.public_transport_route_id, 'walk', b.import_file_id, b.route_link_id, a.atco_code, b.atco_code, b.direction
	FROM x a
	CROSS JOIN x b
	WHERE a.public_transport_route_id != b.public_transport_route_id
	AND (a.stop_time + 10::double precision * '00:01:00'::interval) < b.stop_time 
	AND (b.stop_time - a.stop_time) < (20::double precision * '00:01:00'::interval)
	AND ((b.stop_time > '07:00:00'::time without time zone AND b.stop_time < '10:00:00'::time without time zone)
	OR (b.stop_time > '15:00:00'::time without time zone AND b.stop_time < '18:00:00'::time without time zone))
	AND st_dwithin(a.geom, b.geom, 400::double precision);

	RAISE NOTICE 'Generating geometries...';


	FOR rec IN
		SELECT  c.id, c.route_link_id, c.source_atco_code, c.target_atco_code, s.geom AS source_geom, t.geom AS target_geom
		FROM public_transport_route_connections c
		JOIN public_transport_stops s ON c.source_atco_code = s.atcocode
		JOIN public_transport_stops t ON c.target_atco_code = t.atcocode
		WHERE c.geom IS NULL
	LOOP
		RAISE NOTICE '% %', rec.id, rec.route_link_id;	
		PERFORM setpublictransportconnectionway(rec.id, rec.source_geom, rec.target_geom); 
	END LOOP;

END
$$;


ALTER FUNCTION setpublictransportconnectionways() OWNER TO postgres;
CREATE FUNCTION setpublictransportways() RETURNS void
    LANGUAGE plpgsql
    AS $$
/*
Create geometries between all public transport stops for each service and
route defined in the public transport tables.
Bus, tram and train routes called in turn.

PARAMS
n/a

RETURNS void
*/
DECLARE
rec record;
BEGIN
	FOR rec IN
		SELECT w.id, w.route_link_id, w.source_atco_code, w.target_atco_code, ss.geom AS source_geom, st.geom AS target_geom
		FROM public_transport_route_ways w
		JOIN public_transport_route_stops rss ON w.source = rss.id
		JOIN public_transport_stops ss ON rss.public_transport_stop_id = ss.id
		JOIN public_transport_route_stops rst ON w.target = rst.id
		JOIN public_transport_stops st ON rst.public_transport_stop_id = st.id
		WHERE w.transport_mode = 'bus'
	LOOP
		RAISE NOTICE '% %', rec.id, rec.route_link_id;	
		PERFORM setpublictransportbusway(rec.id, rec.source_geom, rec.target_geom); 
	END LOOP;

	FOR rec IN
		SELECT w.id, w.route_link_id, w.source_atco_code, w.target_atco_code, ss.geom AS source_geom, st.geom AS target_geom
		FROM public_transport_route_ways w
		JOIN public_transport_route_stops rss ON w.source = rss.id
		JOIN public_transport_stops ss ON rss.public_transport_stop_id = ss.id
		JOIN public_transport_route_stops rst ON w.target = rst.id
		JOIN public_transport_stops st ON rst.public_transport_stop_id = st.id
		WHERE w.transport_mode = 'tram'
	LOOP
		RAISE NOTICE '% %', rec.id, rec.route_link_id;	
		PERFORM setpublictransporttramway(rec.id, rec.source_geom, rec.target_geom); 
	END LOOP;

	FOR rec IN
		SELECT w.id, w.route_link_id, w.source_atco_code, w.target_atco_code, ss.geom AS source_geom, st.geom AS target_geom
			, w.source, ss.id AS source_stop_id, ss.atcocode AS source_atcocode, w.target, st.id AS target_stop_id, st.atcocode as target_atcocode
		FROM public_transport_route_ways w
		JOIN public_transport_route_stops rss ON w.source = rss.id
		JOIN public_transport_stops ss ON rss.public_transport_stop_id = ss.id
		JOIN public_transport_route_stops rst ON w.target = rst.id
		JOIN public_transport_stops st ON rst.public_transport_stop_id = st.id
		WHERE w.transport_mode = 'train' 
	LOOP
		RAISE NOTICE '% %', rec.id, rec.route_link_id;	
		PERFORM setpublictransporttrainway(rec.id, rec.source_geom, rec.target_geom); 
	END LOOP;
	
END
$$;


ALTER FUNCTION setpublictransportways() OWNER TO postgres;
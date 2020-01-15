CREATE FUNCTION setpublictransportroutetimevertices() RETURNS void
    LANGUAGE plpgsql
    AS $$
/*
Takes a time sensitive network and adds vetices required for routing.
Each public transport vehicle journey should be separated from other vehicles, unless a walking connection exists. 

PARAMS
n/a

RETURNS void
*/	
DECLARE
rec record;
sourceVertexId integer;
targetVertexId integer;
prevTargetVertexId integer;
BEGIN
	FOR rec IN 
		SELECT 
			min(t.id) OVER (PARTITION BY t.vehicle_journey_code) AS firstedge,
			max(t.id) OVER (PARTITION BY t.vehicle_journey_code) AS lastedge,
			s.geom AS source_geom,
			e.geom AS target_geom,
			t.id
		FROM public_transport_route_times t
		JOIN public_transport_stops s ON s.id = t.source_public_transport_stop_id
		JOIN public_transport_stops e ON e.id = t.target_public_transport_stop_id
		ORDER BY t.vehicle_journey_code, t.id
	LOOP 
		RAISE NOTICE 'Processing vertices for %', rec.id;
		
		IF rec.firstedge = rec.id THEN		
			--First time around we need to insert both vertices
			INSERT INTO public_transport_route_times_vertices_pgr (the_geom)
			VALUES (rec.source_geom) RETURNING id INTO sourceVertexId;
			
			INSERT INTO public_transport_route_times_vertices_pgr (the_geom)
			VALUES (rec.target_geom) RETURNING id INTO targetVertexId;
			
			UPDATE public_transport_route_times 
			SET source = sourceVertexId, target = targetVertexId
			WHERE id = rec.id;			
		ELSE
			--Every other time, the pervious target vertex is now our source
			INSERT INTO public_transport_route_times_vertices_pgr (the_geom)
			VALUES (rec.target_geom) RETURNING id INTO targetVertexId;
		
			UPDATE public_transport_route_times 
			SET source = prevTargetVertexId, target = targetVertexId
			WHERE id = rec.id;			
		END IF;		
		prevTargetVertexId := targetVertexId;
	END LOOP;

END 
$$;


ALTER FUNCTION setpublictransportroutetimevertices() OWNER TO postgres;
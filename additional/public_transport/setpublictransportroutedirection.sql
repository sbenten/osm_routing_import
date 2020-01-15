CREATE FUNCTION setpublictransportroutedirection() RETURNS void
    LANGUAGE plpgsql
    AS $$
/*
Inbound and Outbound flagged routes do not help with the ACTUAL direction the route travels.
This function sets the general direction of the route by measuring the angle between the first and last stop.
Doesn't help with routes that are 'circular', 'clockwise' or 'anticlockwise'.
Consider expanding with to include the direction from stop to stop.

PARAMS 
n/a

RETURNS void
*/
BEGIN 
	WITH s AS (
		SELECT i.public_transport_route_id, i.min_id, s.geom, s.id
		FROM
		( 
			SELECT rs.public_transport_route_id, MIN(rs.id) AS min_id
			FROM public_transport_route_stops rs
			JOIN public_transport_stops s ON s.id = rs.public_transport_stop_id
			WHERE s.geom IS NOT NULL 
			GROUP BY rs.public_transport_route_id
		) i
		JOIN public_transport_route_stops rs ON rs.id = i.min_id
		JOIN public_transport_stops s ON s.id = rs.public_transport_stop_id
	),
	t AS (
		SELECT i.public_transport_route_id, i.max_id, s.geom, s.id
		FROM
		( 
			SELECT rs.public_transport_route_id, MAX(rs.id) AS max_id
			FROM public_transport_route_stops rs
			JOIN public_transport_stops s ON s.id = rs.public_transport_stop_id
			WHERE s.geom IS NOT NULL 
			GROUP BY rs.public_transport_route_id
		) i
		JOIN public_transport_route_stops rs ON rs.id = i.max_id
		JOIN public_transport_stops s ON s.id = rs.public_transport_stop_id
	)
	UPDATE public_transport_routes SET direction = x.direction
	FROM 
	(
		SELECT degrees(ST_Azimuth(s.geom, t.geom)) AS direction, s.public_transport_route_id
		FROM s, t
		WHERE s.public_transport_route_id = t.public_transport_route_id
	) x
	WHERE public_transport_routes.id = x.public_transport_route_id;
END;
$$;


ALTER FUNCTION setpublictransportroutedirection() OWNER TO postgres;
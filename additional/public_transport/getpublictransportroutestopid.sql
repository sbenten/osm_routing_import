CREATE FUNCTION getpublictransportroutestopid(findatcocode character varying, findroutelinkid character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
/*
Find the closest public transport stop id for a given atcocode and route link. 

PARAMS
findatcocode	public_transport_stops.atcocode	The unique code imported for the stop.
findroutelinkid	character varying						The public transport vehicle path travelling from/to the given stop.

RETURNS public_transport_route_atops.id	Unique database id of the public transport vehicle at a particular stop.
*/
BEGIN
	RAISE NOTICE '% : %', findatcocode, substr(findRouteLinkId, 1, length(findRouteLinkId) - 4);
	
	RETURN 
		(SELECT rs.id 
		FROM public_transport_route_stops rs 
		JOIN public_transport_stops s on rs.public_transport_stop_id = s.id
		WHERE s.atcocode = findAtcoCode
		AND substr(rs.route_link_id, 1, length(rs.route_link_id) - 4) = substr(findRouteLinkId, 1, length(findRouteLinkId) - 4));
END
$$;


ALTER FUNCTION getpublictransportroutestopid(findatcocode character varying, findroutelinkid character varying) OWNER TO postgres;
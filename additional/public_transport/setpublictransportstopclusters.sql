CREATE FUNCTION setpublictransportstopclusters(clusterradius double precision DEFAULT 100.0) RETURNS void
    LANGUAGE plpgsql
    AS $$
/*
Group public transport stops together by proximity to each other.
This helps with routing through a number of public transport options and times, 
as it may be that a route with a stop not nearby, but not closest to, the destination 
is simply a short walk away.

PARAMS
clusterRadius	double precision	Radius of the cluster in meters. Default of 100m.

RETURNS void
*/
BEGIN

	WITH x AS (
		SELECT * FROM 
		(
			SELECT row_number() over () AS id,
				  ST_NumGeometries(f.c) AS count,
				  f.c AS geom_collection,
				  ST_SetSRID(ST_Centroid(f.c), 27700) AS centroid,
				  ST_SetSRID(ST_MinimumBoundingCircle(f.c), 27700) AS circle,
				  sqrt(ST_Area(ST_MinimumBoundingCircle(f.c)) / pi()) AS radius
			FROM (
				SELECT unnest(ST_ClusterWithin(s.import_geom, clusterRadius)) AS c
				FROM public_transport_stops s
				WHERE s.geom IS NOT NULL
			) f
		) x
		WHERE x.count > 1
		AND radius > 0
	)
	UPDATE public_transport_stops 
	SET cluster_id = s.cluster_id
	FROM
	(
		SELECT s.id, x.id AS cluster_id
		FROM public_transport_stops s, x
		WHERE ST_Intersects(s.import_geom, x.circle)
	) s
	WHERE public_transport_stops.id = s.id;
END
$$;


ALTER FUNCTION setpublictransportstopclusters(clusterradius double precision) OWNER TO postgres;
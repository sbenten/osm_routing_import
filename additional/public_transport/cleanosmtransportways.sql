CREATE FUNCTION cleanosmtransportways() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
rec record;
BEGIN

	RAISE NOTICE 'Train topogeometry';
	PERFORM topology.CreateTopology('trains', 27700); 
	CREATE TABLE trains.ways (LIKE osm_ways INCLUDING ALL);

	PERFORM topology.AddTopoGeometryColumn('trains','trains','ways','topo','LINE'); 

	INSERT INTO trains.ways(id, osm_id, geom, node_osm_ids, way, is_public_way, topo)
	SELECT id,  osm_id, geom,  node_osm_ids, way, is_public_way, 
		topology.toTopoGeom(geom, 'trains', 1, 0.05)
	FROM osm_ways_sheffield 
	WHERE is_train = true;

	INSERT INTO ways_clean(geom, osm_id, highway, z_order)
	SELECT e.geom, s.osm_id, 'trainline', 0
	FROM trains.edge_data e
	LEFT JOIN trains.relation r ON e.edge_id = r.element_id
	LEFT JOIN trains.ways s ON r.topogeo_id = (s.topo).id;
	  
	RAISE NOTICE 'Tram topogeometry';  
	PERFORM topology.CreateTopology('trams', 27700); 
	CREATE TABLE trams.ways (LIKE osm_ways_sheffield INCLUDING ALL);

	PERFORM topology.AddTopoGeometryColumn('trams','trams','ways','topo','LINE'); 

	INSERT INTO trams.ways(id, osm_id, geom, node_osm_ids, way, is_public_way, topo)
	SELECT id,  osm_id, geom,  node_osm_ids, way, is_public_way, 
		topology.toTopoGeom(geom, 'trams', 1, 0.05)
	FROM osm_ways_sheffield 
	WHERE is_tram = true; 

	INSERT INTO ways_clean(geom, osm_id, highway, z_order, tram_allow)
	SELECT e.geom, s.osm_id, 'tram', 0, true
	FROM trams.edge_data e
	LEFT JOIN trams.relation r ON e.edge_id = r.element_id
	LEFT JOIN trams.ways s ON r.topogeo_id = (s.topo).id;
END 
$$;


ALTER FUNCTION cleanosmtransportways() OWNER TO postgres;
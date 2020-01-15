CREATE FUNCTION loadosmnodesfromfile(filename character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
/*
Import all the nodes from an OSM file
Utility function to read an OSM Overpass API XML files FROM DISK.
The files need to be stored in the Postrgres servers data folder (or sub folder).
This uses the function pg_read_binary_file so please read: 
https://www.postgresql.org/docs/9.1/functions-admin.html#FUNCTIONS-ADMIN-GENFILE

This function relies on a set of tables to store the XML:
osm_nodes, osm_ways, osm_relations

PARAMS
filename	character varying	Full file path 

RETURNS void
*/
BEGIN

	WITH x(node) AS (
	    SELECT unnest(xpath('//node', XMLPARSE(DOCUMENT convert_from(pg_read_binary_file(fileName), 'UTF8'))))
	) 
	INSERT INTO osm_nodes(osm_id, lon, lat, node)
	SELECT
		CAST(CAST(unnest(xpath('//node/@id', x.node)) AS varchar) AS bigint),
		CAST(CAST(unnest(xpath('//node/@lon', node)) AS varchar) AS float),
		CAST(CAST(unnest(xpath('//node/@lat', node)) AS varchar) AS float),
		unnest(xpath('//node', x.node))
	FROM x;
END
$$;


ALTER FUNCTION loadosmnodesfromfile(filename character varying) OWNER TO postgres;
CREATE FUNCTION loadosmwaysfromfile(filename character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
rec record;
/*
Import all the ways from an OSM file
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

WITH x(way) AS (
    SELECT unnest(xpath('//way', XMLPARSE(DOCUMENT convert_from(pg_read_binary_file(fileName), 'UTF8'))))
)
/*
Read all the ways in the OSM file into the database import schema
e.g.
  <way id="9348299" version="17" timestamp="2017-08-08T16:49:37Z" changeset="50949181" uid="1802093" user="Paul Berry">
    <nd ref="686571562"/>
    ...
    <nd ref="70709817"/>
    <tag k="electrified" v="contact_line"/>
    <tag k="frequency" v="0"/>
    <tag k="gauge" v="1435"/>
    <tag k="railway" v="tram"/>
    <tag k="tracks" v="2"/>
    <tag k="voltage" v="750"/>
  </way>
*/
INSERT INTO osm_ways(osm_id, way)
SELECT
	unnest(xpath('//way/@id', x.way)),	
	unnest(xpath('//way', x.way))
FROM x;

--A bit of post insert data wrangling, get the node Ids, and their geometry as a LineString
UPDATE osm_ways SET node_osm_ids = xpath('//nd/@ref', way) :: varchar[];
/*
Can't find a reliable alternative which guarantees the order of nodes when unnested from the array
So resorting to a simple loop
*/
FOR rec IN 
	SELECT id, node_osm_ids
	FROM osm_ways
LOOP

	UPDATE osm_ways SET geom = i.geom
	FROM
	(
		SELECT rec.id, ST_MakeLine(n.geom) AS geom
		FROM osm_nodes n
		JOIN (
			SELECT rec.id, unnest(rec.node_osm_ids) AS node_id
		) x ON n.osm_id = x.node_id
		GROUP BY x.id
	) i
	WHERE i.id = osm_ways.id;
END LOOP;

END
$$;


ALTER FUNCTION loadosmwaysfromfile(filename character varying) OWNER TO postgres;
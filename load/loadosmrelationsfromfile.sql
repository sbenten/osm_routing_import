CREATE FUNCTION loadosmrelationsfromfile(filename character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
rec record;
rec2 record;
/*
Import all the relations from an OSM file
Also identifies all the public transport relations and stores them in the osm_ways table.
NOTE: Geometries hardcoded to OSGB at the moment

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


WITH x(relation) AS (
    SELECT unnest(xpath('//relation', XMLPARSE(DOCUMENT convert_from(pg_read_binary_file('overpass_12__53.3814_-1.4656.osm'), 'UTF8'))))
)
/*
Read all the ways in the OSM file into the database import schema
e.g.
  <relation id="165857" version="47" timestamp="2016-09-14T08:57:00Z" changeset="42144131" uid="185440" user="Claus Hindsgaul">
    <member type="way" ref="205938743" role="forward"/>
    ...
    <member type="node" ref="71224122" role="backward"/>
    <tag k="colour" v="#0000FF"/>
    <tag k="from" v="Malin Bridge"/>
    <tag k="name" v="Blue Route"/>
    <tag k="network" v="Supertram"/>
    <tag k="operator" v="Stagecoach"/>
    <tag k="ref" v="Blue Route"/>
    <tag k="route" v="tram"/>
    <tag k="source" v="Travel South Yorkshire"/>
    <tag k="to" v="Halfway"/>
    <tag k="type" v="route"/>
    <tag k="website" v="http://www.travelsouthyorkshire.com/timetables/sheffield/446.htm"/>
  </relation>
*/
INSERT INTO osm_relations(osm_id, relation)
SELECT
	unnest(xpath('//relation/@id', x.relation)),	
	unnest(xpath('//relation', x.relation))
FROM x;

--Identify ONLY the public transport ways and a) flag them, and b) create linestrings from their points
	FOR rec IN
    	SELECT * FROM (
			SELECT id, osm_id, 
				unnest(xpath('//tag[@k="route"]/@v', relation)) :: varchar AS routeType,
				(unnest(xpath('//member[@type="way"]/@ref', relation)) :: varchar) :: bigint AS way_osm_id				
			FROM osm_relations
		) t
		WHERE t.routeType IN ('bus', 'tram', 'train')
	LOOP
    	UPDATE osm_ways SET 
			is_public_way = true, 
			is_bus = (rec.routetype = 'bus'),
			is_train = (rec.routetype = 'train'),
			is_tram = (rec.routetype = 'tram')
		WHERE osm_id = rec.way_osm_id;
    END LOOP;

	CREATE TEMPORARY TABLE tmp (id bigint, pnt geometry(Point, 27700));
	
	FOR rec2 IN 
		SELECT id FROM osm_ways WHERE is_public_way = true
	LOOP 
		FOR rec IN
			SELECT id, (unnest(xpath('//nd/@ref', way)) :: varchar) :: bigint as node_osm_id
			FROM osm_ways
			WHERE id = rec2.id
		LOOP
    		INSERT INTO tmp 
			SELECT id, geom FROM osm_nodes WHERE osm_id = rec.node_osm_id;
   	 	END LOOP;
	
		UPDATE osm_ways SET geom = (SELECT ST_MakeLine(pnt) FROM tmp) WHERE id = rec2.id;
		--clear
		DELETE FROM tmp;
	END LOOP;
	
	DROP TABLE tmp;

END
$$;


ALTER FUNCTION loadosmrelationsfromfile(filename character varying) OWNER TO postgres;
/*
A loose collection of scripts create a table based on cycle infrastructure identified in the OSM network.
We can then use the pg_routing funcvtions to determine a basic indicator of connectivity.
Analysis continued in R
*/

CREATE TABLE ways_cycle_infrastructure AS
WITH x AS (
	SELECT geom FROM ttw_boundaries
)
SELECT w.* 
FROM ways_clean w, x
WHERE w.bicycle_infrastructure IN ('shared','segregated')
AND ST_Contains(x.geom, w.geom);

SELECT pgr_createTopology('ways_cycle_infrastructure', 0.0001, 'geom', 'id', 'source', 'target', rows_where := 'true', clean := 'true');
SELECT pgr_analyzeGraph('ways_cycle_infrastructure', 0.0001, 'geom', 'id', 'source', 'target', rows_where := 'true');

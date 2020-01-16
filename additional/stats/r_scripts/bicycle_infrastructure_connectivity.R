library("RPostgreSQL")

dbname <- {"production"}
dbuser <- {"postgres"}
dbport <- {"5432"}
dbpw <- {"xxxxxxxxxxxxxxxxxxxx"}
dbhost <- {"localhost"}
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname = dbname, host = dbhost, port = dbport, user = dbuser, password = dbpw)
rm(dbpw)

counts <- dbGetQuery(con, "SELECT * FROM (
  SELECT 1 as sort_order, 'all ways' AS type, COUNT(v.id) AS count 
  FROM ways_clean_vertices_pgr v
  JOIN ways_clean c ON c.source = v.id
  CROSS JOIN (SELECT geom FROM ttw_boundaries) AS b
  WHERE ST_Contains(b.geom, c.geom)
  UNION 
  SELECT 2 as sort_order, 'dead end ways' AS type, COUNT(v.id) AS count 
  FROM ways_clean_vertices_pgr  v
  JOIN ways_clean c ON c.source = v.id
  CROSS JOIN (SELECT geom FROM ttw_boundaries) AS b
  WHERE ST_Contains(b.geom, c.geom) 
  AND cnt = 1
  UNION
  SELECT 3 as sort_order, 'all cycle ways' AS type, COUNT(v.id) AS count 
  FROM ways_cycle_infrastructure_vertices_pgr v
  JOIN ways_clean c ON c.source = v.id
  CROSS JOIN (SELECT geom FROM ttw_boundaries) AS b
  WHERE ST_Contains(b.geom, c.geom)
  UNION 
  SELECT 4 as sort_order, 'dead end cycle ways' AS type, COUNT(v.id) AS count 
  FROM ways_cycle_infrastructure_vertices_pgr v
  JOIN ways_clean c ON c.source = v.id
  CROSS JOIN (SELECT geom FROM ttw_boundaries) AS b
  WHERE ST_Contains(b.geom, c.geom)
  AND cnt = 1
) x 
ORDER BY x.sort_order")

perc_all_ways = (counts[2,3] / counts[1,3]) * 100

perc_cycle_ways = (counts[4,3] / counts[3,3]) * 100
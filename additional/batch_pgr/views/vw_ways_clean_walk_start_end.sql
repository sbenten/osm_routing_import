-- Materialized View: vw_ways_clean_walk_start_end

-- DROP MATERIALIZED VIEW vw_ways_clean_walk_start_end;

CREATE MATERIALIZED VIEW vw_ways_clean_walk_start_end AS 
 SELECT v.id,
    v.the_geom
   FROM ways_clean_vertices_pgr v
     LEFT JOIN ways_clean w ON w.source = v.id
  WHERE w.walk_allow = true
UNION
 SELECT v.id,
    v.the_geom
   FROM ways_clean_vertices_pgr v
     LEFT JOIN ways_clean w ON w.target = v.id
  WHERE w.walk_allow = true
WITH DATA;

ALTER TABLE vw_ways_clean_walk_start_end
  OWNER TO postgres;

-- Index: vw_ways_clean_walk_start_end_gist

-- DROP INDEX vw_ways_clean_walk_start_end_gist;

CREATE INDEX vw_ways_clean_walk_start_end_gist
  ON vw_ways_clean_walk_start_end
  USING gist
  (the_geom);


-- Materialized View: sheffield.vw_ways_clean_car_start_end

-- DROP MATERIALIZED VIEW sheffield.vw_ways_clean_car_start_end;

CREATE MATERIALIZED VIEW sheffield.vw_ways_clean_car_start_end AS 
 SELECT v.id,
    v.the_geom
   FROM sheffield.ways_clean_vertices_pgr v
     LEFT JOIN import.ways_clean w ON w.source = v.id
  WHERE w.car_allow = true
UNION
 SELECT v.id,
    v.the_geom
   FROM sheffield.ways_clean_vertices_pgr v
     LEFT JOIN sheffield.ways_clean w ON w.target = v.id
  WHERE w.car_allow = true
WITH DATA;

ALTER TABLE sheffield.vw_ways_clean_car_start_end
  OWNER TO postgres;

-- Index: sheffield.vw_ways_clean_car_start_end_gist

-- DROP INDEX sheffield.vw_ways_clean_car_start_end_gist;

CREATE INDEX vw_ways_clean_car_start_end_gist
  ON sheffield.vw_ways_clean_car_start_end
  USING gist
  (the_geom);


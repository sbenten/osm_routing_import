-- View: sheffield.vw_way_restrictions

-- DROP VIEW sheffield.vw_way_restrictions;

/*
Only intended for use in QGis to place road sign symbols on maps
*/

CREATE OR REPLACE VIEW sheffield.vw_way_restrictions AS 
 SELECT r.id,
    r.restriction,
    r.from_osm_id,
    r.to_osm_id,
    r.car_cost,
    r.walk_cost,
    f.id AS from_id,
    f.geom AS from_geom,
    f.name AS from_name,
    f.highway AS from_highway,
    f.attrs AS from_attrs,
    t.id AS to_id,
    t.geom AS to_geom,
    t.name AS to_name,
    t.highway AS to_highway,
    t.attrs AS to_attrs,
        CASE
            WHEN f.length_m < 10::double precision THEN st_lineinterpolatepoint(f.geom, 0.5::double precision)
            WHEN st_touches(t.geom, st_endpoint(f.geom)) THEN st_lineinterpolatepoint(f.geom, (f.length_m - 7.5::double precision) / f.length_m)
            WHEN st_touches(t.geom, st_startpoint(f.geom)) THEN st_lineinterpolatepoint(f.geom, 1::double precision - (f.length_m - 7.5::double precision) / f.length_m)
            ELSE sheffield.getosmwayintersectionpoint(r.from_osm_id, r.to_osm_id)::geometry(Point,97460)
        END AS sign_geom,
        CASE
            WHEN st_touches(t.geom, st_endpoint(f.geom)) THEN degrees(st_azimuth(st_startpoint(f.geom), st_endpoint(f.geom)))::integer
            WHEN st_touches(t.geom, st_startpoint(f.geom)) THEN degrees(st_azimuth(st_endpoint(f.geom), st_startpoint(f.geom)))::integer
            ELSE degrees(0::double precision)::integer
        END AS sign_azimuth
   FROM sheffield.way_restrictions r
     JOIN sheffield.ways_clean f ON f.id = r.from_id
     JOIN sheffield.ways_clean t ON t.id = r.to_id;

ALTER TABLE sheffield.vw_way_restrictions
  OWNER TO postgres;

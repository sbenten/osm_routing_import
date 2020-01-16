-- View: vw_bicycle_restrictions

-- DROP VIEW vw_bicycle_restrictions;

CREATE OR REPLACE VIEW vw_bicycle_restrictions AS 
 SELECT way_restrictions.bike_cost AS to_cost,
    way_restrictions.to_id AS target_id,
    way_restrictions.from_id::text AS via_path
   FROM way_restrictions
  WHERE way_restrictions.bike_cost > 0::double precision;

ALTER TABLE vw_bicycle_restrictions
  OWNER TO postgres;
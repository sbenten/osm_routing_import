CREATE TABLE import.builtup_area_polys
(
  id integer NOT NULL,
  geom geometry(Polygon,27700),
  objectid bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE import.builtup_area_polys
  OWNER TO postgres;

CREATE INDEX sidx_builtup_area_polys_geom
  ON import.builtup_area_polys
  USING gist
  (geom);


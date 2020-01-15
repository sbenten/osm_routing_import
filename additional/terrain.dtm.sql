-- Sequence: terrain.dtm_extent_id_seq

-- DROP SEQUENCE terrain.dtm_extent_id_seq;

CREATE SEQUENCE terrain.dtm_extent_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 180
  CACHE 1;
ALTER TABLE terrain.dtm_extent_id_seq
  OWNER TO postgres;

-- Sequence: terrain.dtm_rid_seq

-- DROP SEQUENCE terrain.dtm_rid_seq;

CREATE SEQUENCE terrain.dtm_rid_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE terrain.dtm_rid_seq
  OWNER TO postgres;

-- Table: terrain.dtm

-- DROP TABLE terrain.dtm;

CREATE TABLE terrain.dtm
(
  rid serial NOT NULL,
  rast raster,
  CONSTRAINT dtm_pkey PRIMARY KEY (rid),
  CONSTRAINT enforce_height_rast CHECK (st_height(rast) = 1000),
  CONSTRAINT enforce_max_extent_rast CHECK (st_envelope(rast) @ '0103000020346C0000010000000500000000000000E01B184100000000E0AA154100000000E01B1841000000006054194100000000C0AF1C41000000006054194100000000C0AF1C4100000000E0AA154100000000E01B184100000000E0AA1541'::geometry) NOT VALID,
  CONSTRAINT enforce_nodata_values_rast CHECK (_raster_constraint_nodata_values(rast) = '{NULL}'::numeric[]),
  CONSTRAINT enforce_num_bands_rast CHECK (st_numbands(rast) = 1),
  CONSTRAINT enforce_out_db_rast CHECK (_raster_constraint_out_db(rast) = '{f}'::boolean[]),
  CONSTRAINT enforce_pixel_types_rast CHECK (_raster_constraint_pixel_types(rast) = '{32BF}'::text[]),
  CONSTRAINT enforce_same_alignment_rast CHECK (st_samealignment(rast, '0100000000000000000000144000000000000014C000000000E01B1841000000004006194100000000000000000000000000000000346C000001000100'::raster)),
  CONSTRAINT enforce_scalex_rast CHECK (round(st_scalex(rast)::numeric, 10) = round(5::numeric, 10)),
  CONSTRAINT enforce_scaley_rast CHECK (round(st_scaley(rast)::numeric, 10) = round(- 5::numeric, 10)),
  CONSTRAINT enforce_srid_rast CHECK (st_srid(rast) = 27700),
  CONSTRAINT enforce_width_rast CHECK (st_width(rast) = 1000)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE terrain.dtm
  OWNER TO postgres;

-- Index: terrain.dtm_st_convexhull_idx

-- DROP INDEX terrain.dtm_st_convexhull_idx;

CREATE INDEX dtm_st_convexhull_idx
  ON terrain.dtm
  USING gist
  (st_convexhull(rast));

-- Table: terrain.dtm_extent

-- DROP TABLE terrain.dtm_extent;

CREATE TABLE terrain.dtm_extent
(
  id integer NOT NULL DEFAULT nextval('terrain.dtm_extent_id_seq'::regclass),
  rid integer NOT NULL,
  geom geometry(Polygon,27700) NOT NULL,
  CONSTRAINT dtm_extent_pkey PRIMARY KEY (id),
  CONSTRAINT dtm_extent_dtm_rid_fkey FOREIGN KEY (rid)
      REFERENCES terrain.dtm (rid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE terrain.dtm_extent
  OWNER TO postgres;

-- Index: terrain.terrain_dtm_idx

-- DROP INDEX terrain.terrain_dtm_idx;

CREATE INDEX terrain_dtm_idx
  ON terrain.dtm_extent
  USING gist
  (geom);


-- Function: import.generaterandombuildingsample(integer, geometry, double precision)

-- DROP FUNCTION import.generaterandombuildingsample(integer, geometry, double precision);

CREATE OR REPLACE FUNCTION import.generaterandombuildingsample(
    IN n integer,
    IN container geometry,
    IN expand double precision DEFAULT 0.0)
  RETURNS TABLE(rownum bigint, id integer, pnt geometry) AS
$BODY$
/*
Generate a number of building centroids within the specified container.
Requires buildings within a landuses table in order to randomly select the building.
DEPENDS on the "uuid-ossp" to create a random guid for ordering.
 
n = integer; Number of building centrois to randomly select.
container = geometry(Polygon, 27700); Containing polygon to control the extent of building selection.
expand (optional) = double precision; Map units to expand the provided container. Positive value expands the container, negative shrinks.
 
e.g.
SELECT * FROM generateRandomBuildingSample(100, (SELECT ST_Extent(geom) FROM sheffield.ways_clean));
SELECT * FROM generateRandomBuildingSample(50, (SELECT ST_Extent(geom) FROM sheffield.ways_clean), -1000);
*/
DECLARE 
countRecords int8;
percentRecords float8;
containingGeom geometry(Polygon, 27700);
resultPoint geometry;
resultNodeId int8;

BEGIN

	SELECT ST_Expand(container, expand) INTO containingGeom;

	--Check both overlaps and contains. An example from Sheffield has blocks of flats not quite completely within
	--a census output area, resulting in a division by zero error, it touching geometries are not included. 
	SELECT COUNT(1) INTO countRecords
	FROM import.landuses l
	WHERE l.type IN ('building', 'building_multipolygon')
	AND (ST_Overlaps(containingGeom, l.geom) = true OR ST_Contains(containingGeom, l.geom) = true);

	IF countRecords = 0 THEN
		--No buildings found in the containing geom
		--Sometimes the OSM data is not available
		--Rawmarsh, for example, doesn't have any buildings in the OSM data, but there is defintely an estate
	ELSE
		SELECT ROUND(100 * (n :: DECIMAL / countRecords), 2) INTO percentRecords;
	END IF;

	IF percentRecords > 100 THEN
		--Input requesting more samples than there are buildings
		--results in more than 100% of records and an error during sampling
		percentRecords := 100;
	END IF;

	--RAISE NOTICE 'Generating points for % percent of % records', percentRecords, countRecords;
	IF countRecords = 0 THEN
		--Basic sampling method of points in polygon
		RETURN QUERY
			SELECT row_number() OVER (ORDER BY s.guid) AS id, 0 AS id, s.pnt
			FROM 
			(
				SELECT uuid_generate_v4() as guid, (ST_Dump(ST_GeneratePoints(containingGeom, n))).geom as pnt
			) AS s;
	ELSE
		RETURN QUERY
			SELECT row_number() OVER (ORDER BY s.guid) AS rownum, s.id, s.pnt
			FROM 
			(
				SELECT uuid_generate_v4() as guid, l.id, ST_Centroid(l.geom) AS pnt
				FROM import.landuses l
				TABLESAMPLE BERNOULLI (percentRecords)
				WHERE l.type IN ('building', 'building_multipolygon')
				AND (ST_Overlaps(containingGeom, l.geom) = true OR ST_Contains(containingGeom, l.geom) = true)
			) AS s;
	END IF;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION import.generaterandombuildingsample(integer, geometry, double precision)
  OWNER TO postgres;

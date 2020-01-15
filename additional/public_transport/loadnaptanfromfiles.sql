CREATE FUNCTION loadnaptanfromfiles(files character varying[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
rec record;
/*
Import the NAPTAN
Utility function to read National Public Transport Access Node (NAPTAN) XML files FROM DISK.
The files need to be stored in the Postrgres servers data folder (or sub folder).
This uses the function pg_read_binary_file so please read: 
https://www.postgresql.org/docs/9.1/functions-admin.html#FUNCTIONS-ADMIN-GENFILE

This function relies on a set of tables to store the XML:
naptan

Due to minor differences in the XML the bus and train stops these are loaded separately.

PARAMS
files	character varying[]	Array of files to load containing bus and train stop information

RETURNS void
*/
BEGIN

	FOR rec IN 
		SELECT unnest(files) AS file
	LOOP 
		RAISE NOTICE 'Processing %  ', rec.file;
	
		--Buses
		WITH x(StopPoint) AS (
			SELECT unnest(xpath('//StopPoint', XMLPARSE(DOCUMENT convert_from(pg_read_binary_file(rec.file), 'UTF8'))))
		)
		INSERT INTO naptan (atcoCode, naptanCode, commonName, landMark, street, nptgLocalityRef, longitude, latitude, easting, northing, stopType, administrativeAreaRef)
		SELECT
			unnest(xpath('//StopPoint/AtcoCode/text()', x.StopPoint)),
			unnest(xpath('//StopPoint/NaptanCode/text()', x.StopPoint)),
			unnest(xpath('//StopPoint/Descriptor/CommonName/text()', x.StopPoint)),
			unnest(xpath('//StopPoint/Descriptor/Landmark/text()', x.StopPoint)),
			unnest(xpath('//StopPoint/Descriptor/Street/text()', x.StopPoint)),
			unnest(xpath('//StopPoint/Place/NptgLocalityRef/text()', x.StopPoint)),
			(unnest(xpath('//StopPoint/Place/Location/Translation/Longitude/text()', x.StopPoint)) :: varchar) :: float,
			(unnest(xpath('//StopPoint/Place/Location/Translation/Latitude/text()', x.StopPoint)) :: varchar) :: float,
			(unnest(xpath('//StopPoint/Place/Location/Translation/Easting/text()', x.StopPoint)) :: varchar) :: integer,
			(unnest(xpath('//StopPoint/Place/Location/Translation/Northing/text()', x.StopPoint)) :: varchar) :: integer,
			unnest(xpath('//StopPoint/StopClassification/StopType/text()', x.StopPoint)),
			unnest(xpath('//StopPoint/AdministrativeAreaRef/text()', x.StopPoint))
		FROM x;
		
		--Trains
		WITH x(StopPoint) AS (
			SELECT unnest(xpath('//StopPoint', XMLPARSE(DOCUMENT convert_from(pg_read_binary_file(rec.file), 'UTF8'))))
		)
		INSERT INTO naptan (atcoCode, commonName, street, nptgLocalityRef, longitude, latitude, easting, northing, stopType, administrativeAreaRef)
		SELECT
			unnest(xpath('//StopPoint/AtcoCode/text()', x.StopPoint)),
			unnest(xpath('//StopPoint/Descriptor/CommonName/text()', x.StopPoint)),
			unnest(xpath('//StopPoint/Descriptor/Street/text()', x.StopPoint)),
			unnest(xpath('//StopPoint/Place/NptgLocalityRef/text()', x.StopPoint)),
			(unnest(xpath('//StopPoint/Place/Location/Translation/Longitude/text()', x.StopPoint)) :: varchar) :: float,
			(unnest(xpath('//StopPoint/Place/Location/Translation/Latitude/text()', x.StopPoint)) :: varchar) :: float,
			(unnest(xpath('//StopPoint/Place/Location/Translation/Easting/text()', x.StopPoint)) :: varchar) :: integer,
			(unnest(xpath('//StopPoint/Place/Location/Translation/Northing/text()', x.StopPoint)) :: varchar) :: integer,
			unnest(xpath('//StopPoint/StopClassification/StopType/text()', x.StopPoint)),
			unnest(xpath('//StopPoint/AdministrativeAreaRef/text()', x.StopPoint))
		FROM x;
	
	END LOOP;

	RAISE NOTICE 'Setting stop geometry';
	UPDATE naptan SET import_geom =  ST_Transform(ST_SetSRID(ST_MakePoint(longitude, latitude), 4326), 27700);

END
$$;


ALTER FUNCTION loadnaptanfromfiles(busstops character varying[]) OWNER TO postgres;
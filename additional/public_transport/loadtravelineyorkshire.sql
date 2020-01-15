CREATE FUNCTION loadtravelineyorkshire(files character varying[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
rec record;
fileId integer;
/*
Import the Yorkshire files
Utility function to read Traveline National Dataset XML files FROM DISK.
The files need to be stored in the Postrgres servers data folder (or sub folder).
This uses the function pg_read_binary_file so please read: 
https://www.postgresql.org/docs/9.1/functions-admin.html#FUNCTIONS-ADMIN-GENFILE

This function relies on a set of tables to store the XML:
traveline_stop_points, traveline_route_sections, traveline_routes, traveline_journey_patterns,
traveline_operators, traveline_services, traveline_standard_services, traveline_vehicle_journeys

Due to minor differences in the XML the Yorkshire data which is allowed by the schema
each region has its own import function.

PARAMS
files	character varying[]	Array of files to load

RETURNS void
*/
BEGIN

	FOR rec IN 
		SELECT unnest(ARRAY[files]) AS file
	LOOP 	

		fileId := (SELECT nextval('traveline_files_id_seq'));

		RAISE NOTICE 'Processing %  with id %', rec.file, fileId;
		
		SET CONSTRAINTS traveline_stop_points_file_id_fkey DEFERRED;
		SET CONSTRAINTS traveline_route_sections_file_id_fkey DEFERRED;
		SET CONSTRAINTS traveline_routes_file_id_fkey DEFERRED;
		SET CONSTRAINTS traveline_journey_patterns_file_id_fkey DEFERRED;
		SET CONSTRAINTS traveline_operators_file_id_fkey DEFERRED;
		SET CONSTRAINTS traveline_services_file_id_fkey DEFERRED;
		SET CONSTRAINTS traveline_standard_services_file_id_fkey DEFERRED;
		SET CONSTRAINTS traveline_vehicle_journeys_file_id_fkey DEFERRED;	
		
		INSERT INTO traveline_files (file_id, file_name)
		VALUES (fileId, rec.file);
			
		WITH s AS (
			SELECT unnest(xpath('//StopPoints', XMLPARSE(DOCUMENT convert_from(pg_read_binary_file(rec.file), 'UTF8')))) AS x
		)
		INSERT INTO traveline_stop_points (file_id, atcocode, name)
		SELECT 
			fileId,
			unnest(xpath('//AnnotatedStopPointRef/StopPointRef/text()', s.x)),
			unnest(xpath('//AnnotatedStopPointRef/CommonName/text()', s.x))
		FROM s;	

		WITH s AS (
			SELECT unnest(xpath('//RouteSection', XMLPARSE(DOCUMENT convert_from(pg_read_binary_file(rec.file), 'UTF8')))) AS route
		)
		INSERT INTO traveline_route_sections (file_id, route_id, route_link_id, from_stop_point_ref, to_stop_point_ref, direction)
		SELECT  
			fileId,
			unnest(xpath('//RouteSection/@id', s.route)),
			unnest(xpath('//RouteSection/RouteLink/@id', s.route)),
			unnest(xpath('//RouteSection/RouteLink/From/StopPointRef/text()', s.route)),
			unnest(xpath('//RouteSection/RouteLink/To/StopPointRef/text()', s.route)),
			unnest(xpath('//RouteSection/RouteLink/Direction/text()', s.route))
		FROM s;	

		WITH s AS (
			SELECT unnest(xpath('//Routes', XMLPARSE(DOCUMENT convert_from(pg_read_binary_file(rec.file), 'UTF8')))) AS route
		)
		INSERT INTO traveline_routes (file_id, route_id, description)
		SELECT  
			fileId,
			unnest(xpath('//Route/@id', s.route)),
			unnest(xpath('//Route/Description/text()', s.route))
		FROM s;

		
		WITH s AS (
			SELECT unnest(xpath('//JourneyPatternSection', XMLPARSE(DOCUMENT convert_from(pg_read_binary_file(rec.file), 'UTF8')))) AS x
		)
		INSERT INTO traveline_journey_patterns (file_id, section_id, journey_pattern_timing_id, from_stop_point_ref, from_timing_status, to_stop_point_ref, to_timing_status, route_link_id, runtime)
		SELECT  
			fileId,
			unnest(xpath('//JourneyPatternSection/@id', s.x)),
			unnest(xpath('//JourneyPatternSection/JourneyPatternTimingLink/@id', s.x)),
			unnest(xpath('//JourneyPatternSection/JourneyPatternTimingLink/From/StopPointRef/text()', s.x)),
			unnest(xpath('//JourneyPatternSection/JourneyPatternTimingLink/From/TimingStatus/text()', s.x)),
			unnest(xpath('//JourneyPatternSection/JourneyPatternTimingLink/To/StopPointRef/text()', s.x)),
			unnest(xpath('//JourneyPatternSection/JourneyPatternTimingLink/To/TimingStatus/text()', s.x)),
			unnest(xpath('//JourneyPatternSection/JourneyPatternTimingLink/RouteLinkRef/text()', s.x)),
			(unnest(xpath('//JourneyPatternSection/JourneyPatternTimingLink/RunTime/text()', s.x)) ::varchar) :: interval --https://en.wikipedia.org/wiki/ISO_8601
		FROM s;
		
		
		WITH s AS (
			SELECT unnest(xpath('//Operator', XMLPARSE(DOCUMENT convert_from(pg_read_binary_file(rec.file), 'UTF8')))) AS x
		)
		INSERT INTO traveline_operators (file_id, national_code, code, short_name)
		SELECT  
			fileId,
			unnest(xpath('//NationalOperatorCode/text()', s.x)),
			unnest(xpath('//OperatorCode/text()', s.x)),
			unnest(xpath('//OperatorShortName/text()', s.x))
		FROM s;	
			
			
		WITH s AS (
			SELECT unnest(xpath('//Services/Service', XMLPARSE(DOCUMENT convert_from(pg_read_binary_file(rec.file), 'UTF8')))) AS x
		)
		INSERT INTO traveline_services (file_id, service_code, line_name, start_date, operator_code, mode, description)
		SELECT 
			fileId,
			unnest(xpath('//ServiceCode/text()', s.x)),
			unnest(xpath('//Lines/Line[1]/LineName/text()', s.x)), --EM uses unique codes, not an ordered id value
			unnest(xpath('//OperatingPeriod/StartDate/text()', s.x)),
			unnest(xpath('//RegisteredOperatorRef/text()', s.x)),
			unnest(xpath('//Mode/text()', s.x)),
			unnest(xpath('//Description/text()', s.x)) --EM stores the operating profile in the service (though it is sometimes over-ridden here). It also uses MondayToFriday as a node.
		FROM s;

		WITH s AS (
			SELECT unnest(xpath('//Services/Service/StandardService', XMLPARSE(DOCUMENT convert_from(pg_read_binary_file(rec.file), 'UTF8')))) AS x
		)
		INSERT INTO traveline_standard_services (file_id, origin, destination, section_id, direction, journey_pattern_timing_id)
		SELECT  
			fileId,
			unnest(xpath('//Origin/text()', s.x)),
			unnest(xpath('//Destination/text()', s.x)),
			unnest(xpath('//JourneyPattern/@id', s.x)),
			unnest(xpath('//JourneyPattern/Direction/text()', s.x)),
			unnest(xpath('//JourneyPattern/JourneyPatternSectionRefs/text()', s.x))
		FROM s;
			
			
		WITH s AS (
			SELECT unnest(xpath('//VehicleJourneys/VehicleJourney', XMLPARSE(DOCUMENT convert_from(pg_read_binary_file(rec.file), 'UTF8')))) AS x
		)
		INSERT INTO traveline_vehicle_journeys (file_id, operator_code, vehicle_journey_code, vehicle_service_code, line_ref, service_code, departure_time, days_week)
		SELECT  
			fileId,
			unnest(xpath('//OperatorRef/text()', s.x)),
			unnest(xpath('//VehicleJourneyCode/text()', s.x)),
			unnest(xpath('//ServiceRef/text()', s.x)),
			unnest(xpath('//LineRef/text()', s.x)),
			unnest(xpath('//JourneyPatternRef/text()', s.x)),
			CAST(CAST(unnest(xpath('//DepartureTime/text()', s.x)) AS varchar) AS time),
			unnest(xpath('//OperatingProfile/RegularDayType/DaysOfWeek', s.x)) --EM stores the operating profile in the service (though it is sometimes over-ridden here). It also uses MondayToFriday as a node.
		FROM s;
	END LOOP;
END 
$$;


ALTER FUNCTION loadtravelineyorkshire(files character varying[]) OWNER TO postgres;
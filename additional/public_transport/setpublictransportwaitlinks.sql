CREATE FUNCTION setpublictransportwaitlinks() RETURNS void
    LANGUAGE plpgsql
    AS $$
/*
Add waiting links between public transport stops for connecting services.
Each waiting link is assumed to linking services that are between 5 and 20 minutes after each other, in order to cope with delays to services.
May take a while...

NOTE geometry SRID hardcoded

PARAMS
n/a

RETURNS void
*/	
DECLARE

BEGIN
	--Get the stops where you can access another line, and add a cost for waiting
	WITH x AS (
		SELECT DISTINCT
			b.file_id, 
			a.route_id || ' ' || b.route_id AS route_id,
			a.route_link_id || ' ' || b.route_link_id AS route_link_id,
			a.direction || ' ' || b.direction AS direction,
			a.target AS source, --Yeah, it looks weird
			b.source AS target, --but this a new link, so the end of one route section is the start, and vice versa
			ST_SetSRID(
				ST_MakeLine(ARRAY[
					v.the_geom, 
					ST_SetSRID(ST_MakePoint(ST_X(v.the_geom) + 0.0000001, ST_Y(v.the_geom)), 27700), 
					ST_SetSRID(ST_MakePoint(ST_X(v.the_geom) , ST_Y(v.the_geom) + 0.0000001), 27700)
				])
			, 27700) AS geom,
			a.line_name || ' ' || b.line_name AS line_name,
			b.operator_name,
			b.public_transport_route_id,
			b.route_description,
			b.route_direction,
			a.target_public_transport_route_stop_id AS source_public_transport_route_stop_id,
			a.target_atco_code AS source_atco_code,
			a.target_public_transport_stop_id AS source_public_transport_stop_id,
			a.target_naptan_code AS source_naptan_code,
			a.target_stop_name AS source_stop_name,
			a.target_stop_landmark AS source_stop_landmark,
			a.target_timing_status AS source_timing_status,
			a.target_cluster_id AS source_cluster_id,
			a.target_geom AS source_geom,
			b.source_public_transport_route_stop_id AS target_public_transport_route_stop_id,
			b.source_atco_code AS target_atco_code,
			b.source_public_transport_stop_id AS target_public_transport_stop_id,
			b.source_naptan_code AS target_naptan_code,
			b.source_stop_name AS target_stop_name,
			b.source_stop_landmark AS target_stop_landmark,
			b.source_timing_status AS target_timing_status,
			b.source_cluster_id AS target_cluster_id,
			b.source_geom AS target_geom,
			a.journey_pattern_section_id || ' ' || b.journey_pattern_section_id AS journey_pattern_section_id,
			a.journey_pattern_timing_id || ' ' || b.journey_pattern_timing_id AS journey_pattern_timing_id,
			b.stop_time - a.stop_time AS runtime,
			b.stop_time - a.stop_time AS agg_runtime,
			b.vehicle_journey_code, 
			b.vehicle_service_code, 
			b.service_code,
			b.departure_time,
			b.stop_time,
			b.monday,
			b.tuesday,
			b.wednesday,
			b.thursday,
			b.friday,
			b.saturday,
			b.sunday,
			b.public_transport_route_way_id,
			'wait' AS transport_mode,
			ST_Length(ST_SetSRID(
				ST_MakeLine(ARRAY[
					v.the_geom, 
					ST_SetSRID(ST_MakePoint(ST_X(v.the_geom) + 0.0000001, ST_Y(v.the_geom)), 27700), 
					ST_SetSRID(ST_MakePoint(ST_X(v.the_geom) , ST_Y(v.the_geom) + 0.0000001), 27700)
				])
			, 27700)) AS length_m,
			a.endaltitude AS startaltitude,
			b.startaltitude AS endaltitude,
			0 AS totalascent,
			0 AS totaldescent,
			0 AS curveindex,
			EXTRACT(EPOCH FROM (b.stop_time - a.stop_time)) AS cost,
			10000000 AS reverse_cost,
			EXTRACT(EPOCH FROM (b.stop_time - a.stop_time)) AS cost_time,
			EXTRACT(EPOCH FROM (b.stop_time - a.stop_time)) AS reverse_cost_time,
			getMetCost('met_07040', EXTRACT(EPOCH FROM (b.stop_time - a.stop_time))) AS cost_met,
			getMetCost('met_07040', EXTRACT(EPOCH FROM (b.stop_time - a.stop_time))) AS reverse_cost_met,
			1 AS oneway,
			1 As speed,
			1.0 AS terrain_index,
			0.0 AS percentslope,
			0.0 AS reversepercentslope,
			0.0 AS angleslope,
			0.0 AS reverseangleslope
		FROM public_transport_route_times a
		CROSS JOIN public_transport_route_times b
		JOIN public_transport_route_times_vertices_pgr v ON a.target = v.id
		WHERE a.route_id != b.route_id
		AND a.line_name != b.line_name
		AND a.target_public_transport_stop_id = b.source_public_transport_stop_id
		AND (a.stop_time + 5::double precision * '00:01:00'::interval) < b.stop_time 
		AND (b.stop_time - a.stop_time) < (20::double precision * '00:01:00'::interval)
	)
	INSERT INTO public_transport_route_times 
	(
		file_id, route_id, route_link_id, direction, source, target, geom, line_name, operator_name, 
		public_transport_route_id, route_description, route_direction, 
		source_public_transport_route_stop_id, source_atco_code, source_public_transport_stop_id, source_naptan_code, source_stop_name, source_stop_landmark, source_timing_status, source_cluster_id, source_geom,
		target_public_transport_route_stop_id, target_atco_code, target_public_transport_stop_id, target_naptan_code, target_stop_name, target_stop_landmark, target_timing_status, target_cluster_id, target_geom, 
		journey_pattern_section_id, journey_pattern_timing_id, runtime, agg_runtime, vehicle_journey_code, vehicle_service_code, service_code, departure_time, stop_time, 
		monday, tuesday, wednesday, thursday, friday, saturday, sunday, public_transport_route_way_id, transport_mode, length_m, 
		startaltitude, endaltitude, totalascent, totaldescent, curveindex, cost, reverse_cost, cost_time, reverse_cost_time, cost_met, reverse_cost_met, oneway, speed, terrain_index, 
		percentslope, reversepercentslope, angleslope, reverseangleslope
	)
	SELECT 
		x.file_id, x.route_id, x.route_link_id, x.direction, x.source, x.target, x.geom, x.line_name, x.operator_name, 
		x.public_transport_route_id, x.route_description, x.route_direction, 
		x.source_public_transport_route_stop_id, x.source_atco_code, x.source_public_transport_stop_id, x.source_naptan_code, x.source_stop_name, x.source_stop_landmark, x.source_timing_status, x.source_cluster_id, x.source_geom,
		x.target_public_transport_route_stop_id, x.target_atco_code, x.target_public_transport_stop_id, x.target_naptan_code, x.target_stop_name, x.target_stop_landmark, x.target_timing_status, x.target_cluster_id, x.target_geom,
		x.journey_pattern_section_id, x.journey_pattern_timing_id, x.runtime, x.agg_runtime, x.vehicle_journey_code, x.vehicle_service_code, x.service_code, x.departure_time, x.stop_time,
		x.monday, x.tuesday, x.wednesday, x.thursday, x.friday, x.saturday, x.sunday, x.public_transport_route_way_id, x.transport_mode, x.length_m,
		x.startaltitude, x.endaltitude, x.totalascent, x.totaldescent, x.curveindex, x.cost, x.reverse_cost, x.cost_time, x.reverse_cost_time, x.cost_met, x.reverse_cost_met, x.oneway, x.speed, x.terrain_index,
		x.percentslope, x.reversepercentslope, x.angleslope, x.reverseangleslope
	FROM x;
END 
$$;


ALTER FUNCTION setpublictransportwaitlinks() OWNER TO postgres;
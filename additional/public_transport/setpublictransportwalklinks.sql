CREATE FUNCTION setpublictransportwalklinks() RETURNS void
    LANGUAGE plpgsql
    AS $$
/*
Add walking links between public transport stops for connecting services.
The calculation of geometries for walking between potential links should be performed prior to this function for expediancy.
Each walking link is assumed to linking services that are between 5 and 20 minutes after each other.
May take a while...

PARAMS
n/a

RETURNS void
*/
DECLARE

BEGIN
	--Get the stops where you can access another line, and add a cost for waiting
	WITH w AS (	
		SELECT id, geom, ('walk' :: character varying) AS transport_mode, cost, reverse_cost, cost_time, reverse_cost_time, cost_met, reverse_cost_met,
			length_m, startaltitude, endaltitude, totalascent, totaldescent, curveindex, oneway, percentslope, reversepercentslope, 
			angleslope, reverseangleslope, speed, terrain_index, source_atco_code, target_atco_code
		FROM public_transport_route_connection_ways
		WHERE geom IS NOT NULL
	), a AS (
		SELECT DISTINCT
			w.id AS way_id, t.target AS vertex_id, t.route_id, t.route_link_id, t.direction, t.line_name, 
			t.target_public_transport_route_stop_id, t.target_public_transport_stop_id, t.target_naptan_code, t.target_stop_name, t.target_stop_landmark, t.target_timing_status, t.target_cluster_id, t.target_geom,
			t.journey_pattern_section_id, t.journey_pattern_timing_id, t.runtime, t.agg_runtime, t.stop_time	
		FROM public_transport_route_times t, w
		WHERE t.transport_mode IN ('tram', 'bus', 'train')
		AND t.source_atco_code = w.target_atco_code
	), b AS (
		SELECT DISTINCT
			w.id AS way_id, t.source AS vertex_id, t.file_id, t.route_id, t.route_link_id, t.direction, t.source, t.target, t.line_name, t.operator_name, 
			t.id, t.public_transport_route_id, t.route_description, t.route_direction,  
			t.source_public_transport_route_stop_id, t.source_public_transport_stop_id, t.source_naptan_code, t.source_stop_name, t.source_stop_landmark, t.source_timing_status, t.source_cluster_id, t.source_geom,
			t.journey_pattern_section_id, t.journey_pattern_timing_id, t.runtime, t.agg_runtime, t.vehicle_journey_code, t.vehicle_service_code, t.service_code,
			t.departure_time, t.stop_time, t.monday, t.tuesday, t.wednesday, t.thursday, t.friday, t.saturday, t.sunday, 		 
			w.geom, w.transport_mode, w.cost, w.reverse_cost, w.cost_time, w.reverse_cost_time, w.cost_met, w.reverse_cost_met,
			w.length_m, w.startaltitude, w.endaltitude, w.totalascent, w.totaldescent, w.curveindex, w.oneway, w.percentslope, w.reversepercentslope, 
			w.angleslope, w.reverseangleslope, w.speed, w.terrain_index, w.source_atco_code, w.target_atco_code
		FROM public_transport_route_times t, w
		WHERE t.transport_mode IN ('tram', 'bus', 'train')
		AND t.source_atco_code = w.source_atco_code
	), x AS (
		SELECT DISTINCT
			b.file_id, 
			b.route_id AS route_id,
			b.route_link_id AS route_link_id,
			b.direction AS direction,
			a.vertex_id AS source, --Yeah, it looks weird
			b.vertex_id AS target, --but this a new link, so the end of one route section is the start, and vice versa
			b.geom,
			a.line_name || ' ' || b.line_name AS line_name,
			b.operator_name,
			b.public_transport_route_id,
			b.route_description,
			b.route_direction,
			a.target_public_transport_route_stop_id AS source_public_transport_route_stop_id,
			b.source_atco_code,
			a.target_public_transport_stop_id AS source_public_transport_stop_id,
			a.target_naptan_code AS source_naptan_code,
			a.target_stop_name AS source_stop_name,
			a.target_stop_landmark AS source_stop_landmark,
			a.target_timing_status AS source_timing_status,
			a.target_cluster_id AS source_cluster_id,
			a.target_geom AS source_geom,
			b.source_public_transport_route_stop_id AS target_public_transport_route_stop_id,
			b.target_atco_code,
			b.source_public_transport_stop_id AS target_public_transport_stop_id,
			b.source_naptan_code AS target_naptan_code,
			b.source_stop_name AS target_stop_name,
			b.source_stop_landmark AS target_stop_landmark,
			b.source_timing_status AS target_timing_status,
			b.source_cluster_id AS target_cluster_id,
			b.source_geom AS target_geom,
			b.journey_pattern_section_id AS journey_pattern_section_id,
			b.journey_pattern_timing_id AS journey_pattern_timing_id,
			b.runtime,
			b.agg_runtime,
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
			'walk' AS transport_mode,
			b.length_m,
			b.startaltitude,
			b.endaltitude,
			b.totalascent,
			b.totaldescent,
			b.curveindex,
			b.cost + EXTRACT(EPOCH FROM (b.stop_time - (a.stop_time + b.cost_time::double precision * '00:00:01'::interval))) AS cost,
			10000000 AS reverse_cost,
			b.cost_time + EXTRACT(EPOCH FROM (b.stop_time - (a.stop_time + b.cost_time::double precision * '00:00:01'::interval))) AS cost_time,
			b.reverse_cost_time + EXTRACT(EPOCH FROM (b.stop_time - (a.stop_time + b.cost_time::double precision * '00:00:01'::interval))) AS reverse_cost_time,
			b.cost_met + getMetCost('met_07040', EXTRACT(EPOCH FROM (b.stop_time - (a.stop_time + b.cost_time::double precision * '00:00:01'::interval)))) AS cost_met,
			b.reverse_cost_met + getMetCost('met_07040', EXTRACT(EPOCH FROM (b.stop_time - (a.stop_time + b.cost_time::double precision * '00:00:01'::interval)))) AS reverse_cost_met,		
			b.oneway,
			b.speed,
			b.terrain_index,
			b.percentslope,
			b.reversepercentslope,
			b.angleslope,
			b.reverseangleslope,
			b.way_id
		FROM a, b
		WHERE a.way_id = b.way_id
		AND a.route_id != b.route_id
		AND a.line_name != b.line_name
		AND a.target_public_transport_stop_id != b.source_public_transport_route_stop_id
		AND (a.stop_time + b.cost_time::double precision * '00:00:01'::interval + 5::double precision * '00:01:00'::interval) < b.stop_time 
		AND (b.stop_time - a.stop_time) < (20::double precision * '00:01:00'::interval) 
		AND (b.stop_time - a.stop_time) > '00:00:00'::interval
	)
	INSERT INTO public_transport_route_times 
	(
		file_id, route_id, route_link_id, direction, source, target, geom, line_name, operator_name, 
		public_transport_route_id, route_description, route_direction, 
		source_public_transport_route_stop_id, source_atco_code, source_public_transport_stop_id, source_naptan_code, source_stop_name, source_stop_landmark, source_timing_status, source_cluster_id, source_geom,
		target_public_transport_route_stop_id, target_atco_code, target_public_transport_stop_id, target_naptan_code, target_stop_name, target_stop_landmark, target_timing_status, target_cluster_id, target_geom, 
		journey_pattern_section_id, journey_pattern_timing_id, runtime, agg_runtime, vehicle_journey_code, vehicle_service_code, service_code, departure_time, stop_time, 
		monday, tuesday, wednesday, thursday, friday, saturday, sunday, transport_mode, length_m, 
		startaltitude, endaltitude, totalascent, totaldescent, curveindex, cost, reverse_cost, cost_time, reverse_cost_time, cost_met, reverse_cost_met, oneway, speed, terrain_index, 
		percentslope, reversepercentslope, angleslope, reverseangleslope, public_transport_route_connection_way_id
	)
	SELECT DISTINCT
		x.file_id, x.route_id, x.route_link_id, x.direction, x.source, x.target, x.geom, x.line_name, x.operator_name, 
		x.public_transport_route_id, x.route_description, x.route_direction, 
		x.source_public_transport_route_stop_id, x.source_atco_code, x.source_public_transport_stop_id, x.source_naptan_code, x.source_stop_name, x.source_stop_landmark, x.source_timing_status, x.source_cluster_id, x.source_geom,
		x.target_public_transport_route_stop_id, x.target_atco_code, x.target_public_transport_stop_id, x.target_naptan_code, x.target_stop_name, x.target_stop_landmark, x.target_timing_status, x.target_cluster_id, x.target_geom,
		x.journey_pattern_section_id, x.journey_pattern_timing_id, x.runtime, x.agg_runtime, x.vehicle_journey_code, x.vehicle_service_code, x.service_code, x.departure_time, x.stop_time,
		x.monday, x.tuesday, x.wednesday, x.thursday, x.friday, x.saturday, x.sunday, x.transport_mode, x.length_m,
		x.startaltitude, x.endaltitude, x.totalascent, x.totaldescent, x.curveindex, x.cost, x.reverse_cost, x.cost_time, x.reverse_cost_time, x.cost_met, x.reverse_cost_met, x.oneway, x.speed, x.terrain_index,
		x.percentslope, x.reversepercentslope, x.angleslope, x.reverseangleslope, x.way_id
	FROM x;
END 
$$;


ALTER FUNCTION setpublictransportwalklinks() OWNER TO postgres;
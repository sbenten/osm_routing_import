-- Function: sheffield.runbatch(integer, integer)

-- DROP FUNCTION sheffield.runbatch(integer, integer);

CREATE OR REPLACE FUNCTION sheffield.runbatch(
    batchid integer,
    delaytype integer DEFAULT 1)
  RETURNS integer AS
$BODY$
/*
For the source and targets for a given batch.id, calculate the shortest route for 
the transportation modes of car, cycle or foot, incorporating turn restrictions
using pgr_trsp.
Insert a record of the batch_run and the details of the route chosen in batch_runs_res.

Returns the batch_runs.id to re-query the path and parameters of the chosen route.

batchId = sheffield.batches.id
delayType = enum: 1 = Morning rush hour, 2 = Evening rush hour

Usage: SELECT sheffield.runBatch(1, 2, 1500);
*/
DECLARE
runId integer;
subGroupId integer;
rec record;
cardelay float := 1.0;
busdelay float := 1.0;
cycledelay float := 1.0;
walkdelay float := 1.0;
carParkTolerance double precision := 1000;

/*
Not sure why, but the overload to pgr_trsp (and possibly pgr_djikstra), where the edge and position it
can be specified, fails to return any route details if either the very end or start node on the 
line are specified. For example a position of 0 or 1 along an edge will return empty results. Replace this with 
either of the below and route details are returned. As the edges in the route are typically below 100 meters 
in length, this will barely drop a millimeter off the resulting path length. Strange though.
*/
minPosFix float := 0.000000000000001;
maxPosFix float := 0.999999999999999;

walktostartlinestring geometry(LineString, 27700);
walktostartspeed integer;
walktostartlength double precision;
walktostartcost double precision;
walktostartcosttime double precision;
walktostartcostmet double precision;

walktoendlinestring geometry(LineString, 27700);
walktoendspeed integer;
walktoendlength double precision;
walktoendcost double precision;
walktoendcosttime double precision;
walktoendcostmet double precision;

carParkId integer;
carParkEntrance geometry(Point, 27700);
carParkEntranceNodeId integer;
carParkName varchar := '';
carParkExit geometry(Point, 27700);
carParkExitNodeId integer;

--bus journey variables
busRouteId integer; 
busRouteDescription varchar := ''; 
busRouteSourceBusStop geometry(Point, 27700); 
busRouteSourceId integer;
busRouteTargetBusStop geometry(Point, 27700);
busRouteTargetId integer; 

ptDistanceReq float;
ptSourceStopCount integer;
ptTargetStopCount integer;
ptRouteStartTime time without time zone;
ptRouteEndTime time without time zone;
ptRouteTravelDirection double precision;
ptRouteTimeFilter double precision;
ptMaxAggCost double precision;
ptFinalMaxAggCost double precision;
ptRouteDirTolerance integer;
ptSourceStopLimit integer;
ptTargetStopLimit integer;
ptMaxCostLimit integer;
ptFinalCount integer;
rec2 record;

BEGIN
	-- defer the constraint
	SET CONSTRAINTS sheffield.batch_run_res_run_fkey DEFERRED;
	
	-- get the next batch_run.id up front, we're going to use it alot
	runId := (SELECT nextval('sheffield.batch_runs_id_seq'));
	
	--get the car park tolerance setting
	carParkTolerance := (SELECT sheffield.getfloatsetting('walk_from_car_park'));
	
	CASE WHEN delayType = 2 THEN 
			cardelay := (SELECT CAST(val  AS float) FROM sheffield.settings WHERE name = 'car_morning_peak');
			busdelay := (SELECT CAST(val  AS float) FROM sheffield.settings WHERE name = 'bus_morning_peak');
			cycledelay := (SELECT CAST(val  AS float) FROM sheffield.settings WHERE name = 'cycle_morning_peak');
			walkdelay := (SELECT CAST(val  AS float) FROM sheffield.settings WHERE name = 'walk_morning_peak');
			ptRouteStartTime := '16:00:00'::time without time zone;
			ptRouteEndTime := '18:00:00'::time without time zone;
			
		ELSE  
			cardelay := (SELECT CAST(val  AS float) FROM sheffield.settings WHERE name = 'car_morning_peak');
			busdelay := (SELECT CAST(val  AS float) FROM sheffield.settings WHERE name = 'bus_morning_peak');
			cycledelay := (SELECT CAST(val  AS float) FROM sheffield.settings WHERE name = 'cycle_morning_peak');
			walkdelay := (SELECT CAST(val  AS float) FROM sheffield.settings WHERE name = 'walk_morning_peak');			
			ptRouteStartTime := '07:00:00'::time without time zone;
			ptRouteEndTime := '09:00:00'::time without time zone;
	END CASE;
	
	INSERT INTO sheffield.batch_runs (id, batch_id, batchname, batchdescription)
	SELECT runId, id, name, description
	FROM sheffield.batches
	WHERE id = batchId;
	
	RAISE NOTICE '1.0 Run a simple car route (optimistic about parking)';
	FOR rec IN
		SELECT i.id, 
			nextval('sheffield.batch_run_res_group_id_seq') As group_id,
			i.source, 
			i.target,
			i.source_node,
			i.target_node,
			i.description,
			(SELECT id FROM sheffield.ways_clean_vertices_pgr WHERE ST_Equals(the_geom, i.source_node)) AS source_node_id,
			(SELECT id FROM sheffield.ways_clean_vertices_pgr WHERE ST_Equals(the_geom, i.target_node)) AS target_node_id
		FROM sheffield.batch_items i
		WHERE i.batch_id = batchId
	LOOP
		BEGIN
			--1.1 Walk to the car
			subGroupId := nextval('sheffield.batch_run_res_sub_group_id_seq');
			
			walktostartlinestring := ST_SetSRID(ST_MakeLine(rec.source, rec.source_node), 27700);
			walktostartspeed := (SELECT urban_speed FROM sheffield.ways_config WHERE type = 'walk' AND name = 'steps'); --Assume the terrain is "difficult", garden, house etc
			walktostartlength := ST_Length(walktostartlinestring);
			
			walktostartcost := sheffield.calculateCost(walktostartlength, walktostartspeed :: smallint, 0 :: smallint, false, false);
			walktostartcosttime := sheffield.calculateTimeCost(walktostartlength, walktostartspeed :: smallint);
			walktostartcostmet := sheffield.getmetcost('met_17250', walktostartcosttime);
			
			INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, sub_group_id, group_id, group_description, mode, mode_filter, sub_mode_filter,
				itemsource, itemtarget, 
				resseq, resnodeid, resedgeid, rescost, resdelay,  
				virtual_time_cost, virtual_met_cost, virtual_length_m, virtual_built_up,
				resgeom, resstreetname, batch_item_description)
			VALUES (runId, rec.id, subGroupId, rec.group_id, '1.1 car optimistic', 'walk', 1, 4,
				rec.source, rec.target, 
				0, -1, -1, walktostartcost, walkdelay, 
				walktostartcosttime, walktostartcostmet, walktostartlength, false,	
				walktostartlinestring, NULL, rec.description);
			
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE '1.1 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
				INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, group_id, mode, mode_filter, sub_mode_filter,
					itemsource, itemtarget, 
					errmsg, batch_item_description)
				SELECT runId, rec.id, rec.group_id, 'walk', 1, 4,
					rec.source, rec.target, 
					 SQLERRM, rec.description;
		END;
		
		BEGIN 	
			--1.2 Drive to work
			subGroupId := nextval('sheffield.batch_run_res_sub_group_id_seq');
			
			INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, sub_group_id, group_id, group_description, mode, mode_filter, sub_mode_filter,
				itemsource, itemtarget, 
				resseq, resnodeid, resedgeid, rescost, resdelay, 
				resgeom, resstreetname, batch_item_description)
			SELECT runId, rec.id, subGroupId, rec.group_id, '1.2 car optimistic', 'car', 1, 1, 
				rec.source, rec.target, 
				trsp.seq, trsp.id1, trsp.id2, trsp.cost, cardelay, 
				w.geom, w.name, rec.description
			FROM pgr_trsp(
        		'SELECT id, source, target, car_cost AS cost, car_reverse_cost AS reverse_cost FROM sheffield.ways_clean',
    			rec.source_node_id :: int4, rec.target_node_id :: int4,
        		true, true,
        		'SELECT to_cost, target_id, via_path FROM sheffield.vw_car_restrictions'
			) AS trsp
			LEFT JOIN sheffield.ways_clean w ON trsp.id2 = w.id;
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE '1.2 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
				INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, group_id, mode, mode_filter, sub_mode_filter,
					itemsource, itemtarget, 
					errmsg, batch_item_description)
				SELECT runId, rec.id, rec.group_id, 'car', 1, 1,
					rec.source, rec.target, 
					 SQLERRM, rec.description;
		END;
		
		BEGIN
			--1.3 Walk off the network to target
			subGroupId := nextval('sheffield.batch_run_res_sub_group_id_seq');
			
			walktoendlinestring := ST_SetSRID(ST_MakeLine(rec.target_node, rec.target), 27700);
			walktoendspeed := (SELECT urban_speed FROM sheffield.ways_config WHERE type = 'walk' AND name = 'steps'); --Assume the terrain is "difficult", garden, house etc
			walktoendlength := ST_Length(walktoendlinestring);
			
			walktoendcost := sheffield.calculateCost(walktoendlength, walktoendspeed :: smallint, 0 :: smallint, false, false);
			walktoendcosttime := sheffield.calculateTimeCost(walktoendlength, walktoendspeed :: smallint);
			walktoendcostmet := sheffield.getmetcost('met_17250', walktoendcosttime);
			
			INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, sub_group_id, group_id, group_description, mode, mode_filter, sub_mode_filter,
				itemsource, itemtarget, 
				resseq, resnodeid, resedgeid, rescost, resdelay, 
				virtual_time_cost, virtual_met_cost, virtual_length_m, virtual_built_up,
				resgeom, resstreetname, batch_item_description)
			VALUES (runId, rec.id, subGroupId, rec.group_id, '1.3 car opptimistic', 'walk', 1, 4,
				rec.source, rec.target, 
				0, -1, -1, walktoendcost, walkdelay, 
				walktoendcosttime, walktoendcostmet, walktoendlength, false,	
				walktoendlinestring, NULL, rec.description);	
			
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE '1.3 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
				INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, group_id, mode, mode_filter, sub_mode_filter,
					itemsource, itemtarget,  
					errmsg, batch_item_description)
				SELECT runId, rec.id, rec.group_id, 'walk', 1, 4,
					rec.source, rec.target, 
					 SQLERRM, rec.description;
		END;

	END LOOP;

	RAISE NOTICE '2.0 Run a car route (pessimistic about parking), so walking from a car park to the destination';
	FOR rec IN
		SELECT i.id, 
			nextval('sheffield.batch_run_res_group_id_seq') As group_id,
			i.source, 
			i.target,
			i.source_node,
			i.target_node,
			i.description,
			(SELECT id FROM sheffield.ways_clean_vertices_pgr WHERE ST_Equals(the_geom, i.source_node)) AS source_node_id,
			(SELECT id FROM sheffield.ways_clean_vertices_pgr WHERE ST_Equals(the_geom, i.target_node)) AS target_node_id
		FROM sheffield.batch_items i
		WHERE i.batch_id = batchId
	LOOP
		BEGIN
			--2.1 Walk to the car
			subGroupId := nextval('sheffield.batch_run_res_sub_group_id_seq');
			
			walktostartlinestring := ST_SetSRID(ST_MakeLine(rec.source, rec.source_node), 27700);
			walktostartspeed := (SELECT urban_speed FROM sheffield.ways_config WHERE type = 'walk' AND name = 'steps'); --Assume the terrain is "difficult", garden, house etc
			walktostartlength := ST_Length(walktostartlinestring);
			
			walktostartcost := sheffield.calculateCost(walktostartlength, walktostartspeed :: smallint, 0 :: smallint, false, false);
			walktostartcosttime := sheffield.calculateTimeCost(walktostartlength, walktostartspeed :: smallint);
			walktostartcostmet := sheffield.getmetcost('met_17250', walktostartcosttime);
			
			INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, sub_group_id, group_id, group_description, mode, mode_filter, sub_mode_filter,
				itemsource, itemtarget, 
				resseq, resnodeid, resedgeid, rescost, resdelay,  
				virtual_time_cost, virtual_met_cost, virtual_length_m, virtual_built_up,
				resgeom, resstreetname, batch_item_description)
			VALUES (runId, rec.id, subGroupId, rec.group_id, '2.1 car pessimistic', 'walk', 2, 4,
				rec.source, rec.target, 
				0, -1, -1, walktostartcost, walkdelay, 
				walktostartcosttime, walktostartcostmet, walktostartlength, false,	
				walktostartlinestring, NULL, rec.description);
			
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE '2.1 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
				INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, group_id, mode, mode_filter, sub_mode_filter,
					itemsource, itemtarget,  
					errmsg, batch_item_description)
				SELECT runId, rec.id, rec.group_id, 'walk', 2, 4,
					rec.source, rec.target, 
					 SQLERRM, rec.description;
		END;
		
		BEGIN
			--Morning commute? If so use a car park close to the target
			IF delayType = 1 THEN
				--2.2 Drive to the car park
				subGroupId := nextval('sheffield.batch_run_res_sub_group_id_seq');

				--Find the closest car park (within tolerance) to the destination
				SELECT p.id, e.geom, Coalesce(p.name, '') || ' (Car Park)' AS name INTO carParkId, carParkEntrance, carParkName 
				FROM sheffield.car_park_entrances e  
				JOIN sheffield.car_parks p ON p.id = e.car_park_id
				AND e.id = sheffield.nearestCarParkEntranceToNode( rec.target_node, carParkTolerance);

				RAISE NOTICE 'Car park: % %', carParkId, carParkName;
				
				SELECT id INTO carParkEntranceNodeId
				FROM sheffield.vw_ways_clean_car_start_end 
				ORDER BY the_geom <-> carParkEntrance
				LIMIT 1;

				RAISE NOTICE 'Car park node id: % ', carParkEntranceNodeId;
				
				BEGIN								
					INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, sub_group_id, group_id, group_description, mode, mode_filter, sub_mode_filter,
						itemsource, itemtarget,  
						resseq, resnodeid, resedgeid, rescost, resdelay, 
						resgeom, resstreetname, batch_item_description)
					SELECT runId, rec.id, subGroupId, rec.group_id, '2.2 car pessimistic', 'car', 2, 2,
						rec.source, rec.target, 
						trsp.seq, trsp.id1, trsp.id2, trsp.cost, cardelay, 
						w.geom, w.name, rec.description
					FROM pgr_trsp(
						'SELECT id, source, target, car_cost AS cost, car_reverse_cost AS reverse_cost FROM sheffield.ways_clean',
						rec.source_node_id :: int4, carParkEntranceNodeId :: int4,
						true, true,
						'SELECT to_cost, target_id, via_path FROM sheffield.vw_car_restrictions'
					) AS trsp
					LEFT JOIN sheffield.ways_clean w ON trsp.id2 = w.id;
							
				EXCEPTION
					WHEN OTHERS THEN
						RAISE NOTICE '2.2 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
						INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, group_id, mode, mode_filter, sub_mode_filter,
						itemsource, itemtarget,  
						errmsg, batch_item_description)
					SELECT runId, rec.id, rec.group_id, 'car', 2, 2, 
						rec.source, rec.target, 
						SQLERRM, rec.description;
				END;
			
				--2.3 TODO What goes on in the car park?
				--		Add a delay, for the walk across the car park? 
				--		What about multi-story car parks?
				
				BEGIN
					--2.4 Walk to the destination
					subGroupId := nextval('sheffield.batch_run_res_sub_group_id_seq');
					
					--Find the closest car park entrance to the destination
					SELECT e.geom INTO carParkExit 
					FROM sheffield.car_park_entrances e
					WHERE e.id = sheffield.nearestCarParkFootwayToNode(rec.target_node, carParkId);
					
					SELECT id INTO carParkExitNodeId
					FROM sheffield.vw_ways_clean_walk_start_end 
					ORDER BY the_geom <-> carParkExit
					LIMIT 1;
						
					INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, sub_group_id, group_id, group_description, mode, mode_filter, sub_mode_filter,
						itemsource, itemtarget,  
						resseq, resnodeid, resedgeid, rescost, resdelay, 
						resgeom, resstreetname, batch_item_description)
					SELECT runId, rec.id, subGroupId, rec.group_id, '2.4 car pessimistic', 'walk', 2, 4,
						rec.source, rec.target, 
						trsp.seq, trsp.id1, trsp.id2, trsp.cost, walkdelay, 
						w.geom, w.name, rec.description
					FROM pgr_trsp(
						'SELECT id, source, target, walk_cost AS cost, walk_reverse_cost AS reverse_cost FROM sheffield.ways_clean',
						carParkExitNodeId :: int4, rec.target_node_id :: int4,
						true, true
					) AS trsp
					LEFT JOIN sheffield.ways_clean w ON trsp.id2 = w.id;
				EXCEPTION
					WHEN OTHERS THEN
						RAISE NOTICE '2.4 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
						INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, group_id, mode, mode_filter,
							itemsource, itemtarget, 
							errmsg, batch_item_description)
						SELECT runId, rec.id, rec.group_id, 'walk', 2,
							rec.source, rec.target, 
							SQLERRM, rec.description;
				END;
			ELSE
				--Returning home, therefore walk to the car park first
				BEGIN
					--2.2 Walk to the destination
					subGroupId := nextval('sheffield.batch_run_res_sub_group_id_seq');
					
					--Find the closest car park entrance to the destination
					SELECT e.geom INTO carParkExit 
					FROM sheffield.car_park_entrances e
					WHERE e.id = sheffield.nearestCarParkFootwayToNode(rec.source_node, carParkId);
					
					SELECT id INTO carParkExitNodeId
					FROM sheffield.vw_ways_clean_walk_start_end 
					ORDER BY the_geom <-> carParkExit
					LIMIT 1;
						
					INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, sub_group_id, group_id, group_description, mode, mode_filter, sub_mode_filter,
						itemsource, itemtarget,  
						resseq, resnodeid, resedgeid, rescost, resdelay, 
						resgeom, resstreetname, batch_item_description)
					SELECT runId, rec.id, subGroupId, rec.group_id, '2.2 car pessimistic', 'walk', 2, 4,
						rec.source, rec.target, 
						trsp.seq, trsp.id1, trsp.id2, trsp.cost, walkdelay, 
						w.geom, w.name, rec.description
					FROM pgr_trsp(
						'SELECT id, source, target, walk_cost AS cost, walk_reverse_cost AS reverse_cost FROM sheffield.ways_clean',
						rec.source_node_id :: int4, carParkExitNodeId :: int4,
						true, true
					) AS trsp
					LEFT JOIN sheffield.ways_clean w ON trsp.id2 = w.id;
				EXCEPTION
					WHEN OTHERS THEN
						RAISE NOTICE '2.4 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
						INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, group_id, mode, mode_filter,
							itemsource, itemtarget, 
							errmsg, batch_item_description)
						SELECT runId, rec.id, rec.group_id, 'walk', 2,
							rec.source, rec.target, 
							SQLERRM, rec.description;
				END;
								
				--2.3 TODO What goes on in the car park?
				--		Add a delay, for the walk across the car park? 
				--		What about multi-story car parks?

				
				--2.4 Drive to the car park
				subGroupId := nextval('sheffield.batch_run_res_sub_group_id_seq');

				--Find the closest car park (within tolerance) to the destination
				SELECT p.id, e.geom, Coalesce(p.name, '') || ' (Car Park)' AS name INTO carParkId, carParkEntrance, carParkName 
				FROM sheffield.car_park_entrances e  
				JOIN sheffield.car_parks p ON p.id = e.car_park_id
				AND e.id = sheffield.nearestCarParkEntranceToNode(rec.source_node, carParkTolerance);

				RAISE NOTICE 'Car park: % %', carParkId, carParkName;
				
				SELECT id INTO carParkEntranceNodeId
				FROM sheffield.vw_ways_clean_car_start_end 
				ORDER BY the_geom <-> carParkEntrance
				LIMIT 1;

				RAISE NOTICE 'Car park node id: % ', carParkEntranceNodeId;
				
				BEGIN								
					INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, sub_group_id, group_id, group_description, mode, mode_filter, sub_mode_filter,
						itemsource, itemtarget,  
						resseq, resnodeid, resedgeid, rescost, resdelay, 
						resgeom, resstreetname, batch_item_description)
					SELECT runId, rec.id, subGroupId, rec.group_id, '2.4 car pessimistic', 'car', 2, 2,
						rec.source, rec.target, 
						trsp.seq, trsp.id1, trsp.id2, trsp.cost, cardelay, 
						w.geom, w.name, rec.description
					FROM pgr_trsp(
						'SELECT id, source, target, car_cost AS cost, car_reverse_cost AS reverse_cost FROM sheffield.ways_clean',
						carParkEntranceNodeId :: int4, rec.target_node_id :: int4, 
						true, true,
						'SELECT to_cost, target_id, via_path FROM sheffield.vw_car_restrictions'
					) AS trsp
					LEFT JOIN sheffield.ways_clean w ON trsp.id2 = w.id;
							
				EXCEPTION
					WHEN OTHERS THEN
						RAISE NOTICE '2.2 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
						INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, group_id, mode, mode_filter, sub_mode_filter,
						itemsource, itemtarget,  
						errmsg, batch_item_description)
					SELECT runId, rec.id, rec.group_id, 'car', 2, 2, 
						rec.source, rec.target, 
						SQLERRM, rec.description;
				END;
			
				
			END IF;
		END;
	
		BEGIN
			--2.5 Walk off the network to target
			subGroupId := nextval('sheffield.batch_run_res_sub_group_id_seq');
			
			walktoendlinestring := ST_SetSRID(ST_MakeLine(rec.target_node, rec.target), 27700);
			walktoendspeed := (SELECT urban_speed FROM sheffield.ways_config WHERE type = 'walk' AND name = 'steps'); --Assume the terrain is "difficult", garden, house etc
			walktoendlength := ST_Length(walktoendlinestring);
			
			walktoendcost := sheffield.calculateCost(walktoendlength, walktoendspeed :: smallint, 0 :: smallint, false, false);
			walktoendcosttime := sheffield.calculateTimeCost(walktoendlength, walktoendspeed :: smallint);
			walktoendcostmet := sheffield.getmetcost('met_17250', walktoendcosttime);
			
			INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, sub_group_id, group_id, group_description, mode, mode_filter,
				itemsource, itemtarget,  
				resseq, resnodeid, resedgeid, rescost, resdelay, 
				virtual_time_cost, virtual_met_cost, virtual_length_m, virtual_built_up,
				resgeom, resstreetname, batch_item_description)
			VALUES (runId, rec.id, subGroupId, rec.group_id, '2.5 car pessimistic', 'walk', 2,
				rec.source, rec.target, 
				0, -1, -1, walktoendcost, walkdelay, 
				walktoendcosttime, walktoendcostmet, walktoendlength, false,	
				walktoendlinestring, NULL, rec.description);	
			
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE '2.5 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
				INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, group_id, mode, mode_filter,
					itemsource, itemtarget,  
					errmsg, batch_item_description)
				SELECT runId, rec.id, rec.group_id, 'walk', 2,
					rec.source, rec.target, 
					 SQLERRM, rec.description;
		END;
	
	END LOOP;
	
	
	RAISE NOTICE '3.0 Cycle to the destination';
	FOR rec IN
		SELECT i.id, 
			nextval('sheffield.batch_run_res_group_id_seq') As group_id,
			i.source, 
			i.target,
			i.source_node,
			i.target_node,
			i.description,
			(SELECT id FROM sheffield.ways_clean_vertices_pgr WHERE ST_Equals(the_geom, i.source_node)) AS source_node_id,
			(SELECT id FROM sheffield.ways_clean_vertices_pgr WHERE ST_Equals(the_geom, i.target_node)) AS target_node_id
		FROM sheffield.batch_items i
		WHERE i.batch_id = batchId
	LOOP
		BEGIN
			--3.1 Walk to the bike path
			subGroupId := nextval('sheffield.batch_run_res_sub_group_id_seq');
			
			walktostartlinestring := ST_SetSRID(ST_MakeLine(rec.source, rec.source_node), 27700);
			walktostartspeed := (SELECT urban_speed FROM sheffield.ways_config WHERE type = 'walk' AND name = 'steps'); --Assume the terrain is "difficult", garden, house etc
			walktostartlength := ST_Length(walktostartlinestring);
			
			walktostartcost := sheffield.calculateCost(walktostartlength, walktostartspeed :: smallint, 0 :: smallint, false, false);
			walktostartcosttime := sheffield.calculateTimeCost(walktostartlength, walktostartspeed :: smallint);
			walktostartcostmet := sheffield.getmetcost('met_17250', walktostartcosttime);
			
			INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, sub_group_id, group_id, group_description, mode, mode_filter, sub_mode_filter,
				itemsource, itemtarget, 
				resseq, resnodeid, resedgeid, rescost, resdelay,  
				virtual_time_cost, virtual_met_cost, virtual_length_m, virtual_built_up,
				resgeom, resstreetname, batch_item_description)
			VALUES (runId, rec.id, subGroupId, rec.group_id, '3.1 cycle', 'walk', 3, 4,
				rec.source, rec.target, 
				0, -1, -1, walktostartcost, walkdelay, 
				walktostartcosttime, walktostartcostmet, walktostartlength, false,	
				walktostartlinestring, NULL, rec.description);
			
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE '3.1 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
				INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, group_id, mode, sub_mode_filter,
					itemsource, itemtarget,  
					errmsg, batch_item_description)
				SELECT runId, rec.id, rec.group_id, 'walk', 3, 4,
					rec.source, rec.target, 
					 SQLERRM, rec.description;
		END;
		
		BEGIN
			--3.2 Bike to the destination
			subGroupId := nextval('sheffield.batch_run_res_sub_group_id_seq');
			
			INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, sub_group_id, group_id, group_description, mode, mode_filter, sub_mode_filter,
				itemsource, itemtarget, 
				resseq, resnodeid, resedgeid, rescost, resdelay, 
				resgeom, resstreetname, batch_item_description)
			SELECT runId, rec.id, subGroupId, rec.group_id, '3.2 cycle', 'cycle', 3, 3,
				rec.source, rec.target, 
				trsp.seq, trsp.id1, trsp.id2, trsp.cost, cycledelay, 
				w.geom, w.name, rec.description
			FROM pgr_trsp(
        		'SELECT id, source, target, cycle_cost AS cost, cycle_reverse_cost AS reverse_cost FROM sheffield.ways_clean',
    			rec.source_node_id :: int4, rec.target_node_id :: int4,
        		true, true,
        		'SELECT to_cost, target_id, via_path FROM sheffield.vw_bicycle_restrictions'
			) AS trsp
			LEFT JOIN sheffield.ways_clean w ON trsp.id2 = w.id;
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE '3.2 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
				INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, group_id, mode, mode_filter, sub_mode_filter,
					itemsource, itemtarget,  
					errmsg, batch_item_description)
				SELECT runId, rec.id, rec.group_id, 'cycle', 3, 3,
					rec.source, rec.target, 
					 SQLERRM, rec.description;
		END;

		BEGIN
			--3.3 Walk off the network to target
			subGroupId := nextval('sheffield.batch_run_res_sub_group_id_seq');
			
			walktoendlinestring := ST_SetSRID(ST_MakeLine(rec.target_node, rec.target), 27700);
			walktoendspeed := (SELECT urban_speed FROM sheffield.ways_config WHERE type = 'walk' AND name = 'steps'); --Assume the terrain is "difficult", garden, house etc
			walktoendlength := ST_Length(walktoendlinestring);
			
			walktoendcost := sheffield.calculateCost(walktoendlength, walktoendspeed :: smallint, 0 :: smallint, false, false);
			walktoendcosttime := sheffield.calculateTimeCost(walktoendlength, walktoendspeed :: smallint);
			walktoendcostmet := sheffield.getmetcost('met_17250', walktoendcosttime);
			
			INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, sub_group_id, group_id, group_description, mode, mode_filter, sub_mode_filter,
				itemsource, itemtarget, 
				resseq, resnodeid, resedgeid, rescost, resdelay, 
				virtual_time_cost, virtual_met_cost, virtual_length_m, virtual_built_up,
				resgeom, resstreetname, batch_item_description)
			VALUES (runId, rec.id, subGroupId, rec.group_id, '3.3 cycle', 'walk', 3, 4,
				rec.source, rec.target, 
				0, -1, -1, walktoendcost, walkdelay, 
				walktoendcosttime, walktoendcostmet, walktoendlength, false,	
				walktoendlinestring, NULL, rec.description);	
				
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE '3.3 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
				INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, group_id, mode, mode_filter, sub_mode_filter,
					itemsource, itemtarget,  
					errmsg, batch_item_description)
				SELECT runId, rec.id, rec.group_id, 'walk', 3, 4,
					rec.source, rec.target, 
					 SQLERRM, rec.description;
		END;


	END LOOP;		

	RAISE NOTICE '4.0 Walk to the destination';
	FOR rec IN
		SELECT i.id, 
			nextval('sheffield.batch_run_res_group_id_seq') As group_id,
			i.source, 
			i.target,
			i.source_node,
			i.target_node,
			i.description,
			(SELECT id FROM sheffield.ways_clean_vertices_pgr WHERE ST_Equals(the_geom, i.source_node)) AS source_node_id,
			(SELECT id FROM sheffield.ways_clean_vertices_pgr WHERE ST_Equals(the_geom, i.target_node)) AS target_node_id
		FROM sheffield.batch_items i
		WHERE i.batch_id = batchId
	LOOP
		BEGIN
			--4.1 Walk to the path
			subGroupId := nextval('sheffield.batch_run_res_sub_group_id_seq');
			
			walktostartlinestring := ST_SetSRID(ST_MakeLine(rec.source, rec.source_node), 27700);
			walktostartspeed := (SELECT urban_speed FROM sheffield.ways_config WHERE type = 'walk' AND name = 'steps'); --Assume the terrain is "difficult", garden, house etc
			walktostartlength := ST_Length(walktostartlinestring);
			
			walktostartcost := sheffield.calculateCost(walktostartlength, walktostartspeed :: smallint, 0 :: smallint, false, false);
			walktostartcosttime := sheffield.calculateTimeCost(walktostartlength, walktostartspeed :: smallint);
			walktostartcostmet := sheffield.getmetcost('met_17250', walktostartcosttime);
			
			INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, sub_group_id, group_id, group_description, mode, mode_filter, sub_mode_filter,
				itemsource, itemtarget,  
				resseq, resnodeid, resedgeid, rescost, resdelay,  
				virtual_time_cost, virtual_met_cost, virtual_length_m, virtual_built_up,
				resgeom, resstreetname, batch_item_description)
			VALUES (runId, rec.id, subGroupId, rec.group_id, '4.1 walk', 'walk', 4, 4,
				rec.source, rec.target, 
				0, -1, -1, walktostartcost, walkdelay, 
				walktostartcosttime, walktostartcostmet, walktostartlength, false,	
				walktostartlinestring, NULL, rec.description);
						
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE '4.1 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
				INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, group_id, mode, mode_filter, sub_mode_filter,
					itemsource, itemtarget, 
					errmsg, batch_item_description)
				SELECT runId, rec.id, rec.group_id, 'walk', 4, 4,
					rec.source, rec.target, 
					 SQLERRM, rec.description;
		END;
		
		BEGIN
			--4.2 Walk to the destination
			subGroupId := nextval('sheffield.batch_run_res_sub_group_id_seq');
			
			INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, sub_group_id, group_id, group_description, mode, mode_filter, sub_mode_filter,
				itemsource, itemtarget, 
				resseq, resnodeid, resedgeid, rescost, resdelay, 
				resgeom, resstreetname, batch_item_description)
			SELECT runId, rec.id, subGroupId, rec.group_id, '4.2 walk', 'walk', 4, 4,
				rec.source, rec.target, 
				trsp.seq, trsp.id1, trsp.id2, trsp.cost, walkdelay, 
				w.geom, w.name, rec.description
			FROM pgr_trsp(
        		'SELECT id, source, target, walk_cost AS cost, walk_reverse_cost AS reverse_cost FROM sheffield.ways_clean',
			rec.source_node_id :: int4, rec.target_node_id :: int4,
        		true, true
			) AS trsp
			LEFT JOIN sheffield.ways_clean w ON trsp.id2 = w.id;
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE '4.2 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
				INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, group_id, mode, mode_filter, sub_mode_filter,
					itemsource, itemtarget, 
					errmsg, batch_item_description)
				SELECT runId, rec.id, rec.group_id, 'walk', 4, 4,
					rec.source, rec.target, 
					 SQLERRM, rec.description;
		END;
		
		BEGIN
			--4.3 Walk off the network to target
			subGroupId := nextval('sheffield.batch_run_res_sub_group_id_seq');
						
			walktoendlinestring := ST_SetSRID(ST_MakeLine(rec.target_node, rec.target), 27700);
			walktoendspeed := (SELECT urban_speed FROM sheffield.ways_config WHERE type = 'walk' AND name = 'steps'); --Assume the terrain is "difficult", garden, house etc
			walktoendlength := ST_Length(walktoendlinestring);
			
			walktoendcost := sheffield.calculateCost(walktoendlength, walktoendspeed :: smallint, 0 :: smallint, false, false);
			walktoendcosttime := sheffield.calculateTimeCost(walktoendlength, walktoendspeed :: smallint);
			walktoendcostmet := sheffield.getmetcost('met_17250', walktoendcosttime);
			
			INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, sub_group_id, group_id, group_description, mode, mode_filter, sub_mode_filter,
				itemsource, itemtarget, 
				resseq, resnodeid, resedgeid, rescost, resdelay, 
				virtual_time_cost, virtual_met_cost, virtual_length_m, virtual_built_up,
				resgeom, resstreetname, batch_item_description)
			VALUES (runId, rec.id, subGroupId, rec.group_id, '4.3 walk', 'walk', 4, 4,
				rec.source, rec.target, 
				0, -1, -1, walktoendcost, walkdelay, 
				walktoendcosttime, walktoendcostmet, walktoendlength, false,	
				walktoendlinestring, NULL, rec.description);
			
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE '4.3 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
				INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, group_id, mode, mode_filter, sub_mode_filter,
					itemsource, itemtarget,  
					errmsg, batch_item_description)
				SELECT runId, rec.id, rec.group_id, 'walk', 4, 4,
					rec.source, rec.target, 
					 SQLERRM, rec.description;
		END;

	END LOOP;	
	
	
	RAISE NOTICE '6.0 Public transport routing';

	--Keep track of the splits to the ways network
	CREATE TEMPORARY TABLE tmp_sources (id integer, public_transport_route_id integer, source_public_transport_stop_id integer, stop_time time without time zone, 
		vehicle_journey_code character varying, source integer, geom geometry(Point, 27700), way geometry(LineString, 27700), distance double precision);
		
	CREATE TEMPORARY TABLE tmp_routes (source integer, source_stop_time time without time zone, source_journey_code character varying, source_geom geometry(Point, 27700), source_way geometry(LineString, 27700),
		target integer, target_stop_time time without time zone, target_journey_code character varying, target_geom geometry(Point, 27700), target_way geometry(LineString, 27700));

	CREATE TEMPORARY TABLE tmp_result (id integer, source_geom geometry(Point, 27700), target_geom geometry(Point, 27700), 
		group_description varchar, mode varchar, itemsource integer, itemtarget integer, itemsourcepos double precision, itemtargetpos double precision,
		resseq integer, resnodeid bigint, resedgeid bigint, rescost double precision, resaggcost double precision, resgeom geometry(LineString, 27700), resstreetname varchar,
		source_way geometry(LineString, 27700), target_way geometry(LineString, 27700));

	CREATE TEMPORARY TABLE tmp_final (LIKE tmp_result);

	--Get a few settings
	ptDistanceReq := sheffield.getFloatSetting('public_transport_distance_requirement');
	ptSourceStopLimit := sheffield.getIntegerSetting('public_transport_source_stop_limit');
	ptTargetStopLimit := sheffield.getIntegerSetting('public_transport_target_stop_limit');
	ptMaxCostLimit := sheffield.getIntegerSetting('public_transport_max_cost_limit');
	ptRouteDirTolerance := sheffield.getIntegerSetting('public_transport_route_direction_tolerance');
		
	--Now loop through the batch items and solve paths
	FOR rec IN
		SELECT i.id, 
			nextval('sheffield.batch_run_res_group_id_seq') As group_id,
			i.source, 
			i.target,
			i.source_node,
			i.target_node,
			i.description,
			(SELECT id FROM sheffield.ways_clean_vertices_pgr WHERE ST_Equals(the_geom, i.source_node)) AS source_node_id,
			(SELECT id FROM sheffield.ways_clean_vertices_pgr WHERE ST_Equals(the_geom, i.target_node)) AS target_node_id,
			i.import_census_id
		FROM sheffield.batch_items i
		WHERE i.batch_id = batchId
	LOOP
		BEGIN
			RAISE NOTICE 'Processing % %', rec.id, rec.description;
			
			--Ensure temporary tables are clean
			DELETE FROM tmp_sources;
			DELETE FROM tmp_routes;
			DELETE FROM tmp_result;
			DELETE FROM tmp_final;
			
			--What is the general direction of travel?
			--We don't want to include routes going the opposite direction
			ptRouteTravelDirection := degrees(ST_Azimuth(rec.source, rec.target));

			--A guesstimate of how long the journey would take in order to filter out any stupidly short journey times.
			--These may come about because two vehicle journeys may intersect along their route, but not at the destination.
			--Use a straight line, instead of the actual network, and a simple 20kmh speed. Public transport would not be able to travel 
			--in a straight line, and also has to stop to collect/drop off passengers.
			--Using this rule of thumb filters out any stupidly short transfers.
 			ptRouteTimeFilter := sheffield.calculateTimeCost(ST_Length(ST_MakeLine(rec.source, rec.target)), sheffield.getIntegerSetting('public_transport_direct_speed_limit') :: smallint);

			SELECT SUM(COALESCE(r.rescost, 0)) INTO ptRouteTimeFilter
			FROM sheffield.batch_run_res r
			LEFT JOIN sheffield.batch_items i ON i.id = r.batch_item_id
			WHERE r.mode_filter = 6 
			AND r.sub_mode_filter = 6
			AND i.import_census_id = rec.import_census_id;
			
			--Get the closest public transport stops to the start point
			WITH x AS 
			(
				SELECT s.id, s.cluster_id, s.geom, s.name, s.type, s.naptan,
					ST_Distance(s.geom, rec.source) AS stop_distance
				FROM sheffield.public_transport_stops s
				WHERE ST_DWithin(s.geom, rec.source, 1000) = true
				ORDER BY s.import_geom <-> rec.source
				LIMIT ptSourceStopLimit
			)
			INSERT INTO tmp_sources (id, public_transport_route_id, source_public_transport_stop_id, stop_time, vehicle_journey_code, source, geom, way, distance)
			SELECT t.id, t.public_transport_route_id, t.source_public_transport_stop_id, t.stop_time, t.vehicle_journey_code, t.source, s.geom, t.geom, x.stop_distance
			FROM sheffield.public_transport_route_times t
			JOIN sheffield.public_transport_stops s ON s.id = t.source_public_transport_stop_id 
			JOIN x ON x.id = t.source_public_transport_stop_id 
			WHERE t.transport_mode IN ('bus', 'train', 'tram')
			AND (t.stop_time > ptRouteStartTime AND t.stop_time < ptRouteEndTime)
			AND sheffield.isAngleWithinTolerence(t.route_direction :: integer, ptRouteTravelDirection :: integer, ptRouteDirTolerance)
			ORDER BY x.stop_distance, t.stop_time
			LIMIT ptSourceStopLimit;
			
			--Check that a bus stop near the start has been found
			SELECT COUNT(1) INTO ptSourceStopCount FROM tmp_sources;
			
			IF ptSourceStopCount = 0 THEN
				RAISE NOTICE '6.0 % % No public transport stops found near the source', rec.id, rec.description;
				INSERT INTO sheffield.batch_run_res 
				(batch_run_id, batch_item_id, group_id, mode, mode_filter, sub_mode_filter,	itemsource, itemtarget, errmsg, batch_item_description)
				SELECT runId, rec.id, rec.group_id, 'public transport', 6, 6, rec.source, rec.target, '6.0 No public transport stops found near the source', rec.description;
			ELSE
				--Now get the closest public transport stop to the target that you can get to either directly or with transport changes
				WITH x AS 
				(
					SELECT s.id, s.cluster_id, s.geom, s.name, s.type, s.naptan, 
						ST_Distance(s.geom, rec.target) AS stop_distance
					FROM sheffield.public_transport_stops s
					WHERE ST_DWithin(s.geom, rec.target, 1000) = true
					ORDER BY s.import_geom <-> rec.target
					LIMIT ptTargetStopLimit
				), 
				y AS (
					SELECT DISTINCT l.lvl, v.id, v.public_transport_route_id, v.source_public_transport_stop_id, v.stop_time, v.source, v.geom, v.way, v.distance, l.parent_vehicle_journey_code, l.vehicle_journey_code 
					FROM tmp_sources v 
					LEFT JOIN sheffield.public_transport_links2 l ON l.parent_vehicle_journey_code = v.vehicle_journey_code
				)
				INSERT INTO tmp_routes (source_distance, target_distance, overall_distance, source_stop_time, target_stop_time, overall_time, source, source_journey_code, source_geom, source_way, target, target_journey_code, target_geom, target_way)
				SELECT y.distance, x.stop_distance, (x.stop_distance + y.distance), y.stop_time AS source_stop_time, 
					t.stop_time, (t.stop_time - y.stop_time), y.source, y.parent_vehicle_journey_code AS source_journey_code, y.geom AS source_geom, y.way AS source_way,
					t.target, t.vehicle_journey_code AS target_journey_code, s.geom AS target_geom, t.geom As target_way
				FROM sheffield.public_transport_route_times t
				JOIN sheffield.public_transport_stops s ON s.id = t.target_public_transport_stop_id
				JOIN x ON x.id = t.target_public_transport_stop_id
				LEFT JOIN y ON t.vehicle_journey_code = y.vehicle_journey_code
				WHERE t.transport_mode IN ('bus', 'train', 'tram')
				AND (t.stop_time > ptRouteStartTime AND t.stop_time < ptRouteEndTime)
				AND t.stop_time > y.stop_time + ((ptRouteTimeFilter - 300) * '1 second' :: interval) --(4500 * '1 second' :: interval) --No stupidly short times please 
				AND sheffield.isAngleWithinTolerence(t.route_direction :: integer, ptRouteTravelDirection :: integer, ptRouteDirTolerance)
				ORDER BY
					--For changes add an extra 300 seconds (5 minutes)
					--Add the Euclidean distances to the source and target stops together and work out time in seconds moving 1m/s
					--Add the difference between source and target stop times in seconds
					((y.lvl * 300) + ((x.stop_distance + y.distance) / 3600) + (extract(epoch from (t.stop_time - y.stop_time)) :: double precision))
				LIMIT ptTargetStopLimit;
				--Check that a bus stop near the start has been found
				SELECT COUNT(1) INTO ptTargetStopCount FROM tmp_routes;
				
				IF ptTargetStopCount = 0 THEN
					RAISE NOTICE '6.0 % % No potential public transport routes found', rec.id, rec.description;
					INSERT INTO sheffield.batch_run_res 
					(batch_run_id, batch_item_id, group_id, mode, mode_filter, sub_mode_filter, itemsource, itemtarget,  errmsg, batch_item_description)
					SELECT runId, rec.id, rec.group_id, 'public transport', 6, 6, rec.source, rec.target, '6.0 No potential public transport routes found', rec.description;
				ELSE

					--Now loop through these potential spatial/temporal source and targets 
					--in order to find the shortest route where the route has been travelled forwards only
					--(in this network, the direction of travel also relates to time, reversing the route is to travel back in time!)
					FOR rec2 IN
						SELECT * FROM tmp_routes
					LOOP	
						DELETE FROM tmp_result;
						
						--Mimmic the details stored with the pgr_trsp function and store in a temporary table
						--Then check to see if the total aggregate cost < 1000000 (so that it links correctly between public transport changes) 
						--If so, we're good to go. Break out the loop and run the other queries. Otherwise, repeat with the next candidate in this loop.
						--TODO refactor to remove way and position, no longer needed
						INSERT INTO tmp_result (id, source_geom, target_geom, group_description, mode,
							itemsource, itemtarget, itemsourcepos, itemtargetpos, 
							resseq, resnodeid, resedgeid, rescost, resaggcost,
							resgeom, resstreetname, source_way, target_way)
						SELECT nextval('sheffield.batch_run_res_id_seq'), rec2.source_geom, rec2.target_geom, '6.3 public transport', t.transport_mode, --No subGroupId at this stage
							t.source, t.target, 1.0, 1.0, --Start and end ways (edges) for this section not used 
							r.seq, r.node, r.edge, r.cost, r.agg_cost, 
							t.geom, stop_time :: varchar || ' (' || t.line_name || ') ' || t.source_stop_name,
							rec2.source_way, rec2.target_way
						FROM pgr_dijkstra(
							'SELECT id, source, target, cost, reverse_cost FROM sheffield.public_transport_route_times',
							rec2.source, rec2.target
							, true
						) AS r
						LEFT JOIN sheffield.public_transport_route_times t ON r.edge = t.id;

						--Previous route created?
						SELECT Count(1) INTO ptFinalCount FROM tmp_final;

						IF ptFinalCount > 1 THEN
							--No error message, and not the the first run through, so compare with the next route					
							SELECT SUM(rescost) INTO ptFinalMaxAggCost FROM tmp_final;
						ELSE
							--Just a big cost, hopefully beaten by this first run though
							ptFinalMaxAggCost := 99999999999;
						END IF;
						
						SELECT SUM(rescost) INTO ptMaxAggCost FROM tmp_result;

						RAISE NOTICE '%: % % to % % costs %', rec.description, rec2.source_journey_code, rec2.source_stop_time, rec2.target_journey_code, rec2.target_stop_time, ptMaxAggCost;

						IF ptMaxAggCost < 7200 AND ptMaxAggCost < ptFinalMaxAggCost THEN
							DELETE FROM tmp_final;

							INSERT INTO tmp_final
							SELECT * FROM tmp_result;
						END IF;
						
					END LOOP;
				END IF;	
			END IF;
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE '6.0 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
				INSERT INTO sheffield.batch_run_res 
				(batch_run_id, batch_item_id, group_id, mode, mode_filter, sub_mode_filter, itemsource, itemtarget, errmsg)
				SELECT runId, rec.id, rec.group_id, 'public transport', 6, 6, rec.source, rec.target, SQLERRM;
		END;

		IF ptSourceStopCount > 0 AND ptTargetStopCount > 0 THEN
			IF ptFinalCount = 0 THEN
				--Don't bother running any of this lot if we couldn't find a suitable start and end point 
				RAISE NOTICE '6.0 % % No potential public transport routes found with low cost', rec.id, rec.description;
				INSERT INTO sheffield.batch_run_res 
				(batch_run_id, batch_item_id, group_id, mode, mode_filter, sub_mode_filter, itemsource, itemtarget,  errmsg, batch_item_description)
				SELECT runId, rec.id, rec.group_id, 'public transport', 6, 6, rec.source, rec.target, '6.0 No potential public transport routes found with low cost', rec.description;
			ELSE
				BEGIN
					--6.1 Walk to the path
					subGroupId := nextval('sheffield.batch_run_res_sub_group_id_seq');
					
					walktostartlinestring := ST_SetSRID(ST_MakeLine(rec.source, rec.source_node), 27700);
					walktostartspeed := (SELECT urban_speed FROM sheffield.ways_config WHERE type = 'walk' AND name = 'steps'); --Assume the terrain is "difficult", garden, house etc
					walktostartlength := ST_Length(walktostartlinestring);
					
					walktostartcost := sheffield.calculateCost(walktostartlength, walktostartspeed :: smallint, 0 :: smallint, false, false);
					walktostartcosttime := sheffield.calculateTimeCost(walktostartlength, walktostartspeed :: smallint);
					walktostartcostmet := sheffield.getmetcost('met_17250', walktostartcosttime);
					
					INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, sub_group_id, group_id, group_description, mode, mode_filter, sub_mode_filter,
						itemsource, itemtarget,  resseq, resnodeid, resedgeid, rescost, resdelay,  
						virtual_time_cost, virtual_met_cost, virtual_length_m, virtual_built_up,
						resgeom, resstreetname, batch_item_description)
					VALUES (runId, rec.id, subGroupId, rec.group_id, '6.1 walk', 'walk', 6, 4,
						rec.source, rec.target, 0, -1, -1, walktostartcost, walkdelay, 
						walktostartcosttime, walktostartcostmet, walktostartlength, false,	
						walktostartlinestring, NULL, rec.description);
								
				EXCEPTION
					WHEN OTHERS THEN
						RAISE NOTICE '6.1 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
						INSERT INTO sheffield.batch_run_res 
						(batch_run_id, batch_item_id, group_id, mode, mode_filter, sub_mode_filter, itemsource, itemtarget, errmsg, batch_item_description)
						SELECT runId, rec.id, rec.group_id, 'walk', 6, 4, rec.source, rec.target, SQLERRM, rec.description;
				END;

				BEGIN
					--6.2 Walk to the bus stop
					subGroupId := nextval('sheffield.batch_run_res_sub_group_id_seq');

					--Get the_geom from ways_clean_vertices_pgr where the source bus stop spatially intersects
					SELECT t.source_geom INTO busRouteSourceBusStop
					FROM tmp_final t
					LIMIT 1;
					
					SELECT id INTO busRouteSourceId
					FROM sheffield.ways_clean_vertices_pgr
					WHERE ST_Equals(the_geom, busRouteSourceBusStop);
					
					INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, sub_group_id, group_id, group_description, mode, mode_filter, sub_mode_filter,
						itemsource, itemtarget,  resseq, resnodeid, resedgeid, rescost, resdelay, 
						resgeom, resstreetname, batch_item_description)
					SELECT runId, rec.id, subGroupId, rec.group_id, '6.2 walk', 'walk', 6, 4,
						rec.source, rec.target, trsp.seq, trsp.id1, trsp.id2, trsp.cost, walkdelay, 
						w.geom, w.name, rec.description
					FROM pgr_trsp(
						'SELECT id, source, target, walk_cost AS cost, walk_reverse_cost AS reverse_cost FROM sheffield.ways_clean',
						rec.source_node_id :: int4, busRouteSourceId :: int4, true, true
					) AS trsp
					LEFT JOIN sheffield.ways_clean w ON trsp.id2 = w.id;
				EXCEPTION
					WHEN OTHERS THEN
						RAISE NOTICE '6.2 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
						INSERT INTO sheffield.batch_run_res 
						(batch_run_id, batch_item_id, group_id, mode, mode_filter, sub_mode_filter, itemsource, itemtarget, errmsg, batch_item_description)
						SELECT runId, rec.id, rec.group_id, 'walk', 6, 4, rec.source, rec.target, SQLERRM, rec.description;
				END;

				BEGIN 
					--6.3 Multimodal transport, Add the previously created route
					subGroupId := nextval('sheffield.batch_run_res_sub_group_id_seq');
					
					INSERT INTO sheffield.batch_run_res (
						id, batch_run_id, batch_item_id, sub_group_id, group_id, group_description, mode, mode_filter, sub_mode_filter,
								itemsource, itemtarget, resseq, resnodeid, resedgeid, rescost, resdelay,  
								resgeom, resstreetname, batch_item_description)
					SELECT id, runId, rec.id, subGroupId, rec.group_id, '6.3 public transport', t.mode, 6, 6, 
								rec.source, rec.target, t.resseq, t.resnodeid, t.resedgeid, t.rescost, busdelay,
								t.resgeom, t.resstreetname, rec.description
					FROM tmp_final t;

				EXCEPTION

				
					WHEN OTHERS THEN
						RAISE NOTICE '6.3 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
						INSERT INTO sheffield.batch_run_res 
						(batch_run_id, batch_item_id, group_id, mode, mode_filter, sub_mode_filter,	itemsource, itemtarget,  errmsg, batch_item_description)
						SELECT runId, rec.id, rec.group_id, 'public transport', 6, 6, rec.source, rec.target, SQLERRM, rec.description;
				END;

				BEGIN
					--6.4 Walk from the bus stop to the target
					subGroupId := nextval('sheffield.batch_run_res_sub_group_id_seq');

					--Get the_geom from ways_clean_vertices_pgr where the target bus stop spatially intersects
					SELECT t.target_geom INTO busRouteTargetBusStop
					FROM tmp_final t
					LIMIT 1;
					
					SELECT id INTO busRouteTargetId
					FROM sheffield.ways_clean_vertices_pgr
					WHERE ST_Equals(the_geom, busRouteTargetBusStop);
					
					INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, sub_group_id, group_id, group_description, mode, mode_filter, sub_mode_filter,
						itemsource, itemtarget, resseq, resnodeid, resedgeid, rescost, resdelay, 
						resgeom, resstreetname, batch_item_description)
					SELECT runId, rec.id, subGroupId, rec.group_id, '6.4 walk', 'walk', 6, 4,
						rec.source, rec.target, trsp.seq, trsp.id1, trsp.id2, trsp.cost, walkdelay, 
						w.geom, w.name, rec.description
					FROM pgr_trsp(
						'SELECT id, source, target, walk_cost AS cost, walk_reverse_cost AS reverse_cost FROM sheffield.ways_clean',
						busRouteTargetId :: int4, rec.target_node_id :: int4, true, true
					) AS trsp
					LEFT JOIN sheffield.ways_clean w ON trsp.id2 = w.id;
				EXCEPTION
					WHEN OTHERS THEN
						RAISE NOTICE '6.4 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
						INSERT INTO sheffield.batch_run_res 
						(batch_run_id, batch_item_id, group_id, mode, mode_filter, sub_mode_filter, itemsource, itemtarget, errmsg, batch_item_description)
						SELECT runId, rec.id, rec.group_id, 'walk', 6, 4, rec.source, rec.target, SQLERRM, rec.description;
				END;

				BEGIN
					--6.5 Walk off the network to target
					subGroupId := nextval('sheffield.batch_run_res_sub_group_id_seq');
								
					walktoendlinestring := ST_SetSRID(ST_MakeLine(rec.target_node, rec.target), 27700);
					walktoendspeed := (SELECT urban_speed FROM sheffield.ways_config WHERE type = 'walk' AND name = 'steps'); --Assume the terrain is "difficult", garden, house etc
					walktoendlength := ST_Length(walktoendlinestring);
					
					walktoendcost := sheffield.calculateCost(walktoendlength, walktoendspeed :: smallint, 0 :: smallint, false, false);
					walktoendcosttime := sheffield.calculateTimeCost(walktoendlength, walktoendspeed :: smallint);
					walktoendcostmet := sheffield.getmetcost('met_17250', walktoendcosttime);
					
					INSERT INTO sheffield.batch_run_res (batch_run_id, batch_item_id, sub_group_id, group_id, group_description, mode, mode_filter, sub_mode_filter,
						itemsource, itemtarget,  resseq, resnodeid, resedgeid, rescost, resdelay, 
						virtual_time_cost, virtual_met_cost, virtual_length_m, virtual_built_up,
						resgeom, resstreetname, batch_item_description)
					VALUES (runId, rec.id, subGroupId, rec.group_id, '6.5 walk', 'walk', 6, 4,
						rec.source, rec.target, 0, -1, -1, walktoendcost, walkdelay, 
						walktoendcosttime, walktoendcostmet, walktoendlength, false,	
						walktoendlinestring, NULL, rec.description);
					
				EXCEPTION
					WHEN OTHERS THEN
						RAISE NOTICE '6.5 % % % %', rec.id, rec.description, SQLERRM, SQLSTATE;
						INSERT INTO sheffield.batch_run_res 
						(batch_run_id, batch_item_id, group_id, mode, mode_filter, sub_mode_filter, itemsource, itemtarget, errmsg, batch_item_description)
						SELECT runId, rec.id, rec.group_id, 'walk', 6, 4, rec.source, rec.target, SQLERRM, rec.description;
				END;
			END IF;	
		END IF;	
	END LOOP;

	--Tidy up temporary tables
	DROP TABLE tmp_sources;
	DROP TABLE tmp_routes;
	DROP TABLE tmp_result;
	DROP TABLE tmp_final;
	
	--Finally, return the batch_runs.id
	RETURN runId;
END 
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION sheffield.runbatch(integer, integer)
  OWNER TO postgres;

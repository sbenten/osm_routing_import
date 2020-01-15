CREATE FUNCTION setwaycosts() RETURNS boolean
    LANGUAGE plpgsql
    AS $$
/*
Update the road length and transport mode costs

https://wiki.openstreetmap.org/wiki/Key:oneway
List of values
oneway=yes (discouraged alternative: "true", "1")
oneway=no (discouraged alternative: "false", "0")
oneway=-1 (discouraged alternative: "reverse")
oneway=reversible - Roads that alternate between different directions regularly but infrequently
oneway=alternating - Roads that alternate between different directions regularly and often
The semantics of any other value is undefined and the use of other values is discouraged.

Note: The value -1 is only needed when the direction of oneway travel is in the opposite direction of that used when the way was drawn. 
One can avoid this situation by reversing the direction of the drawn way before applying the oneway tag.

Interpretation for routing
The oneway tag can be interpreted (for routing purposes) to the generic system as follows:

oneway=yes to vehicle:backward=no
oneway=-1 to vehicle:forward=no
This assumes that oneway restrictions presumably do not apply to pedestrians. Although unusual, oneway on pedestrian highways (path, footway, track) 
is possible in some countries, for hiking trails for instance (during the high season crowding or for security reasons).
*/
DECLARE 
success boolean := true;
onewaycost float := 0.0;
BEGIN
	BEGIN
		RAISE NOTICE '1. Calculate terrain index';
		
		UPDATE ways_clean SET terrain_index = getFloatSetting('way_terrain_index_road')
		WHERE attrs -> 'surface' in (
			SELECT unnest(string_to_array(replace(rtrim(val, ';'), ' ', ''), ';'))
			FROM settings
			WHERE name = 'way_surface_terrain_road'
		);
		
		UPDATE ways_clean SET terrain_index = getFloatSetting('way_terrain_index_road')
		WHERE attrs -> 'smoothness' in (
			SELECT unnest(string_to_array(replace(rtrim(val, ';'), ' ', ''), ';'))
			FROM settings
			WHERE name = 'way_smoothness_terrain_road'
		);		

		UPDATE ways_clean SET terrain_index = getFloatSetting('way_terrain_index_road')
		WHERE attrs -> 'tracktype' in (
			SELECT unnest(string_to_array(replace(rtrim(val, ';'), ' ', ''), ';'))
			FROM settings
			WHERE name = 'way_tracktype_terrain_road'
		);	

		UPDATE ways_clean SET terrain_index = getFloatSetting('way_terrain_index_fast')
		WHERE attrs -> 'surface' in (
			SELECT unnest(string_to_array(replace(rtrim(val, ';'), ' ', ''), ';'))
			FROM settings
			WHERE name = 'way_surface_terrain_fast'
		);
		
		UPDATE ways_clean SET terrain_index = getFloatSetting('way_terrain_index_fast')
		WHERE attrs -> 'smoothness' in (
			SELECT unnest(string_to_array(replace(rtrim(val, ';'), ' ', ''), ';'))
			FROM settings
			WHERE name = 'way_smoothness_terrain_fast'
		);		

		UPDATE ways_clean SET terrain_index = getFloatSetting('way_terrain_index_fast')
		WHERE attrs -> 'tracktype' in (
			SELECT unnest(string_to_array(replace(rtrim(val, ';'), ' ', ''), ';'))
			FROM settings
			WHERE name = 'way_tracktype_terrain_fast'
		);	
		
		UPDATE ways_clean SET terrain_index = getFloatSetting('way_terrain_index_good')
		WHERE attrs -> 'surface' in (
			SELECT unnest(string_to_array(replace(rtrim(val, ';'), ' ', ''), ';'))
			FROM settings
			WHERE name = 'way_surface_terrain_good'
		);
		
		UPDATE ways_clean SET terrain_index = getFloatSetting('way_terrain_index_good')
		WHERE attrs -> 'smoothness' in (
			SELECT unnest(string_to_array(replace(rtrim(val, ';'), ' ', ''), ';'))
			FROM settings
			WHERE name = 'way_smoothness_terrain_good'
		);		

		UPDATE ways_clean SET terrain_index = getFloatSetting('way_terrain_index_good')
		WHERE attrs -> 'tracktype' in (
			SELECT unnest(string_to_array(replace(rtrim(val, ';'), ' ', ''), ';'))
			FROM settings
			WHERE name = 'way_tracktype_terrain_good'
		);	

		UPDATE ways_clean SET terrain_index = getFloatSetting('way_terrain_index_poor')
		WHERE attrs -> 'surface' in (
			SELECT unnest(string_to_array(replace(rtrim(val, ';'), ' ', ''), ';'))
			FROM settings
			WHERE name = 'way_surface_terrain_poor'
		);
		
		UPDATE ways_clean SET terrain_index = getFloatSetting('way_terrain_index_poor')
		WHERE attrs -> 'smoothness' in (
			SELECT unnest(string_to_array(replace(rtrim(val, ';'), ' ', ''), ';'))
			FROM settings
			WHERE name = 'way_smoothness_terrain_poor'
		);		

		UPDATE ways_clean SET terrain_index = getFloatSetting('way_terrain_index_poor')
		WHERE attrs -> 'tracktype' in (
			SELECT unnest(string_to_array(replace(rtrim(val, ';'), ' ', ''), ';'))
			FROM settings
			WHERE name = 'way_tracktype_terrain_poor'
		);	

	EXCEPTION
		WHEN OTHERS THEN
		RAISE NOTICE '1. % %', SQLERRM, SQLSTATE;
		success := false;
	END;		
	
	BEGIN
		RAISE NOTICE '2. Car costs';
		WITH r AS (
			SELECT c.id, c.name, c.highway, c.terrain_index, 
				ST_Length(geom) AS length_m, --OSGB National Grid with units in meters
				CASE 
					WHEN attrs -> 'junction' = 'roundabout' THEN 1
					WHEN c.attrs -> 'oneway' IN ('yes', 'YES', 'Yes', '1', 'true', 'TRUE', 'True') THEN 1
					WHEN  c.attrs -> 'oneway' = '-1' THEN -1
					ELSE 0 --Two way. Not interested in reversible or alternating at the moment (there's none in import)
				END AS oneway,
				calculatemaxspeed(f.network_speed, f.urban_speed, c.built_up, c.attrs -> 'maxspeed') AS speed,
				NOT c.car_allow AS noentry,
				getWayCurveIndex(c.geom) AS curveIndex
			FROM ways_clean c
			JOIN ways_config f ON c.highway = f.name AND f.type = 'car'
		)
		UPDATE ways_clean c 
			SET length_m = r.length_m,
				curve_index = r.curveIndex,
				car_speed = r.speed,
				car_oneway = r.oneway,
				car_cost = calculateCost(r.length_m, r.speed, r.oneway :: smallint, r.noentry, FALSE, r.curveIndex) * r.terrain_index, 
				car_reverse_cost = calculateCost(r.length_m, r.speed, r.oneway :: smallint, r.noentry, TRUE, r.curveIndex) * r.terrain_index,
				car_cost_time = calculateTimeCost(r.length_m, r.speed, r.curveIndex) * r.terrain_index, 
				car_reverse_cost_time = calculateTimeCost(r.length_m, r.speed, r.curveIndex) * r.terrain_index
		FROM r
		WHERE c.id = r.id;
	EXCEPTION
		WHEN OTHERS THEN
		RAISE NOTICE '2. % %', SQLERRM, SQLSTATE;
		success := false;
	END;

	BEGIN
		RAISE NOTICE '3. Bus costs';
		WITH r AS (
			SELECT c.id, c.name, c.highway, c.terrain_index, 
				ST_Length(geom) AS length_m, 
				CASE 
					WHEN attrs -> 'junction' = 'roundabout' THEN 1
					WHEN c.attrs -> 'oneway:bus' IN ('no', 'No', '0', 'false', 'False', 'FALSE') THEN 0
					WHEN c.attrs -> 'oneway:psv' IN ('no', 'No', '0', 'false', 'False', 'FALSE') THEN 0
					WHEN c.attrs -> 'oneway:bus' IN ('yes', 'YES', 'Yes', '1', 'true', 'TRUE', 'True') THEN 1
					WHEN c.attrs -> 'oneway:psv' IN ('yes', 'YES', 'Yes', '1', 'true', 'TRUE', 'True') THEN 1
					WHEN  c.attrs -> 'oneway:bus' = '-1' THEN -1
					WHEN  c.attrs -> 'oneway:psv' = '-1' THEN -1
					ELSE
						CASE 
							WHEN c.attrs -> 'oneway' IN ('yes', 'YES', 'Yes', '1', 'true', 'TRUE', 'True') THEN 1
							WHEN  c.attrs -> 'oneway' = '-1' THEN -1
							ELSE 0 --Two way. Not interested in reversible or alternating at the moment (there's none in import)
						END 
					END AS oneway,
				calculatemaxspeed(f.network_speed, f.urban_speed, c.built_up, c.attrs -> 'maxspeed') AS speed,
				NOT c.bus_allow AS noentry,
				getWayCurveIndex(c.geom) AS curveIndex
			FROM ways_clean c
			JOIN ways_config f ON c.highway = f.name AND f.type = 'bus'
		)
		UPDATE ways_clean c 
			SET bus_speed = r.speed,
				bus_oneway = r.oneway,
				bus_cost = calculateCost(r.length_m, r.speed, r.oneway :: smallint, r.noentry, false, r.curveIndex) * r.terrain_index, 
				bus_reverse_cost = calculateCost(r.length_m, r.speed, r.oneway :: smallint, r.noentry, true, r.curveIndex) * r.terrain_index,
				bus_cost_time = calculateTimeCost(r.length_m, r.speed, r.curveIndex) * r.terrain_index, 
				bus_reverse_cost_time = calculateTimeCost(r.length_m, r.speed, r.curveIndex) * r.terrain_index
		FROM r
		WHERE c.id = r.id;
	EXCEPTION
		WHEN OTHERS THEN
		RAISE NOTICE '3. % %', SQLERRM, SQLSTATE;
		success := false;
	END;

	BEGIN
		RAISE NOTICE '4. Cycling costs';
		WITH r AS (
			SELECT c.id, c.name, c.highway, c.terrain_index,
				getNaismithLengthM(getFloatSetting('cycle_naismith'), ST_Length(geom), totalascent) AS length_naismith,
				getNaismithLengthM(getFloatSetting('cycle_naismith'), ST_Length(geom), totaldescent) AS reverse_length_naismith,
				CASE 
					WHEN c.attrs -> 'junction' = 'roundabout' THEN 1
					WHEN c.attrs -> 'oneway:bicycle' IN ('no', 'No', '0', 'false', 'False', 'FALSE') THEN 0
					WHEN c.attrs -> 'oneway:bicycle' IN ('yes', 'YES', 'Yes', '1', 'true', 'TRUE', 'True') THEN 1
					WHEN  c.attrs -> 'oneway:bicycle' = '-1' THEN -1
					ELSE
						CASE 
							WHEN c.attrs -> 'oneway' IN ('yes', 'YES', 'Yes', '1', 'true', 'TRUE', 'True') THEN 1
							WHEN  c.attrs -> 'oneway' = '-1' THEN -1
							ELSE 0 --Two way. Not interested in reversible or alternating at the moment (there's none in import)
						END 
					END AS oneway,
				--Overridden max speed does not apply to cycles, only powered vehicles
				--Using it would cause the system to think cycles could travel at, say, 50mph on certain road sections
				calculatemaxspeed(f.network_speed, f.urban_speed, c.built_up, c.attrs -> 'nosuchthing') AS speed,
				NOT c.cycle_allow AS noentry
			FROM ways_clean c
			JOIN ways_config f ON c.highway = f.name AND f.type = 'cycle'
		)
		UPDATE ways_clean c 
			SET cycle_speed = r.speed,
				cycle_oneway = r.oneway,
				cycle_cost = calculateCost(r.length_naismith, r.speed, r.oneway :: smallint, r.noentry, false) * r.terrain_index, 
				cycle_reverse_cost = calculateCost(r.reverse_length_naismith, r.speed, r.oneway :: smallint, r.noentry, true) * r.terrain_index,
				cycle_cost_time = calculateTimeCost(r.length_naismith, r.speed) * r.terrain_index, 
				cycle_reverse_cost_time = calculateTimeCost(r.reverse_length_naismith, r.speed) * r.terrain_index
			FROM r
			WHERE c.id = r.id;
	EXCEPTION
		WHEN OTHERS THEN
		RAISE NOTICE '4. % %', SQLERRM, SQLSTATE;
		success := false;
	END;

	BEGIN
		RAISE NOTICE '5. Walking costs';
		WITH r AS (
			SELECT c.id, c.name, c.highway, c.terrain_index,
				getNaismithLengthM(getFloatSetting('walk_naismith'), ST_Length(geom), totalascent) AS length_naismith,
				getNaismithLengthM(getFloatSetting('walk_naismith'), ST_Length(geom), totaldescent) AS reverse_length_naismith, 
				0 AS oneway,
				--Overridden max speed does not apply to walking, only powered vehicles
				--Using it would cause the system to think walkers could travel at, say, 50mph on certain road sections
				calculatemaxspeed(f.network_speed, f.urban_speed, c.built_up, c.attrs -> 'nosuchthing') AS speed,
				NOT c.walk_allow AS noentry,
				getFloatSetting('walk_naismith') AS naismith
			FROM ways_clean c
			JOIN ways_config f ON c.highway = f.name AND f.type = 'walk'
		)
		UPDATE ways_clean c 
			SET walk_speed = r.speed,
				walk_cost = calculateCost(r.length_naismith, r.speed, r.oneway :: smallint, r.noentry, false) * r.terrain_index, 
				walk_reverse_cost = calculateCost(r.reverse_length_naismith, r.speed, r.oneway :: smallint, r.noentry, true) * r.terrain_index,
				walk_cost_time = calculateTimeCost(r.length_naismith, r.speed) * r.terrain_index, 
				walk_reverse_cost_time = calculateTimeCost(r.reverse_length_naismith, r.speed) * r.terrain_index
		FROM r
		WHERE c.id = r.id;
	EXCEPTION
		WHEN OTHERS THEN
		RAISE NOTICE '5. % %', SQLERRM, SQLSTATE;
		success := false;
	END;

	BEGIN
		RAISE NOTICE '6. Tram costs';
		WITH r AS (
			SELECT c.id, c.name, c.highway, 
				ST_Length(geom) AS length_m, 
				0 AS oneway,
				calculatemaxspeed(f.network_speed, f.urban_speed, c.built_up, c.attrs -> 'maxspeed') AS speed,
				NOT c.tram_allow AS noentry,
				getWayCurveIndex(c.geom) AS curveIndex
			FROM ways_clean c
			JOIN ways_config f ON c.highway = f.name AND f.type = 'tram'
		)
		UPDATE ways_clean c 
			SET tram_speed = r.speed,
				tram_oneway = r.oneway,
				tram_cost = calculateCost(r.length_m, r.speed, r.oneway :: smallint, r.noentry, false, r.curveIndex), 
				tram_reverse_cost = calculateCost(r.length_m, r.speed, r.oneway :: smallint, r.noentry, true, r.curveIndex),
				tram_cost_time = calculateTimeCost(r.length_m, r.speed, r.curveIndex), 
				tram_reverse_cost_time = calculateTimeCost(r.length_m, r.speed, r.curveIndex)
		FROM r
		WHERE c.id = r.id;
	EXCEPTION
		WHEN OTHERS THEN
		RAISE NOTICE '6. % %', SQLERRM, SQLSTATE;
		success := false;
	END;

	BEGIN
		RAISE NOTICE '7. Train costs';
		WITH r AS (
			SELECT c.id, c.name, c.highway, 
				ST_Length(geom) AS length_m, 
				0 AS oneway,
				calculatemaxspeed(f.network_speed, f.urban_speed, c.built_up, c.attrs -> 'maxspeed') AS speed,
				NOT c.train_allow AS noentry,
				getWayCurveIndex(c.geom) AS curveIndex
			FROM ways_clean c
			JOIN ways_config f ON c.highway = f.name AND f.type = 'train'
		)
		UPDATE ways_clean c 
			SET train_speed = r.speed,
				train_oneway = r.oneway,
				train_cost = calculateCost(r.length_m, r.speed, r.oneway :: smallint, r.noentry, false, r.curveIndex), 
				train_reverse_cost = calculateCost(r.length_m, r.speed, r.oneway :: smallint, r.noentry, true, r.curveIndex),
				train_cost_time = calculateTimeCost(r.length_m, r.speed, r.curveIndex), 
				train_reverse_cost_time = calculateTimeCost(r.length_m, r.speed, r.curveIndex)
		FROM r
		WHERE c.id = r.id;
	EXCEPTION
		WHEN OTHERS THEN
		RAISE NOTICE '7. % %', SQLERRM, SQLSTATE;
		success := false;
	END;

	BEGIN
		RAISE NOTICE '8. Finally, calculate the METs equivalent to travel the network in different modes';
		onewaycost := (SELECT getfloatsetting('one_way_cost'));
		
		UPDATE ways_clean SET
			car_cost_met = 
				CASE 
					WHEN car_cost_time = onewaycost THEN onewaycost
					ELSE (getMetCost('met_16010', car_cost_time))
				END,
			car_reverse_cost_met = 
				CASE 
					WHEN car_reverse_cost_time = onewaycost THEN onewaycost
					ELSE (getMetCost('met_16010', car_reverse_cost_time))
				END,
			bus_cost_met = 
				CASE
					WHEN bus_cost_time = onewaycost THEN onewaycost
					ELSE (getMetCost('met_16016', bus_cost_time))
				END,
			bus_reverse_cost_met = 
				CASE 
					WHEN bus_reverse_cost_time = onewaycost THEN onewaycost
					ELSE (getMetCost('met_16016', bus_reverse_cost_time))
				END,
			tram_cost_met = 
				CASE
					WHEN tram_cost_time = onewaycost THEN onewaycost
					ELSE (getMetCost('met_16016', tram_cost_time))
				END,
			tram_reverse_cost_met = 
				CASE 
					WHEN tram_reverse_cost_time = onewaycost THEN onewaycost
					ELSE (getMetCost('met_16016', tram_reverse_cost_time))
				END,
			train_cost_met = 
				CASE
					WHEN tram_cost_time = onewaycost THEN onewaycost
					ELSE (getMetCost('met_16016', train_cost_time))
				END,
			train_reverse_cost_met = 
				CASE 
					WHEN tram_reverse_cost_time = onewaycost THEN onewaycost
					ELSE (getMetCost('met_16016', train_reverse_cost_time))
				END,
			--Really? No guidance from the Compendium of physical activities on topography affecting the MET cost
			--Just relying on the added increase in time, as I'm assuming no variation in effort on the part of the cyclist
			cycle_cost_met = 
				CASE
					WHEN cycle_cost_time = onewaycost THEN onewaycost
					ELSE (getMetCost('met_01015', cycle_cost_time))
				END,
			cycle_reverse_cost_met = 
				CASE 
					WHEN cycle_reverse_cost_time = onewaycost THEN onewaycost
					ELSE (getMetCost('met_01015', cycle_reverse_cost_time))
				END,
			walk_cost_met = 
				CASE 
					WHEN walk_cost_time = onewaycost THEN onewaycost
					WHEN highway = 'step' THEN (getMetCost('met_17134', walk_cost_time)) --Up steps
					WHEN percentslope < 0 THEN (getMetCost('met_17180', walk_cost_time)) --Downhill
					WHEN percentslope >= 0 AND percentslope < 1 THEN (getMetCost('met_17190', walk_cost_time)) --Flat-ish
					WHEN percentslope >= 1 AND percentslope < 6 THEN (getMetCost('met_17210', walk_cost_time)) --Slightly uphill
					WHEN percentslope >= 6 THEN (getMetCost('met_17211', walk_cost_time)) --Uphill
					ELSE (getMetCost('met_17250', walk_cost_time))
				END,
			walk_reverse_cost_met = 
				CASE 
					WHEN walk_reverse_cost_time = onewaycost THEN onewaycost
					WHEN highway = 'step' THEN (getMetCost('met_17134', walk_reverse_cost_time)) --Up steps
					WHEN reversepercentslope < 0 THEN(getMetCost('met_17180', walk_reverse_cost_time)) --Downhill
					WHEN reversepercentslope >= 0 AND percentslope < 1 THEN (getMetCost('met_17190', walk_reverse_cost_time)) --Flat-ish
					WHEN reversepercentslope >= 1 AND percentslope < 6 THEN (getMetCost('met_17210', walk_reverse_cost_time)) --Slightly uphill
					WHEN reversepercentslope >= 6 THEN (getMetCost('met_17211', walk_reverse_cost_time)) --Uphill
					ELSE (getMetCost('met_17250', walk_reverse_cost_time))
				END;			
	EXCEPTION
		WHEN OTHERS THEN
		RAISE NOTICE '8. % %', SQLERRM, SQLSTATE;
		success := false;
	END;

	RETURN success;
END; 
$$;


ALTER FUNCTION setwaycosts() OWNER TO postgres;
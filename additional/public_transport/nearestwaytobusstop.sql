CREATE FUNCTION nearestwaytobusstop(startpoint public.geometry, tolerence double precision DEFAULT 20) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
/*
Find a segment of the network associated with a bus stop
Look for all edges within a tolerance and look for wider road classifications
*/
DECLARE 
foundId int8;
findBetter boolean := true;
rec record;
i integer := 0;
BEGIN
	FOR rec IN 
		SELECT * FROM (
			SELECT c.geom, c.id, c.highway
			FROM ways_clean c
			WHERE c.bus_Allow = true
			ORDER BY c.geom <-> startPoint
			LIMIT 5
		) x
		WHERE ST_DWithin(startPoint, x.geom, tolerence) 
	LOOP
		--NOTE First time the function needs to store the rec.id, then replace it IF a better road match is found
		IF i = 0 THEN
			foundId = rec.id;
		END IF;
		IF findBetter = true THEN			
			--Will automatically be in distance order, but check for a beter road?
			IF rec.highway NOT IN ('unclassified', 'residential', 'service') THEN
				findBetter := false;
				foundId = rec.id;
			END IF;
		END IF;	
		i := i+1;
		EXIT WHEN findBetter = false;
	END LOOP;
	
	IF foundId IS NULL AND tolerence < 110 THEN
		foundId = nearestwaytobusstop(startPoint, (tolerence + 10));
	END IF;
	RETURN foundId;
END;
$$;


ALTER FUNCTION nearestwaytobusstop(startpoint public.geometry, tolerence double precision) OWNER TO postgres;
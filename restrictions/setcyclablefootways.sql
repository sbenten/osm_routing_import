CREATE FUNCTION setcyclablefootways(dismountlength integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
rec record;
startCount int := 0;
endCount int := 0;
BEGIN
	FOR rec IN 
		SELECT id, geom
		FROM ways_clean
		WHERE cycle_allow = false AND walk_allow = true
		AND length_m <= dismountLength
	LOOP
		startCount := (
			SELECT Count(1)
			FROM ways_clean s
			WHERE s.cycle_allow = true 
			--Touching appears to be faster than using the source, or target column																		
			AND ST_Touches(s.geom, ST_StartPoint(rec.geom))
		);
	
		endCount := (
			SELECT Count(1)
			FROM ways_clean s
			WHERE s.cycle_allow = true 
			AND ST_Touches(s.geom, ST_EndPoint(rec.geom))
		);
		
		IF startCount > 0 AND endCount > 0 THEN
			--Both ends of the footway are touched by a cycleable edge
			UPDATE ways_clean 
			SET cycle_allow = true 
			WHERE id = rec.id;
		END IF;
	
	END LOOP;
END
$$;


ALTER FUNCTION setcyclablefootways(dismountlength integer) OWNER TO postgres;
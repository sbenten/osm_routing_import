CREATE FUNCTION getnaismithlengthm(naismith_m double precision, length_m double precision, ascent_m double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
/*
Calculate the length of an edge according to an equivalent length with Naisnith's rule

naismith_m = Naismith factor for horizontal equivalent of height gained in metres. i.e. 1 meter of height gained in equivalent to 8 meters in horizontal distance.
length_m = Length of the edge in meters.
ascent_m = Height gained in meters.
*/
DECLARE safe_ascent_m float;
BEGIN
	IF ascent_m > 0 THEN
		safe_ascent_m := sqrt(power(ascent_m, 2.0));

		RETURN (naismith_m * safe_ascent_m) + length_m ;
	ELSE
		RETURN length_m;
	END IF;
END; 
$$;


ALTER FUNCTION getnaismithlengthm(naismith_m double precision, length_m double precision, ascent_m double precision) OWNER TO postgres;

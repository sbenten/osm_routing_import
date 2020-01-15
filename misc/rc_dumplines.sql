CREATE FUNCTION rc_dumplines(_a_geom public.geometry) RETURNS SETOF public.geometry_dump
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
	--this function breaks a polygon/geomCollection into lines and return the lines, along with the path
	--NOTE : the path is not complete, because ST_CollectionExtract lose some information (it aggregates every polygon/multipolygon into a multipolygon)
	--the srid is transmitted.
	--Source: https://github.com/Remi-C/PPPP_utilities/blob/master/postgis/rc_DumpLines.sql
DECLARE
	_r record;
	_i int :=0;
	--_srid integer;
BEGIN
	--first, extract lines from polygon
	--second : extract lines from lines
	RETURN QUERY  --returning also all the simple lines
		SELECT path, geom
		FROM ST_Dump(ST_CollectionExtract (_a_geom,2)) AS dp(path, geom);

		FOR _r in SELECT row_number() over() AS id, dp FROM ST_Dump(ST_CollectionExtract (_a_geom,3)) AS dp --looping trough potential multipolygon
			LOOP
			_i:=_i+1;
			RETURN QUERY 
				WITH poly AS( 
					SELECT _r.id, (_r.dp).path AS gpath, (_r.dp).geom AS poly 
				),
				dump AS(
					SELECT ARRAY[id::int,(gpath[1])] AS gpath, (ST_DumpRings(poly)) as dp, ST_SRID(poly) AS srid
					FROM poly
				),
				line AS (
				SELECT 
				CASE 
					WHEN gpath IS NULL THEN ARRAY[(dp).path[1]-1] 
					ELSE ARRAY[gpath[1], (dp).path[1]] END AS path
				,ST_SetSRID( ST_ExteriorRing((dp).geom),srid) AS geom
				FROM dump
			)
			SELECT path,geom
			FROM line 
			WHERE geom  IS NOT NULL;
		END LOOP;--loop on multi polygon
	RETURN;
END;
$$;


ALTER FUNCTION rc_dumplines(_a_geom public.geometry) OWNER TO postgres;
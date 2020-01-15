CREATE FUNCTION rc_split_line_by_points(input_line public.geometry, input_points public.geometry, tolerance double precision DEFAULT 1) RETURNS SETOF public.geometry_dump
    LANGUAGE plpgsql STRICT
    AS $$
	--Splitting (multi)linestring with (multi) points , considering the points are o the line if they are closesr than "tolerance".
	--@param : a (multi)linestring we want to split
	--@param : a (multi) point we want to use to split the line
	--@param : the points are considered to be on the line if closest than this parameter to the line (euclidian distance), default to 1
	--@return : a geometry dump with cut lines along with path so there is no lose of ordering
	--Source: https://github.com/Remi-C/PPPP_utilities/blob/master/postgis/rc_Split_Line_By_Points.sql
DECLARE 
BEGIN
	--pseudo code
	--break multilines into lines and multipoints into point
	RETURN QUERY
		WITH liness AS (
			SELECT  row_number() over() AS line_id, line
			FROM rc_DumpLines(input_line) AS line
		)
		,pointss AS (
			SELECT point AS point, ST_SRID(input_points) AS srid
			FROM ST_DumpPoints(input_points)AS point
		)
		,curv_abses AS (--list all tuple (line, point) where point is close enough to line, and compute curv_absc for each couple, plus non cut lines
			(SELECT line_id,  line, ST_LineLocatePoint((line).geom,ST_SetSRID((point).geom,srid)) AS curv_abs
				FROM liness , pointss 
				WHERE ST_DWithin((line).geom,ST_SetSRID((point).geom,srid),tolerance)=TRUE
				ORDER BY curv_abs ASC)
			UNION -- adding the line which will not be split, but should be outputed without modification anyway.
			(SELECT line_id, line, 0::float as curv_abs 
			FROM liness)
		)
		,grouped_r AS (--group by line, order by curv_abs asc
			SELECT line_id, line, array_agg(curv_abses.curv_abs) AS CurvAbs
			FROM curv_abses
			GROUP BY line_id,line
		),
		cut_lines AS (
		--split line using the ordered curve abs
			SELECT line_id, (line).path AS lpath, rc_split_Simple_line_by_Ordered_Curvilinear_Abscissa(
				input_gdumpline:=line
				,input_CurvAbs:= CurvAbs
				,tolerance:=tolerance
				) AS cl
			FROM grouped_r
		)
		--fill path and return
		SELECT lpath || (cl).path AS path, (cl).geom AS geom
		FROM cut_lines;	

	RETURN;
END;
$$;


ALTER FUNCTION rc_split_line_by_points(input_line public.geometry, input_points public.geometry, tolerance double precision) OWNER TO postgres;
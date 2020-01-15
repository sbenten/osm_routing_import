CREATE FUNCTION rc_split_simple_line_by_ordered_curvilinear_abscissa(input_gdumpline public.geometry_dump, input_curvabs double precision[], tolerance double precision) RETURNS SETOF public.geometry_dump
    LANGUAGE plpgsql STRICT
    AS $$
	--Splitting a simplelinsetring with ordered curvilinear absiss, taking into account a tolerance, returning a meaningfull path
	--@param : a simple linestring in a  geometry dump
	--@param : an array with ascending curvilinear absissa corresponding to the wanted cut points on the line
	--@param : this tolerance parameter gives the min distances under which 2 points are considered to be one
	--@return : a geometry dump with cut lines (at curvilinear absissa) and meaningfull path
	--WARNING : no check on inputs, it should already have been made.
	--pseudo code
		--taking care of precision on CurvAbs array
			--add 0 and 1 to the CurvAbs array if not already there
			--construct a new array removing too close CurvAbs accordig to tolerance parameter
		--cuting
			--for each curvabs, 
				--create  a new line  oing from array[i-1] to array[i] curv abs
			--take care of path 
			--return result
	--Source: https://github.com/Remi-C/PPPP_utilities/blob/master/postgis/rc_Split_Line_By_Points.sql
DECLARE 
res FLOAT[] ;
i INT;
j INT;
temp_f FLOAT;
tolerance_in_CurvAbs FLOAT;
srid int := ST_SRID((input_gdumpline).geom);
BEGIN
	--taking care of precision on CurvAbs array
	--add 0 and 1 to the CurvAbs array if not already there
	IF(input_CurvAbs[1]!=0) THEN
		SELECT array_prepend(0::float, input_CurvAbs) INTO input_CurvAbs ;
	END IF;

	IF(input_CurvAbs[array_length(input_CurvAbs,1)]!=1) THEN
		SELECT array_append( input_CurvAbs,1::float) INTO input_CurvAbs;
	END IF;

	--construct a new array removing too close CurvAbs according to tolerance parameter
	--transposing the tolerance into CurvAbs
	tolerance_in_CurvAbs := LEAST(1,tolerance/ST_Length((input_gdumpline).geom));
	--RAISE NOTICE 'array :% ,  tolerance_in_CurvAbs : %'  ,input_CurvAbs,tolerance_in_CurvAbs;

	--building the new array without values too close
	--adding 0 to result 
	res:= array_append(res,0::FLOAT);
	j:=1;

	--looping : adding values if they are not too close to a previous result or to 1 
	FOREACH temp_f IN ARRAY input_CurvAbs LOOP
		--RAISE NOTICE 'in the loop % % %',temp_f,res,j;
		IF ABS(temp_f-res[j])<tolerance_in_CurvAbs OR  ABS(1-temp_f)<tolerance_in_CurvAbs THEN --needing to skip the value before its too close to previous or to 1
			CONTINUE;
		ELSE --adding the value to result
			j:=j+1;
			res:= array_append(res,temp_f);
		END IF;
	END LOOP;

	--adding 1 to result
	res:= array_append(res,1::FLOAT);
	--RAISE NOTICE 'array filtered :%',res;	

	--cuting
	--for each curvabs, 
	--create  a new line  going from res[i-1] to res[i] curv abs
	FOR j IN 2..array_length(res,1) LOOP
		RETURN QUERY  SELECT ARRAY[j-1] ,ST_SetSRID( ST_LineSubstring((input_gdumpline).geom,res[j-1],res[j]) ,srid);
	END LOOP;

	--take care of path 
	--return result
	RETURN;
	--RETURN rc_DumpLines(input_line);
	END;
$$;


ALTER FUNCTION rc_split_simple_line_by_ordered_curvilinear_abscissa(input_gdumpline public.geometry_dump, input_curvabs double precision[], tolerance double precision) OWNER TO postgres;
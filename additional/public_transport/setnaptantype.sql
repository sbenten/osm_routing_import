CREATE FUNCTION setnaptantype() RETURNS void
    LANGUAGE plpgsql
    AS $$
/*
Convert the three digit codes in the stoptype column to a simple human-readable type
http://naptan.dft.gov.uk/naptan/stopTypes.htm

PARAMS
n/a

RETURNS void
*/
BEGIN
	UPDATE naptan SET type = CASE 
		WHEN stoptype IN ('BCT', 'BCE', 'BCS', 'BCQ') THEN 'bus'
		WHEN stoptype IN ('MET', 'PLT') THEN 'tram'
		WHEN stoptype IN ('RSE', 'RLY', 'RPL') THEN 'train'
		ELSE ''
	END;
END 
$$;


ALTER FUNCTION setnaptantype() OWNER TO postgres;
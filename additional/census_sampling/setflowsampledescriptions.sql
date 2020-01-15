CREATE FUNCTION setflowsampledescriptions() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
rec record;
BEGIN

	RAISE NOTICE 'Setting source descriptions';
	FOR rec IN
		SELECT id, source FROM census_flow_sample WHERE source IS NOT NULL
	LOOP
		UPDATE census_flow_sample SET source_description = (
			SELECT o.name
			FROM os_open_names o 
			ORDER BY o.geom <-> rec.source
			LIMIT 1
		)
		WHERE id = rec.id;		
	END LOOP;

	RAISE NOTICE 'Setting target descriptions';
	FOR rec IN
		SELECT id, target FROM census_flow_sample WHERE target IS NOT NULL
	LOOP
		UPDATE census_flow_sample SET target_description = (
			SELECT o.name
			FROM os_open_names o 
			ORDER BY o.geom <-> rec.target
			LIMIT 1
		)
		WHERE id = rec.id;		
	END LOOP;

END
$$;


ALTER FUNCTION setflowsampledescriptions() OWNER TO postgres;
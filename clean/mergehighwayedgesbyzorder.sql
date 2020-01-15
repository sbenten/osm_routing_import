CREATE FUNCTION mergehighwayedgesbyzorder() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    CREATE TEMPORARY TABLE tmp_ways(
        id integer NOT NULL,
        geom geometry(LineString, 27700),
        osm_id character varying COLLATE pg_catalog."default"
    );

    INSERT INTO tmp_ways(id, geom, osm_id)
    SELECT DISTINCT 
        a.id, a.geom, a.osm_id
    FROM ways_clean AS a
    CROSS JOIN ways_clean AS b
    LEFT JOIN ways AS c ON a.ways_id = c.id 
    LEFT JOIN ways AS d ON b.ways_id = d.id
    WHERE (a.z_order - b.z_order > 9) --Ensure slip roads are not included
    AND a.osm_id != b.osm_id
    AND ST_Touches(a.geom, b.geom)
    AND ST_Crosses(c.geom, d.geom);

    WITH t AS (
        SELECT dumped.osm_id, 
            (dumped.dump_geom).geom AS geom
        FROM (	
            SELECT complex.*, ST_DUMP(complex.geom) AS dump_geom
                FROM (
                    SELECT DISTINCT osm_id, ST_LineMerge(ST_Union(geom)) AS geom FROM tmp_ways GROUP BY osm_id
                ) AS complex
        ) AS dumped	
    )
    , c AS (
        SELECT DISTINCT ways_id, osm_id, name, highway, z_order, attrs FROM ways_clean
    )
    INSERT INTO ways_clean (ways_id, geom, osm_id, name, highway, z_order, attrs)
    SELECT c.ways_id, t.geom, c.osm_id, c.name, c.highway, c.z_order, c.attrs
    FROM t, c
    WHERE c.osm_id = t.osm_id;

    DELETE FROM ways_clean WHERE id IN (SELECT id FROM tmp_ways);
    DROP TABLE tmp_ways;

END
$$;


ALTER FUNCTION mergehighwayedgesbyzorder() OWNER TO postgres;
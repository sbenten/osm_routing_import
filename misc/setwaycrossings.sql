CREATE FUNCTION setwaycrossings() RETURNS void
    LANGUAGE plpgsql
    AS $$
/*
--The XML structure contains optional information (see examples below) so several passes are the simplest approach to getting all the information

<node id="1319878382" visible="true" version="2" changeset="25715447" timestamp="2014-09-27T23:08:06Z" user="Paul Berry" uid="1802093" lat="53.3718129" lon="-1.4767803">
<tag k="highway" v="traffic_signals"/>
</node>
<node id="260098123" visible="true" version="3" changeset="12879948" timestamp="2012-08-27T14:14:48Z" user="Meersbrook" uid="412560" lat="53.3727238" lon="-1.4839613">
<tag k="highway" v="traffic_signals"/>
</node>
  <node id="21026975" lat="53.3825434" lon="-1.4842486" version="7" timestamp="2012-08-28T08:21:48Z" changeset="12889020" uid="412560" user="Meersbrook">
    <tag k="crossing" v="traffic_signals"/>
    <tag k="crossing_ref" v="zebra"/>
    <tag k="highway" v="traffic_signals"/>
  </node>
  <node id="418989" lat="53.4929744" lon="-1.2584597" version="7" timestamp="2014-11-21T16:18:56Z" changeset="26931906" uid="86286" user="Mark Pokorny">
    <tag k="railway" v="level_crossing"/>
  </node>
  <node id="21027063" lat="53.3815232" lon="-1.4839407" version="8" timestamp="2017-04-29T09:56:58Z" changeset="48250923" uid="141442" user="CycleStreets">
    <tag k="highway" v="crossing"/>
  </node>
    <node id="1150827938" lat="53.3729746" lon="-1.4797167" version="2" timestamp="2014-09-27T23:08:06Z" changeset="25715447" uid="1802093" user="Paul Berry">
    <tag k="crossing" v="zebra"/>
    <tag k="highway" v="crossing"/>
  </node>
  <node id="1150827938" lat="53.3729746" lon="-1.4797167" version="2" timestamp="2014-09-27T23:08:06Z" changeset="25715447" uid="1802093" user="Paul Berry">
    <tag k="crossing" v="zebra"/>
    <tag k="highway" v="crossing"/>
  </node>
 */
 
BEGIN

	RAISE NOTICE '1. Insert those flagged as traffic signals';
	INSERT INTO way_crossings (osm_id, geom, type)
	SELECT i.osm_id, 
		i.geom,
		unnest(xpath('//node/tag[@k="highway" and @v="traffic_signals"]/@v', i.node))
	FROM osm_nodes i;

	RAISE NOTICE '2. Now add train level_crossings';
	INSERT INTO way_crossings (osm_id, geom, type)
	SELECT i.osm_id, 
		i.geom,
		unnest(xpath('//node/tag[@k="railway" and @v="level_crossing"]/@v', i.node))
	FROM osm_nodes i;

	RAISE NOTICE '3. Now add road crossings';
	INSERT INTO way_crossings (osm_id, geom, type)
	SELECT i.osm_id, 
		i.geom,
		unnest(xpath('//node/tag[@k="highway" and @v="crossing"]/@v', i.node))
	FROM osm_nodes i;

	RAISE NOTICE '4. Now add more detail (other than "crossing")';
	UPDATE way_crossings SET type = x.name
	FROM (
		SELECT i.osm_id, 
			unnest(xpath('//node/tag[@k="highway" and @v="crossing"]/@v', i.node)),
			unnest(xpath('//node/tag[@k="crossing"]/@v', i.node)) AS name
		FROM osm_nodes i
	) AS x 
	WHERE way_crossings.osm_id = x.osm_id;

END;
$$;


ALTER FUNCTION setwaycrossings() OWNER TO postgres;
CREATE FUNCTION setosmrestrictions() RETURNS void
    LANGUAGE plpgsql
    AS $$
/*
Retrieve the OpenStreetMap restrictions
https://wiki.openstreetmap.org/wiki/Relation:restriction
NOTE: Sheffield only appears to have exceptions to the general rule, not restriction:conditional, restriction:bus or 
NOTE: Where the "from" element doesn't exist, use the to element. Via is not a valid way, so assume the restriction is straight on.
e.g.
<relation id="4020705" version="2" timestamp="2015-06-12T18:44:11Z" changeset="31929009" uid="358273" user="alpha2424">
    <member type="node" ref="2836990776" role="via"/>
    <member type="way" ref="302342644" role="to"/>
    <tag k="restriction" v="no_left_turn"/>
    <tag k="type" v="restriction"/>
</relation>
<relation id="920436" version="3" timestamp="2014-11-21T22:55:49Z" changeset="26939236" uid="1802093" user="Paul Berry">
    <member type="way" ref="41793980" role="from"/>
    <member type="way" ref="313889126" role="to"/>
    <member type="node" ref="1591678079" role="via"/>
    <tag k="restriction" v="only_straight_on"/>
    <tag k="type" v="restriction"/>
</relation> 
*/
BEGIN
	INSERT INTO osm_restrictions(id, via_id, from_id, to_id, restriction)
	SELECT
		unnest(xpath('//relation/@id', x.relation)),	
		unnest(xpath('//relation//member[@role="via"]/@ref', x.relation)),
		unnest(xpath('//relation//member[@role="from"]/@ref', x.relation)),
		unnest(xpath('//relation//member[@role="to"]/@ref', x.relation)),
		unnest(xpath('//relation//tag[@k="restriction"]/@v', x.relation))
	FROM  osm_relations x;
END;
$$;


ALTER FUNCTION setosmrestrictions() OWNER TO postgres;
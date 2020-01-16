-- Function: setbicycleinfrasctruccture()

-- DROP FUNCTION setbicycleinfrasctruccture();

CREATE OR REPLACE FUNCTION setbicycleinfrasctruccture()
  RETURNS void AS
$BODY$
/*
Update the entire ways to indicate if the state of the bicyle infrastructure
Set as either 'none', 'shared' or 'segregated'
Default state of the column is 'none'
*/
BEGIN

	--anything tagged as part of a cycle network, assume shared infrastructure
	--can be over-ruled at a later point
	UPDATE ways_clean 
	SET bicycle_infrastructure = 'shared'
	WHERE (attrs ? 'icn'
		OR attrs ? 'icn_ref'
		OR attrs ? 'ncn'
		OR attrs ? 'ncn_ref'
		OR attrs ? 'rcn'
		OR attrs ? 'rcn_ref'
		OR attrs ? 'lcn'
		OR attrs ? 'lcn_ref');

	--other non-roads where cycling is permitted
	UPDATE ways_clean 
	SET bicycle_infrastructure = 'off-road'
	WHERE highway IN ('bridleway', 'track')
	AND (attrs IS NULL OR (attrs ? 'bicycle' AND (attrs -> 'bicycle' != 'no')));

	--deal with busways, bicycles usually share them with buses
	UPDATE ways_clean 
	SET bicycle_infrastructure = 'shared'
	WHERE (attrs ? 'busway' AND (attrs -> 'busway' != 'no'))
	OR (attrs ? 'busway:left' AND (attrs -> 'busway' != 'no'))
	OR (attrs ? 'busway:right' AND (attrs -> 'busway' != 'no'))
	OR (attrs ? 'bus'  AND (attrs -> 'bus' != 'no'))
	OR (attrs ? 'psv' AND (attrs -> 'psv' != 'no'))
	OR (attrs ? 'access:psv' AND (attrs -> 'access:psv' != 'no'))
	OR (attrs ? 'lanes:bus' AND (attrs -> 'lanes:bus' != 'no'));

	--sections shared with other traffic
	UPDATE ways_clean 
	SET bicycle_infrastructure = 'shared'
	WHERE (attrs ? 'cycleway' AND (attrs -> 'cycleway' != 'no')) --try to catch all possibilities, including badly tagged edges	
	OR (attrs ? 'cycleway:both' AND (attrs -> 'cycleway:both' != 'no'))
	OR (attrs ? 'cycleway:left' AND (attrs -> 'cycleway:left' != 'no'))
	OR (attrs ? 'cycleway:left:oneway' AND (attrs -> 'cycleway:left:oneway' != 'no'))
	OR (attrs ? 'cycleway:left:lane' AND (attrs -> 'cycleway:left:lane' != 'no'))
	OR (attrs ? 'cycleway:right' AND (attrs -> 'cycleway:right' != 'no'))
	OR (attrs ? 'cycleway:right:oneway' AND (attrs -> 'cycleway:right:oneway' != 'no'))
	OR (attrs ? 'cycleway:right:lane' AND (attrs -> 'cycleway:right:lane' != 'no')); 


	--completely segregated tracks
	UPDATE ways_clean 
	SET bicycle_infrastructure = 'segregated'
	WHERE highway = 'cycleway' 
	OR (attrs ? 'cycleway' AND (attrs -> 'cycleway'  IN ('opposite_track', 'segregated', 'track'))) --now check specifically tagged cycleways	
	OR (attrs ? 'cycleway:both' AND (attrs -> 'cycleway:both' IN ('opposite_track', 'segregated', 'track')))
	OR (attrs ? 'cycleway:left' AND (attrs -> 'cycleway:left' IN ('opposite_track', 'segregated', 'track')))
	OR (attrs ? 'cycleway:left:oneway' AND (attrs -> 'cycleway:left:oneway' IN ('opposite_track', 'segregated', 'track')))
	OR (attrs ? 'cycleway:left:lane' AND (attrs -> 'cycleway:left:lane' IN ('opposite_track', 'segregated', 'track')))
	OR (attrs ? 'cycleway:right' AND (attrs -> 'cycleway:right' IN ('opposite_track', 'segregated', 'track')))
	OR (attrs ? 'cycleway:right:oneway' AND (attrs -> 'cycleway:right:oneway' IN ('opposite_track', 'segregated', 'track')))
	OR (attrs ? 'cycleway:right:lane' AND (attrs -> 'cycleway:right:lane' IN ('opposite_track', 'segregated', 'track')));

	--cycling facilities shred with pedestrians
	UPDATE ways_clean 
	SET bicycle_infrastructure = 'segregated' 
	WHERE highway IN ('path', 'footway', 'pedestrian')
	AND ((attrs ? 'bicycle' AND (attrs -> 'bicycle' != 'no'))
		OR (attrs ? 'lcn' AND (attrs -> 'lcn' != 'no'))
		OR (attrs ? 'cycle' AND (attrs -> 'cycle' != 'no')));

	--finally, update anywhere without bicycle access to 'none'
	UPDATE ways_clean 
	SET bicycle_infrastructure = 'none' 
	WHERE highway IN ('path', 'footway', 'pedestrian')
	AND ((attrs ? 'bicycle' AND (attrs -> 'bicycle' = 'no'))
		OR (attrs ? 'lcn' AND (attrs -> 'lcn' = 'no'))
		OR (attrs ? 'cycle' AND (attrs -> 'cycle' = 'no')));


END; 
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION setbicycleinfrasctruccture()
  OWNER TO postgres;

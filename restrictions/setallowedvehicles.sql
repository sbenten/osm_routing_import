CREATE FUNCTION setallowedvehicles() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE ways_clean SET 
		car_allow = carAllowed(highway, attrs), 
		bus_allow = busAllowed(highway, attrs), 		
		cycle_allow = cycleAllowed(highway, attrs),
		walk_allow = walkAllowed(highway, attrs),
		has_bridge = hasBridge(attrs),
		has_tunnel = hasTunnel(attrs),
		tram_allow = (highway = 'tram'),
		train_allow = (highway = 'trainline');
END
$$;


ALTER FUNCTION setallowedvehicles() OWNER TO postgres;
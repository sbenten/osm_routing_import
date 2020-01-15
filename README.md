# Import OpenStreetMap data into PostGIS for use with pg_routing

This project includes the code from my PhD on measuring alternative healthier options for the commute in the Sheffield, UK region. 
This was done using a transportation network built from OSM data using pg_routing, and this can be applied to other projects. 
The basic steps to create such a network are outlined below, the tables and code required detailed in the steps and this archive. 
It is far from being a framework, so feel free to chop and change as you see fit.

The code uses the OSGB specific SRID throughout (27700), you will need to change these for use anywhere else in the world! 

Also, this process was not a designed to create a multi-modal network, rather it compared least cost paths between the same origin and destinations with different modes, so there are single edges with many different costs for each mode, rather than a multiple edges for each mode and a single cost. 

All the code is written in SQL, either as functions, or in-line code blocks which need to be copied and run at a SQL prompt. 
Follow the steps outlined below to add an OSM transport network.

The following software is required:
- PostgreSQL, a free and open-source Relational Database Management System (RDBMS) which focuses on standards and extensibility
  - PostGIS, a large extension to PostgreSQL which adds the ability to process spatial data
  - pgRouting, an extension of PostGIS which adds the ability to spatially route across a network
  - postgis_topology extension, which provides functions to manage topological nodes, edges and faces
  - hstore extension, which adds a data types for storing key – value pairs in a single column PostgreSQL value 
- QGis, a free and open-source Geographical Information System

## Download the data
Go to the OSM website and download some data via the Overpass API on the OSM website.
## Import the data
Import the downloaded file into a "ways" table in the database by either:
1. Load only the lines into QGis, filter for only "highways" and import the vector layer into your PostGIS database. This is the simplest and quickest method. 
2. Place the OSM file in the PostgreSQL database cluster data folder, commonly referred to as the PGDATA variable within PostgreSQL, and treat it as an external data file. On a Windows computer an example location would be “C:\Program Files\PostgreSQL\9.6\data”. Load the file in three stages, with nodes, ways and relations each being extracted in turn (takes a while to complete):
~~~~
SELECT loadosmnodesfromfile('overpass_file.osm');
SELECT loadosmwaysfromfile('overpass_file.osm');
SELECT loadosmrelationsfromfile('overpass_file.osm');
~~~~
## Clean the data 
These steps remove any broken connections by using PostGIS topologies to flatten the network to two dimensions. 
Bridges and tunnels will then need disconnecting to return to three dimensions.  See http://blog.mathieu-leplatre.info/use-postgis-topologies-to-clean-up-road-networks.html
1. Create a PostGIS topology layer to clean up the highways from OpenStreetMap
~~~~
SELECT topology.CreateTopology('highway_topology', 27700);
~~~~
2. Create a table inside the topology schema which mirrors the imported highways table
~~~~
CREATE TABLE highway_topology.ways (LIKE ways including ALL);
~~~~
3. Add a topogeometry column to this new table
~~~~
SELECT topology.AddTopoGeometryColumn('highway_topology','highway_topology','ways','topo','LINE');
~~~~
4. Copy the highways data into the topology network. This will take some time as it will be fixing broken connections. 
If your using a different SRID, you'll want to change the tolerance from 0.05.
~~~~
INSERT INTO highway_topology.ways(id, geom, osm_id, name, highway, z_order, attrs, topo)
SELECT id, geom, osm_id, name, highway, z_order, attrs, topology.toTopoGeom(geom, 'highway_topology', 1, 0.05)
FROM ways
WHERE highway IS NOT NULL;
~~~~
5. Copy the corrected data back to a standard PostGIS table "ways_clean"
~~~~
INSERT INTO ways_clean(ways_id, geom, osm_id, name, highway, z_order, attrs)
SELECT s.id, e.geom, s.osm_id, s.name, s.highway, s.z_order, s.attrs
FROM highway_topoology.edge_data e
LEFT JOIN highway_topoology.relation r ON e.edge_id = r.element_id
LEFT JOIN highway_topoology.ways s ON r.topogeo_id = (s.topo).id;
~~~~
6. Disconnect bridges, tunnels and flyovers from other sections of the network which do not intersect in three dimensions. 
This assumes you have used QGis to do the original import and that a "zorder" field exists.
~~~~
SELECT mergeHighwayEdgesByZorder();
~~~~
7. Split circular edges in half so the routing algorithm doesn't get dizzy
~~~~
SELECT splitCircularWays();
~~~~
At this point the network should be able to calculate paths, you just need to node the network.
But you probably want to add some costs and turn restrictions.
## Assigning costs and restrictions
Not every type of vehicle is allowed on every part of the network.
~~~~
SELECT setAllowedVehicles();
~~~~
One-way streets will be dealt with in assigning costs (the wrong direction is assigned an extremely large cost). 
Turn restrictions exist which need calculating, but this requires the relations from the OSM file, not the ways.
If you did not import relations (because you used QGis to load the ways) you will need to do so now:
~~~~
SELECT loadosmrelationsfromfile('overpass_file.osm');
~~~~
Once that has completed you can process the relations and add turn restrictions to the highways. 
The turn restrictions are added to a "way_restrictions" table for use with pgr_trsp.
~~~~
SELECT setOsmRestrictions();
SELECT setWayRestrictions();
~~~~
Database views are available for each mode of travel which return the restrictions specific to each transport mode.

To assign costs, we need to know how quick each mode of travel can move in kilometers per hour. 
A "ways_config" table is used to store the speed of each mode on a particular type of highway.
Values in brackets are for urban network speed (if it is different are you are using it).
Where a vehicle is not allowed, add a 1kph value to stop cost calculations throwing a division by zero or similar error.
The following table shows the settings used in the model for Sheffield, UK.
An insert script is available.

|OSM highway|Bicycle (kph)|Bus (kph)|Car (kph)|Pedestrian (kph)|
|:-------------|:-------------|:-------------|:-------------|:-------------|
|bridleway|15 (15)|-|10 (10)|5 (5)|
|construction|-|-|-|-|				
|cycleway|15 (15)-|-|5 (5)|
|footway|5 (5)|-|-|5 (5)|
|living_street|15 (15)|20 (20)|20 (20)|5 (5)|
|motorway|-|90 (90)|110 (110)|-|	
|motorway_junction|-|90 (90)|110 (110)|-|	
|motorway_link|-|90 (90)|110 (110)|-|	
|no|-|-|-|-|				
|path|5 (5)|-|-|5 (5)|
|pedestrian|5 (5)|-|-|5 (5)|
|platform|5 (5)|-|-|5 (5)|
|primary|15 (15)|80 (48)|90 (48)|5 (5)|
|primary_link|15 (15)|80 (48)|90 (48)|5 (5)|
|proposed|-|-|-|-|				
|residential|15 (15)|48 (48)|48 (48)|5 (5)|
|road|15 (15)|48 (48)|48 (48)|5 (5)|
|secondary|15 (15)|60 (48)|60 (48)|5 (5)|
|secondary_link|15 (15)|60 (48)|60 (48)|5 (5)|
|service|15 (15)|20 (20)|20 (20)|5 (5)|
|steps|3 (3)|-|-|5 (5)|
|tertiary|15 (15)|48 (48)|48 (48)|5 (5)|
|tertiary_link|15 (15)|48 (48)|48 (48)|5 (5)|
|track|15 (15)|-|10 (10)|5 (5)|
|trunk|15 (15)|80 (48)|90 (48)|5 (5)|
|trunk_link|15 (15)|80 (48)|90 (48)|5 (5)|
|unclassified|15 (15)|90 (48)|90 (48)|5 (5)|

These defaults may not suit everywhere, so change as you need to *before* calculating costs.

Other alterations to the network may be needed depending on what you want to route and measure. 
Use what you want and ditch the rest, though some hacking of scripts may be required, as I'm afraid its not a modular framework at the moment:

- Motor vehicles may be restricted to lower speeds in built-up areas. You'll need to define which ways are in a built-up area to use this. The Sheffield project imported the built-up areas from the ONS and did a simple geographical query to set a value.
- Cars may also be required to use parking facilities in urban areas. Again, this data is imported and queried separately, though the table definitions and functions will be included.
- Cyclists are allowed on the footway (your not *supposed* to cycle on paths but people do), so short sections of footways between two dead-end roads were altered to allow cycling in order to allow for cycling short-cuts.
- The role of topography was considered for active modes, so a separate DTM import and lookup of *every* point on the network was performed to calculate total ascent and descent. OS Terrain 5 was used for the Sheffield area but others are available for other areas in the world.
- The OSM tracktype and smoothness attributes were examined to get an indication as to the ease of traveling on that section of highway.
- The "bendiness" of the road was calculated and used to increase the cost of traveling by motor vehicle (you are supposed to slow down at corners, otherwise you crash).

Costs used are essentially the time in seconds it takes to travel along each section of highway under different modes. Considering the points made above the formula for traveling by active modes is along the lines of:
~~~~
Active Time Cost = (((Naismith * ascent(y)) + length(x)) / ((speed * 1000) / 3600)) * terrainIndex
~~~~
For motorised transport time cost is calculated as:
~~~~
Motorised Time Cost = (length(x) / ((speed * 1000) / 3600)) * curveIndex * terrainIndex
~~~~
To calculate the costs for the network:
~~~~
SELECT setwaycosts();
~~~~
## Node the network
The network is a set of connected lines at nodes.
pg_routing requires the nodes to traverse the network graph so we need to add them.
Again change the tolerance to something which suits your SRID.
~~~~
SELECT pgr_createTopology('ways_clean', 0.001, 'geom', 'id', 'source', 'target', rows_where := 'true', clean := 'true');
SELECT pgr_analyzeGraph('ways_clean', 0.001, 'geom', 'id', 'source', 'target', rows_where := 'true');
~~~~
This creates and analyzes a ways_clean_vertices_pgr table with all the nodes required for the network graph.
## Calculate a route
Given an origin and destination *node* id from the ways_clean_vertices_pgr table, we can calculate a path.
Something along the lines of...
~~~~
SELECT w.id, w.osm_id, w.geom, w.name, w.highway, trsp.*
FROM pgr_trsp(
    'SELECT id, source, target, car_cost AS cost, car_reverse_cost AS reverse_cost FROM ways_clean',
    origin_node_id, destination_node_id,
    true, true,
    'SELECT to_cost, target_id, via_path FROM vw_car_restrictions'
) AS trsp
LEFT JOIN ways_clean w ON trsp.id2 = w.id;
~~~~
Hint: change origin_node_id and destination_node_id to the actual values
## Final word(s)
Public transport.

Public service vehicles follow their own timetables, and only travel on certain parts of the network, so a cost based on time table time is required.
The Sheffield project imported the NaPTAN public transport stop data for the region and split the network based on these locations (after some corrections). 
Timetable data was imported from Traveline for the region and the paths for the vehicles calculated using pgr_trsp. Obviously, PSVs do not take the shortest path between two stops, so some persuasion was needed with pgr_dijkstraVia.

This created a separate public transport network inflated from the base OSM highway network, which can be used for proper multi-modal routing intersecting the base network at the stop points. 

Should have stopped there. Walking connections and intersecting routes were calculated and the whole lot inflated for each PSV journey. It works, but you need to know the origin *point and time* as well as the destination *point and time*. Don't do this last bit. 



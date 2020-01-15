library("ggplot2")
library("RPostgreSQL")

dbname <- {"production"}
dbuser <- {"postgres"}
dbport <- {"5432"}
dbpw <- {"xxxxxxxxxxxxxxxxxxxx"}
dbhost <- {"localhost"}
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname = dbname, host = dbhost, port = dbport, user = dbuser, password = dbpw)
rm(dbpw)

accidents <- dbGetQuery(con, "SELECT a.*, x.date,
  COALESCE(p.count, 0) AS pedestrian_count, 
  COALESCE(c.count, 0) AS cyclist_count
FROM dft.accidents a
JOIN dft.accidents_ex x ON a.id = x.accident_id
LEFT JOIN (
  SELECT accident_id, 
  COUNT(1) AS count
  FROM dft.casualties
  WHERE casualty_type = 0
  GROUP BY accident_id
) p ON p.accident_id = a.id
LEFT JOIN (
  SELECT accident_id, 
  COUNT(1) AS count
  FROM dft.casualties
  WHERE casualty_type = 1
  GROUP BY accident_id
) c ON c.accident_id = a.id
WHERE a.study = true")

severity <- dbGetQuery(con, "SELECT a.*, x.date,
	COALESCE(f.count, 0) AS fatalities_count, 
                       COALESCE(s.count, 0) AS severe_count
                       FROM dft.accidents a
                       JOIN dft.accidents_ex x ON a.id = x.accident_id
                       LEFT JOIN (
                       SELECT accident_id, 
                       COUNT(1) AS count
                       FROM dft.casualties
                       WHERE severity = 1
                       GROUP BY accident_id
                       ) f ON f.accident_id = a.id
                       LEFT JOIN (
                       SELECT accident_id, 
                       COUNT(1) AS count
                       FROM dft.casualties
                       WHERE severity = 2
                       GROUP BY accident_id
                       ) s ON s.accident_id = a.id
                       WHERE a.study = true")


#how many accidents and what type
total_accidents <- nrow(accidents)
total_casualties <- sum(accidents$number_of_casualties)
total_pedestrians <- sum(accidents$pedestrian_count)
total_cyclists <- sum(accidents$cyclist_count)

total_fatalities <- sum(severity$fatalities_count)
total_severe <- sum(severity$severe_count)

pedestrian_fatalities <- nrow(subset(accidents, subset=accident_severity==1 & pedestrian_count>0))
pedestrian_fatalities_perc <- (pedestrian_fatalities / total_accidents) * 100
pedestrian_severities <- nrow(subset(accidents, subset=accident_severity==2 & pedestrian_count>0))
pedestrian_severities_perc <- (pedestrian_severities / total_accidents) * 100

cyclist_fatalities <- nrow(subset(accidents, subset=accident_severity==1 & cyclist_count>0))
cyclist_fatalities_perc <- (cyclist_fatalities / total_accidents) * 100
cyclist_severities <- nrow(subset(accidents, subset=accident_severity==2 & cyclist_count>0))
cyclist_severities_perc <- (cyclist_severities / total_accidents) * 100




#most dangerous road sections
junctions <- dbGetQuery(con, "SELECT id,
  osm_id,
  name,
  highway,
  length_m,
  bicycle_infrastructure,
  total_accidents,
  pedestrian_accidents,
  cyclist_accidents
FROM sheffield.ways_clean
WHERE total_accidents > 0")

#produce maps:
#for totals
#for pedestrians
#for cyclists

#dangerous roads
queens_road <- sum(subset(junctions, name=='Queens Road')$total_accidents)
bramall_lane <- sum(subset(junctions, name=='Bramall Lane')$total_accidents)
abbeydale_road <- sum(subset(junctions, name=='Abbeydale Road')$total_accidents)
abbeydale_road_cycle <- sum(subset(junctions, name=='Abbeydale Road')$cyclist_accidents)
ecclesall_road_cycle <- sum(subset(junctions, name=='Ecclesall Road')$cyclist_accidents)


sheaf_street_foot <- sum(subset(junctions, name=='Sheaf Street')$pedestrian_accidents)
langsett_road_foot <- sum(subset(junctions, name=='Langsett Road')$pedestrian_accidents)
commercial_street_foot <- sum(subset(junctions, name=='Commercial Street')$pedestrian_accidents)
ecclesall_road_foot <- sum(subset(junctions, name=='Ecclesall Road')$pedestrian_accidents)
west_street_foot <- sum(subset(junctions, name=='West Street')$pedestrian_accidents)

#segregated cycleways
segregated_cycleways <- sum(subset(junctions, bicycle_infrastructure=='segregated')$cyclist_accidents)

p <- subset(junctions, name=='Queens Road')
cyclist_segregated <- subset(junctions, subset=bicycle_infrastructure=='segregated' & cyclist_accidents > 0)
sum(cyclist_segregated$cyclist_accidents)
#correlation with cycling infrastructure


#basic plot of the cycling infrastructure and accident count
ggplot(data=subset(junctions, cyclist_accidents>0), aes(bicycle_infrastructure)) +
  geom_bar() +
  labs(title="", x="Bicycle infrasctructure", y="Count") +
  theme(legend.position = "non", panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) +
  scale_fill_brewer(palette = "Spectral")

#not worth doing this...
#infrastructure_aov <- aov(cyclist_accidents ~ bicycle_infrastructure, data=junctions) #subset(junctions, cyclist_accidents>0))
#summary(infrastructure_aov)
#infrastructure_tuk <- TukeyHSD(infrastructure_aov)
#plot(infrastructure_tuk)

infrastructure <- dbGetQuery(con,"SELECT id, osm_id, highway, name, length_m, bicycle_infrastructure
                             FROM sheffield.ways_clean
                             WHERE cycle_allow = true") 

total_ways <- nrow(infrastructure)
perc_none <- (nrow(subset(infrastructure, bicycle_infrastructure=='none')) / total_ways) * 100
perc_shared <- (nrow(subset(infrastructure, bicycle_infrastructure=='shared')) / total_ways) * 100
perc_segregated <- (nrow(subset(infrastructure, bicycle_infrastructure=='segregated')) / total_ways) * 100
perc_offroad <- (nrow(subset(infrastructure, bicycle_infrastructure=='off-road')) / total_ways) * 100



infrastructure_urban <- dbGetQuery(con,"SELECT id, osm_id, highway, name, length_m, bicycle_infrastructure
                             FROM sheffield.ways_clean
                             WHERE cycle_allow = true
                             AND built_up = true") 

total_ways_urban <- nrow(infrastructure_urban)
perc_none_urban <- (nrow(subset(infrastructure_urban, bicycle_infrastructure=='none')) / total_ways_urban) * 100
perc_shared_urban <- (nrow(subset(infrastructure_urban, bicycle_infrastructure=='shared')) / total_ways_urban) * 100
perc_segregated_urban <- (nrow(subset(infrastructure_urban, bicycle_infrastructure=='segregated')) / total_ways_urban) * 100
perc_offroad_urban <- (nrow(subset(infrastructure_urban, bicycle_infrastructure=='off-road')) / total_ways_urban) * 100


total_length_urban <- sum(infrastructure_urban$length_m)
perc_length_none_urban <- (sum(subset(infrastructure_urban, bicycle_infrastructure=='none')$length_m) / total_length_urban) * 100
perc_length_shared_urban <- (sum(subset(infrastructure_urban, bicycle_infrastructure=='shared')$length_m) / total_length_urban) * 100
perc_length_segregated_urban <- (sum(subset(infrastructure_urban, bicycle_infrastructure=='segregated')$length_m) / total_length_urban) * 100
perc_length_offroad_urban <- (sum(subset(infrastructure_urban, bicycle_infrastructure=='off-road')$length_m) / total_length_urban) * 100









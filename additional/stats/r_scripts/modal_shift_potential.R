library("e1071")
library("ggplot2")
library("RPostgreSQL")

#
# Basic stats and plots of the potential for modal shift improving physical activity as part of the commute

dbname <- {"production"}
dbuser <- {"postgres"}
dbport <- {"5432"}
dbpw <- {"xxxxxxxxxxxxxxxxxxxx"}
dbhost <- {"localhost"}
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname = dbname, host = dbhost, port = dbport, user = dbuser, password = dbpw)
rm(dbpw)


#Walking and cycling in 10-30 minute range and within 10 mins of parking the car
flows <- dbGetQuery(con, "SELECT group_id, batch_run_id, batch_item_id, batch_item_description, 
                    mode_filter, home_imd_code, home_imd_name, home_imd_rank, 
                    home_decile, home_quintile, home_imd_health_rank, home_health_decile, 
                    home_health_quintile, length_agg_cost, time_agg_cost, delay_time_agg_cost, 
                    ascent_agg_cost, descent_agg_cost, met_agg_cost, delay_met_agg_cost, 
                    delay_time_agg_interval, delay_time_agg_format, female_minus_1sd_agg_calories, 
                    female_average_agg_calories, female_plus_1sd_agg_calories, male_average_agg_calories, 
                    male_minus_1sd_agg_calories, male_plus_1sd_agg_calories, active_length_agg_cost, 
                    active_time_agg_cost, active_ascent_agg_cost, active_descent_agg_cost, 
                    active_met_agg_cost, active_delay_time_agg_interval, active_delay_time_agg_format, 
                    active_female_minus_1sd_agg_calories, active_female_average_agg_calories, 
                    active_female_plus_1sd_agg_calories, active_male_minus_1sd_agg_calories, 
                    active_male_average_agg_calories, active_male_plus_1sd_agg_calories, 
                    park_time_agg_cost, park_delay_time_agg_cost, park_ascent_agg_cost, 
                    park_descent_agg_cost, park_met_agg_cost, park_delay_met_agg_cost, 
                    park_delay_time_agg_interval, park_delay_time_agg_format, park_female_minus_1sd_agg_calories, 
                    park_female_average_agg_calories, park_female_plus_1sd_agg_calories, 
                    park_male_minus_1sd_agg_calories, park_male_average_agg_calories, 
                    park_male_plus_1sd_agg_calories, park_active_length_agg_cost, 
                    park_active_time_agg_cost, park_active_ascent_agg_cost, park_active_descent_agg_cost, 
                    park_active_met_agg_cost, park_active_delay_time_agg_interval, 
                    park_active_delay_time_agg_format, park_active_female_minus_1sd_agg_calories, 
                    park_active_female_average_agg_calories, park_active_female_plus_1sd_agg_calories, 
                    park_active_male_minus_1sd_agg_calories, park_active_male_average_agg_calories, 
                    park_active_male_plus_1sd_agg_calories,
                    exclude_stats, sample, visit,
                    CASE WHEN mode_filter = 1 THEN 'Car (door to door)'
                        WHEN mode_filter = 2 THEN 'Car (with parking)'
                        WHEN mode_filter = 3 THEN 'Cycling'
                        WHEN mode_filter = 4 THEN 'Walking'
                        WHEN mode_Filter = 6 THEN 'Public Transport'
                      END AS mode,
                    'decile_' || (home_decile-1) AS cat_home_decile,
                    'quintile_' || (home_quintile-1) AS cat_home_quintile,
                    'decile_' || (home_health_decile-1) AS cat_home_health_decile,
                    'quintile_' || (home_health_quintile-1) AS cat_home_health_quintile,
                    CEIL(length_agg_cost / 1000) AS km_ceil_cost,
                    CEIL(delay_time_agg_cost / 60) AS delay_time_ceil_cost
                    FROM batch_run_res_summary 
	                  WHERE mode_filter IN(2, 3, 4)
                    AND exclude_stats = false 
                    AND delay_time_agg_cost > 599
                    AND delay_time_agg_cost < 1801
                    AND delay_time_agg_cost < (park_delay_time_agg_cost + 600)")

#not really any point, a barplot will suffice
#counts <- dbGetQuery(con, "SELECT COUNT(1) AS count, 'decile_' || (home_health_decile-1) AS cat_home_health_decile
#                     FROM batch_run_res_summary 
#                     WHERE mode_filter IN(3, 4)
#                     AND exclude_stats = false 
#                     AND delay_time_agg_cost > 599
#                     AND delay_time_agg_cost < 1801
#                     AND delay_time_agg_cost < (park_delay_time_agg_cost + 600)
#                     GROUP BY home_health_decile")


bike <- subset(flows, mode_filter==3)
walk <- subset(flows, mode_filter==4)


v_totalcount <- nrow(flows)
v_bikecount <- nrow(bike)
v_walkcount <- nrow(walk)

v_walkperc <- (v_walkcount / v_totalcount) * 100
v_bikeperc <- (v_bikecount / v_totalcount) * 100


walk_summary <- summary(walk$delay_time_agg_cost)
walk_sd <- sd(walk$delay_time_agg_cost)
walk_skew <- skewness(walk$delay_time_agg_cost)
walk_kurt <- kurtosis(walk$delay_time_agg_cost)

bike_summary <- summary(bike$delay_time_agg_cost)
bike_sd <- sd(bike$delay_time_agg_cost)
bike_skew <- skewness(bike$delay_time_agg_cost)
bike_kurt <- kurtosis(bike$delay_time_agg_cost)

#density of walking selection
ggplot(walk) + 
  labs(title="", x="Commute time (mins)", y="Density") +
  geom_density(aes((delay_time_agg_cost / 60), fill="#e41a1c"), alpha=0.8, show.legend=FALSE) +
  #scale_x_continuous(limits=c(0, 30000), breaks=c(0,10000,20000,30000), labels=c("0","10","20","30")) +
  theme(panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) +
  geom_vline(xintercept=mean((walk$delay_time_agg_cost/60)), linetype="dotted", color="black", size=1) 

#density of biking selection
ggplot(bike) + 
  labs(title="", x="Commute time (mins)", y="Density") +
  geom_density(aes((delay_time_agg_cost / 60), fill="#e41a1c"), alpha=0.8, show.legend=FALSE) +
  #scale_x_continuous(limits=c(0, 30000), breaks=c(0,10000,20000,30000), labels=c("0","10","20","30")) +
  theme(panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) +
  geom_vline(xintercept=mean((bike$delay_time_agg_cost/60)), linetype="dotted", color="black", size=1) 



#basic plot of the data 
ggplot(data=flows, aes(home_health_decile)) +
  geom_bar() +
  labs(title="", x="IMD health decile", y="Count") +
  scale_x_continuous(breaks=c(1:10), labels=c("1","2","3","4","5","6","7","8","9","10")) +
  theme(legend.position = "non", panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) 


#Walking and cycling within 10 and 30 minute range
flows_all <- dbGetQuery(con, "SELECT group_id, batch_run_id, batch_item_id, batch_item_description, 
                    mode_filter, home_imd_code, home_imd_name, home_imd_rank, 
                    home_decile, home_quintile, home_imd_health_rank, home_health_decile, 
                    home_health_quintile, length_agg_cost, time_agg_cost, delay_time_agg_cost, 
                    ascent_agg_cost, descent_agg_cost, met_agg_cost, delay_met_agg_cost, 
                    delay_time_agg_interval, delay_time_agg_format, female_minus_1sd_agg_calories, 
                    female_average_agg_calories, female_plus_1sd_agg_calories, male_average_agg_calories, 
                    male_minus_1sd_agg_calories, male_plus_1sd_agg_calories, active_length_agg_cost, 
                    active_time_agg_cost, active_ascent_agg_cost, active_descent_agg_cost, 
                    active_met_agg_cost, active_delay_time_agg_interval, active_delay_time_agg_format, 
                    active_female_minus_1sd_agg_calories, active_female_average_agg_calories, 
                    active_female_plus_1sd_agg_calories, active_male_minus_1sd_agg_calories, 
                    active_male_average_agg_calories, active_male_plus_1sd_agg_calories, 
                    park_time_agg_cost, park_delay_time_agg_cost, park_ascent_agg_cost, 
                    park_descent_agg_cost, park_met_agg_cost, park_delay_met_agg_cost, 
                    park_delay_time_agg_interval, park_delay_time_agg_format, park_female_minus_1sd_agg_calories, 
                    park_female_average_agg_calories, park_female_plus_1sd_agg_calories, 
                    park_male_minus_1sd_agg_calories, park_male_average_agg_calories, 
                    park_male_plus_1sd_agg_calories, park_active_length_agg_cost, 
                    park_active_time_agg_cost, park_active_ascent_agg_cost, park_active_descent_agg_cost, 
                    park_active_met_agg_cost, park_active_delay_time_agg_interval, 
                    park_active_delay_time_agg_format, park_active_female_minus_1sd_agg_calories, 
                    park_active_female_average_agg_calories, park_active_female_plus_1sd_agg_calories, 
                    park_active_male_minus_1sd_agg_calories, park_active_male_average_agg_calories, 
                    park_active_male_plus_1sd_agg_calories,
                    exclude_stats, sample, visit,
                    CASE WHEN mode_filter = 1 THEN 'Car (door to door)'
                    WHEN mode_filter = 2 THEN 'Car (with parking)'
                    WHEN mode_filter = 3 THEN 'Cycling'
                    WHEN mode_filter = 4 THEN 'Walking'
                    WHEN mode_Filter = 6 THEN 'Public Transport'
                    END AS mode,
                    'decile_' || (home_decile-1) AS cat_home_decile,
                    'quintile_' || (home_quintile-1) AS cat_home_quintile,
                    'decile_' || (home_health_decile-1) AS cat_home_health_decile,
                    'quintile_' || (home_health_quintile-1) AS cat_home_health_quintile,
                    CEIL(length_agg_cost / 1000) AS km_ceil_cost,
                    CEIL(delay_time_agg_cost / 60) AS delay_time_ceil_cost
                    FROM batch_run_res_summary 
                    WHERE mode_filter IN(3, 4)
                    AND exclude_stats = false 
                    AND delay_time_agg_cost > 599
                    AND delay_time_agg_cost < 1801")


bike_all <- subset(flows_all, mode_filter==3)
walk_all <- subset(flows_all, mode_filter==4)

v_totalcountall <- nrow(flows_all)
v_bikecountall <- nrow(bike_all)
v_walkcountall <- nrow(walk_all)

v_walkpercall <- (v_walkcountall / v_totalcountall) * 100
v_bikepercall <- (v_bikecountall / v_totalcountall) * 100


#basic plot of the data 
ggplot(data=flows_all, aes(home_health_decile)) +
  geom_bar() +
  labs(title="", x="IMD health decile", y="Count") +
  scale_x_continuous(breaks=c(1:10), labels=c("1","2","3","4","5","6","7","8","9","10")) +
  theme(legend.position = "non", panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA))


counts <- dbGetQuery(con, "SELECT * FROM (
  SELECT 1 AS type, 'bike_count' AS description, Count(DISTINCT batch_item_id) AS count
  FROM batch_run_res_summary
  WHERE mode_filter = 2
  AND ((delay_time_agg_cost + 600) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801)
  UNION
  SELECT 2 AS type, 'walk_count' AS description, Count(DISTINCT batch_item_id) AS count
  FROM batch_run_res_summary
  WHERE mode_filter = 2
  AND ((delay_time_agg_cost + 600) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
  UNION
  SELECT 3 AS type, 'pt_count' AS description, Count(DISTINCT batch_item_id) AS count
  FROM batch_run_res_summary
  WHERE mode_filter = 2
  AND ((delay_time_agg_cost + 600) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
  UNION
  SELECT 4 AS type, 'active_count' AS description, Count(DISTINCT batch_item_id) AS count
  FROM batch_run_res_summary
  WHERE mode_filter = 2
  AND (
  ((delay_time_agg_cost + 600) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
  OR ((delay_time_agg_cost + 600) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
  OR ((delay_time_agg_cost + 600) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
  )
  UNION
  SELECT 5 AS type, 'item_count' AS description, Count(DISTINCT batch_item_id) AS count
  FROM batch_run_res_summary
) x 
ORDER BY x.type")


v_activeportionperc = (counts[4,3] / counts[5,3]) * 100
v_bikeportionperc = (counts[1,3] / counts[5,3]) * 100
v_walkportionperc = (counts[2,3] / counts[5,3]) * 100
v_ptportionperc = (counts[3,3] / counts[5,3]) * 100


counts_all <- dbGetQuery(con, "SELECT * FROM (
                     SELECT 1 AS type, 'bike_count' AS description, Count(DISTINCT batch_item_id) AS count
                         FROM batch_run_res_summary
                         WHERE mode_filter = 2
                         AND (bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801)
                         UNION
                         SELECT 2 AS type, 'walk_count' AS description, Count(DISTINCT batch_item_id) AS count
                         FROM batch_run_res_summary
                         WHERE mode_filter = 2
                         AND (walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                         UNION
                         SELECT 3 AS type, 'pt_count' AS description, Count(DISTINCT batch_item_id) AS count
                         FROM batch_run_res_summary
                         WHERE mode_filter = 2
                         AND (pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                         UNION
                         SELECT 4 AS type, 'active_count' AS description, Count(DISTINCT batch_item_id) AS count
                         FROM batch_run_res_summary
                         WHERE mode_filter = 2
                         AND (
                         (bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                         OR (walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                         OR (pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                         )
                         UNION
                         SELECT 5 AS type, 'item_count' AS description, Count(DISTINCT batch_item_id) AS count
                         FROM batch_run_res_summary
) x 
                         ORDER BY x.type")


v_activeportionperc_all = (counts_all[4,3] / counts_all[5,3]) * 100
v_bikeportionperc_all = (counts_all[1,3] / counts_all[5,3]) * 100
v_walkportionperc_all = (counts_all[2,3] / counts_all[5,3]) * 100
v_ptportionperc_all = (counts_all[3,3] / counts_all[5,3]) * 100


#Do it all again, this time with differnet speeds for active modes.
#4kph for walking (rather than the model of 5kph)
#20kph for cycling (rather than 15KPH)


counts_mod <- dbGetQuery(con, "SELECT * FROM (
                     SELECT 1 AS type, 'bike_count' AS description, Count(DISTINCT batch_item_id) AS count
                     FROM batch_run_res_summary
                     WHERE mode_filter = 2
                     AND ((delay_time_agg_cost + 600) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801)
                     UNION
                     SELECT 2 AS type, 'walk_count' AS description, Count(DISTINCT batch_item_id) AS count
                     FROM batch_run_res_summary
                     WHERE mode_filter = 2
                     AND ((delay_time_agg_cost + 600) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801)
                     UNION
                     SELECT 3 AS type, 'pt_count' AS description, Count(DISTINCT batch_item_id) AS count
                     FROM batch_run_res_summary
                     WHERE mode_filter = 2
                     AND ((delay_time_agg_cost + 600) > (pt_delay_time_agg_cost * 1.25) AND (pt_Active_time_agg_cost * 1.25) > 599 AND (pt_delay_time_agg_cost * 1.25) > 599 AND (pt_delay_time_agg_cost * 1.25) < 1801)                      
                     UNION
                     SELECT 4 AS type, 'active_count' AS description, Count(DISTINCT batch_item_id) AS count
                     FROM batch_run_res_summary
                     WHERE mode_filter = 2
                     AND (
                     ((delay_time_agg_cost + 600) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) 
                     OR ((delay_time_agg_cost + 600) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801)
                     OR ((delay_time_agg_cost + 600) > (pt_delay_time_agg_cost * 1.25) AND (pt_Active_time_agg_cost * 1.25) > 599 AND (pt_delay_time_agg_cost * 1.25) > 599 AND (pt_delay_time_agg_cost * 1.25) < 1801)                      
                     )
                     UNION
                     SELECT 5 AS type, 'item_count' AS description, Count(DISTINCT batch_item_id) AS count
                     FROM batch_run_res_summary
) x 
                     ORDER BY x.type")


v_activeportionperc_mod = (counts_mod[4,3] / counts_mod[5,3]) * 100
v_bikeportionperc_mod = (counts_mod[1,3] / counts_mod[5,3]) * 100
v_walkportionperc_mod = (counts_mod[2,3] / counts_mod[5,3]) * 100
v_ptportionperc_mod = (counts_mod[3,3] / counts_mod[5,3]) * 100


counts_mod_all <- dbGetQuery(con, "SELECT * FROM (
                         SELECT 1 AS type, 'bike_count' AS description, Count(DISTINCT batch_item_id) AS count
                         FROM batch_run_res_summary
                         WHERE mode_filter = 2
                         AND ((bike_delay_time_agg_cost* 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801)
                         UNION
                         SELECT 2 AS type, 'walk_count' AS description, Count(DISTINCT batch_item_id) AS count
                         FROM batch_run_res_summary
                         WHERE mode_filter = 2
                         AND ((walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801)
                         UNION
                         SELECT 3 AS type, 'pt_count' AS description, Count(DISTINCT batch_item_id) AS count
                         FROM batch_run_res_summary
                         WHERE mode_filter = 2
                         AND ((pt_Active_time_agg_cost * 1.25) > 599 AND (pt_delay_time_agg_cost * 1.25) > 599 AND (pt_delay_time_agg_cost * 1.25) < 1801)  
                         UNION
                         SELECT 4 AS type, 'active_count' AS description, Count(DISTINCT batch_item_id) AS count
                         FROM batch_run_res_summary
                         WHERE mode_filter = 2
                         AND (
                         ((bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) 
                         OR ((walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801)
                         OR ((pt_Active_time_agg_cost * 1.25) > 599 AND  (pt_delay_time_agg_cost * 1.25) > 599 AND (pt_delay_time_agg_cost * 1.25) < 1801)                      
                         )
                         UNION
                         SELECT 5 AS type, 'item_count' AS description, Count(DISTINCT batch_item_id) AS count
                         FROM batch_run_res_summary
) x 
                         ORDER BY x.type")


v_activeportionperc_mod_all = (counts_mod_all[4,3] / counts_mod_all[5,3]) * 100
v_bikeportionperc_mod_all = (counts_mod_all[1,3] / counts_mod_all[5,3]) * 100
v_walkportionperc_mod_all = (counts_mod_all[2,3] / counts_mod_all[5,3]) * 100
v_ptportionperc_mod_all = (counts_mod_all[3,3] / counts_mod_all[5,3]) * 100






















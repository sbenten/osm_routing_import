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



#Criteria for Goldilocks zone: minimum of 10 mins of activity, maximum of 30 mins
#But first, also consider within 10 mins of driving the car door to door (hence mode_filter =1)
counts_vs_car <- dbGetQuery(con, "SELECT * FROM (
                     SELECT 1 AS type, 'bike_count' AS description, Count(DISTINCT batch_item_id) AS total,
                     SUM(CASE WHEN (bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks,
                     SUM(CASE WHEN (delay_time_agg_cost  > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_0,
                     SUM(CASE WHEN ((delay_time_agg_cost + 60) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_1,
                     SUM(CASE WHEN ((delay_time_agg_cost + 120) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_2,
                     SUM(CASE WHEN ((delay_time_agg_cost + 180) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_3,
                     SUM(CASE WHEN ((delay_time_agg_cost + 240) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_4,
                     SUM(CASE WHEN ((delay_time_agg_cost + 300) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_5,
                     SUM(CASE WHEN ((delay_time_agg_cost + 360) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_6,
                     SUM(CASE WHEN ((delay_time_agg_cost + 420) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_7,
                     SUM(CASE WHEN ((delay_time_agg_cost + 480) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_8,
                     SUM(CASE WHEN ((delay_time_agg_cost + 540) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_9,
                     SUM(CASE WHEN ((delay_time_agg_cost + 600) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_10,
                     SUM(CASE WHEN ((delay_time_agg_cost + 660) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_11,
                     SUM(CASE WHEN ((delay_time_agg_cost + 720) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_12
                     FROM batch_run_res_summary
                     WHERE mode_filter = 1 AND exclude_stats = false
                     UNION
                     SELECT 2 AS type, 'walk_count' AS description, Count(DISTINCT batch_item_id) AS count,
                     SUM(CASE WHEN (walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks,
                     SUM(CASE WHEN (delay_time_agg_cost  > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_0,
                     SUM(CASE WHEN ((delay_time_agg_cost + 60) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_1,
                     SUM(CASE WHEN ((delay_time_agg_cost + 120) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_2,
                     SUM(CASE WHEN ((delay_time_agg_cost + 180) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_3,
                     SUM(CASE WHEN ((delay_time_agg_cost + 240) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_4,
                     SUM(CASE WHEN ((delay_time_agg_cost + 300) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_5,
                     SUM(CASE WHEN ((delay_time_agg_cost + 360) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_6,
                     SUM(CASE WHEN ((delay_time_agg_cost + 420) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_7,
                     SUM(CASE WHEN ((delay_time_agg_cost + 480) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_8,
                     SUM(CASE WHEN ((delay_time_agg_cost + 540) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_9,
                     SUM(CASE WHEN ((delay_time_agg_cost + 600) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_10,
                     SUM(CASE WHEN ((delay_time_agg_cost + 660) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_11,
                     SUM(CASE WHEN ((delay_time_agg_cost + 720) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_12
                     FROM batch_run_res_summary
                     WHERE mode_filter = 1 AND exclude_stats = false
                     UNION
                     SELECT 3 AS type, 'pt_count' AS description, Count(DISTINCT batch_item_id) AS count,
                     SUM(CASE WHEN (pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks,
                     SUM(CASE WHEN (delay_time_agg_cost  > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_0,
                     SUM(CASE WHEN ((delay_time_agg_cost + 60) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_1,
                     SUM(CASE WHEN ((delay_time_agg_cost + 120) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_2,
                     SUM(CASE WHEN ((delay_time_agg_cost + 180) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_3,
                     SUM(CASE WHEN ((delay_time_agg_cost + 240) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_4,
                     SUM(CASE WHEN ((delay_time_agg_cost + 300) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_5,
                     SUM(CASE WHEN ((delay_time_agg_cost + 360) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_6,
                     SUM(CASE WHEN ((delay_time_agg_cost + 420) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_7,
                     SUM(CASE WHEN ((delay_time_agg_cost + 480) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_8,
                     SUM(CASE WHEN ((delay_time_agg_cost + 540) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_9,
                     SUM(CASE WHEN ((delay_time_agg_cost + 600) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_10,
                     SUM(CASE WHEN ((delay_time_agg_cost + 660) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_11,
                     SUM(CASE WHEN ((delay_time_agg_cost + 720) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_12
                     FROM batch_run_res_summary
                     WHERE mode_filter = 1 AND exclude_stats = false                  
                     UNION
                     SELECT 4 AS type, 'active_count' AS description, Count(DISTINCT batch_item_id) AS count,
                     SUM(CASE WHEN ((bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR (walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR (pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks,
                     SUM(CASE WHEN ((delay_time_agg_cost > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR (delay_time_agg_cost > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR (delay_time_agg_cost > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_0,
                     SUM(CASE WHEN (((delay_time_agg_cost + 60) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 60) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 60) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_1,
                     SUM(CASE WHEN (((delay_time_agg_cost + 120) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 120) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 120) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_2,
                     SUM(CASE WHEN (((delay_time_agg_cost + 180) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 180) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 180) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_3,
                     SUM(CASE WHEN (((delay_time_agg_cost + 240) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 240) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 240) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_4,
                     SUM(CASE WHEN (((delay_time_agg_cost + 300) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 300) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 300) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_5,
                     SUM(CASE WHEN (((delay_time_agg_cost + 360) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 360) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 360) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_6,
                     SUM(CASE WHEN (((delay_time_agg_cost + 420) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 420) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 420) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_7,
                     SUM(CASE WHEN (((delay_time_agg_cost + 480) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 480) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 480) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_8,
                     SUM(CASE WHEN (((delay_time_agg_cost + 540) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 540) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 540) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_9,
                     SUM(CASE WHEN (((delay_time_agg_cost + 600) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 600) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 600) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_10,
                     SUM(CASE WHEN (((delay_time_agg_cost + 660) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 660) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 660) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_11,
                     SUM(CASE WHEN (((delay_time_agg_cost + 720) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 720) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 720) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_12
                     FROM batch_run_res_summary
                     WHERE mode_filter = 1 AND exclude_stats = false
) x 
                     ORDER BY x.type")

bike_vs_count <- subset(counts_vs_car, description=="bike_count")
walk_vs_count <- subset(counts_vs_car, description=="walk_count")
pt_vs_count <- subset(counts_vs_car, description=="pt_count")
active_vs_count <- subset(counts_vs_car, description=="active_count")





#Criteria for Goldilocks zone: minimum of 10 mins of activity, maximum of 30 mins
#But first, also consider within 10 mins of parking the car (hence mode_filter =2)
counts <- dbGetQuery(con, "SELECT * FROM (
  SELECT 1 AS type, 'bike_count' AS description, Count(DISTINCT batch_item_id) AS total,
                     SUM(CASE WHEN (bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks,
                     SUM(CASE WHEN (delay_time_agg_cost  > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_0,
                     SUM(CASE WHEN ((delay_time_agg_cost + 60) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_1,
                     SUM(CASE WHEN ((delay_time_agg_cost + 120) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_2,
                     SUM(CASE WHEN ((delay_time_agg_cost + 180) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_3,
                     SUM(CASE WHEN ((delay_time_agg_cost + 240) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_4,
                     SUM(CASE WHEN ((delay_time_agg_cost + 300) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_5,
                     SUM(CASE WHEN ((delay_time_agg_cost + 360) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_6,
                     SUM(CASE WHEN ((delay_time_agg_cost + 420) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_7,
                     SUM(CASE WHEN ((delay_time_agg_cost + 480) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_8,
                     SUM(CASE WHEN ((delay_time_agg_cost + 540) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_9,
                     SUM(CASE WHEN ((delay_time_agg_cost + 600) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_10,
                     SUM(CASE WHEN ((delay_time_agg_cost + 660) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_11,
                     SUM(CASE WHEN ((delay_time_agg_cost + 720) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_12
                     FROM batch_run_res_summary
                     WHERE mode_filter = 2 AND exclude_stats = false
                     UNION
                     SELECT 2 AS type, 'walk_count' AS description, Count(DISTINCT batch_item_id) AS count,
                     SUM(CASE WHEN (walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks,
                     SUM(CASE WHEN (delay_time_agg_cost  > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_0,
                     SUM(CASE WHEN ((delay_time_agg_cost + 60) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_1,
                     SUM(CASE WHEN ((delay_time_agg_cost + 120) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_2,
                     SUM(CASE WHEN ((delay_time_agg_cost + 180) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_3,
                     SUM(CASE WHEN ((delay_time_agg_cost + 240) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_4,
                     SUM(CASE WHEN ((delay_time_agg_cost + 300) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_5,
                     SUM(CASE WHEN ((delay_time_agg_cost + 360) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_6,
                     SUM(CASE WHEN ((delay_time_agg_cost + 420) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_7,
                     SUM(CASE WHEN ((delay_time_agg_cost + 480) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_8,
                     SUM(CASE WHEN ((delay_time_agg_cost + 540) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_9,
                     SUM(CASE WHEN ((delay_time_agg_cost + 600) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_10,
                     SUM(CASE WHEN ((delay_time_agg_cost + 660) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_11,
                     SUM(CASE WHEN ((delay_time_agg_cost + 720) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_12
                     FROM batch_run_res_summary
                     WHERE mode_filter = 2 AND exclude_stats = false
                     UNION
                     SELECT 3 AS type, 'pt_count' AS description, Count(DISTINCT batch_item_id) AS count,
                     SUM(CASE WHEN (pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks,
                     SUM(CASE WHEN (delay_time_agg_cost  > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_0,
                     SUM(CASE WHEN ((delay_time_agg_cost + 60) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_1,
                     SUM(CASE WHEN ((delay_time_agg_cost + 120) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_2,
                     SUM(CASE WHEN ((delay_time_agg_cost + 180) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_3,
                     SUM(CASE WHEN ((delay_time_agg_cost + 240) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_4,
                     SUM(CASE WHEN ((delay_time_agg_cost + 300) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_5,
                     SUM(CASE WHEN ((delay_time_agg_cost + 360) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_6,
                     SUM(CASE WHEN ((delay_time_agg_cost + 420) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_7,
                     SUM(CASE WHEN ((delay_time_agg_cost + 480) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_8,
                     SUM(CASE WHEN ((delay_time_agg_cost + 540) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_9,
                     SUM(CASE WHEN ((delay_time_agg_cost + 600) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_10,
                     SUM(CASE WHEN ((delay_time_agg_cost + 660) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_11,
                     SUM(CASE WHEN ((delay_time_agg_cost + 720) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND pt_Active_time_agg_cost < 1801) THEN 1 ELSE 0 END) AS goldilocks_12
                     FROM batch_run_res_summary
                     WHERE mode_filter = 2 AND exclude_stats = false                  
                     UNION
                     SELECT 4 AS type, 'active_count' AS description, Count(DISTINCT batch_item_id) AS count,
                     SUM(CASE WHEN ((bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR (walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR (pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks,
                     SUM(CASE WHEN ((delay_time_agg_cost > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR (delay_time_agg_cost > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR (delay_time_agg_cost > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_0,
                     SUM(CASE WHEN (((delay_time_agg_cost + 60) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 60) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 60) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_1,
                     SUM(CASE WHEN (((delay_time_agg_cost + 120) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 120) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 120) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_2,
                     SUM(CASE WHEN (((delay_time_agg_cost + 180) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 180) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 180) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_3,
                     SUM(CASE WHEN (((delay_time_agg_cost + 240) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 240) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 240) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_4,
                     SUM(CASE WHEN (((delay_time_agg_cost + 300) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 300) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 300) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_5,
                     SUM(CASE WHEN (((delay_time_agg_cost + 360) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 360) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 360) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_6,
                     SUM(CASE WHEN (((delay_time_agg_cost + 420) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 420) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 420) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_7,
                     SUM(CASE WHEN (((delay_time_agg_cost + 480) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 480) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 480) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_8,
                     SUM(CASE WHEN (((delay_time_agg_cost + 540) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 540) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 540) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_9,
                     SUM(CASE WHEN (((delay_time_agg_cost + 600) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 600) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 600) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_10,
                     SUM(CASE WHEN (((delay_time_agg_cost + 660) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 660) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 660) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_11,
                     SUM(CASE WHEN (((delay_time_agg_cost + 720) > bike_delay_time_agg_cost AND bike_delay_time_agg_cost > 599 AND bike_delay_time_agg_cost < 1801) 
                     OR ((delay_time_agg_cost + 720) > walk_delay_time_agg_cost AND walk_delay_time_agg_cost > 599 AND walk_delay_time_agg_cost < 1801)
                     OR ((delay_time_agg_cost + 720) > pt_delay_time_agg_cost AND pt_Active_time_agg_cost > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                     ) THEN 1 ELSE 0 END) AS goldilocks_12
                     FROM batch_run_res_summary
                     WHERE mode_filter = 2 AND exclude_stats = false
) x 
                     ORDER BY x.type")

bike_count <- subset(counts, description=="bike_count")
walk_count <- subset(counts, description=="walk_count")
pt_count <- subset(counts, description=="pt_count")
active_count <- subset(counts, description=="active_count")

v_activeportionperc_all = (active_count$goldilocks / active_count$total) * 100
v_bikeportionperc_all = (bike_count$goldilocks / bike_count$total) * 100
v_walkportionperc_all = (walk_count$goldilocks / walk_count$total) * 100
v_ptportionperc_all = (pt_count$goldilocks / pt_count$total) * 100

v_activeportionperc = (active_count$goldilocks_10 / active_count$total) * 100
v_bikeportionperc = (bike_count$goldilocks_10 / bike_count$total) * 100
v_walkportionperc = (walk_count$goldilocks_10 / walk_count$total) * 100
v_ptportionperc = (pt_count$goldilocks_10 / pt_count$total) * 100


#Do it all again, this time with different speeds for active modes.
#4kph for walking (rather than the model of 5kph)
#20kph for cycling (rather than 15KPH)


counts_mod <- dbGetQuery(con, "SELECT * FROM (
  SELECT 1 AS type, 'bike_count' AS description, Count(DISTINCT batch_item_id) AS total,
                         SUM(CASE WHEN ((bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) THEN 1 ELSE 0 END) AS goldilocks,
                         SUM(CASE WHEN (delay_time_agg_cost  > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) THEN 1 ELSE 0 END) AS goldilocks_0,
                         SUM(CASE WHEN ((delay_time_agg_cost + 60) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) THEN 1 ELSE 0 END) AS goldilocks_1,
                         SUM(CASE WHEN ((delay_time_agg_cost + 120) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) THEN 1 ELSE 0 END) AS goldilocks_2,
                         SUM(CASE WHEN ((delay_time_agg_cost + 180) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) THEN 1 ELSE 0 END) AS goldilocks_3,
                         SUM(CASE WHEN ((delay_time_agg_cost + 240) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) THEN 1 ELSE 0 END) AS goldilocks_4,
                         SUM(CASE WHEN ((delay_time_agg_cost + 300) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) THEN 1 ELSE 0 END) AS goldilocks_5,
                         SUM(CASE WHEN ((delay_time_agg_cost + 360) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) THEN 1 ELSE 0 END) AS goldilocks_6,
                         SUM(CASE WHEN ((delay_time_agg_cost + 420) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) THEN 1 ELSE 0 END) AS goldilocks_7,
                         SUM(CASE WHEN ((delay_time_agg_cost + 480) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) THEN 1 ELSE 0 END) AS goldilocks_8,
                         SUM(CASE WHEN ((delay_time_agg_cost + 540) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) THEN 1 ELSE 0 END) AS goldilocks_9,
                         SUM(CASE WHEN ((delay_time_agg_cost + 600) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) THEN 1 ELSE 0 END) AS goldilocks_10,
                         SUM(CASE WHEN ((delay_time_agg_cost + 660) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) THEN 1 ELSE 0 END) AS goldilocks_11,
                         SUM(CASE WHEN ((delay_time_agg_cost + 720) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) THEN 1 ELSE 0 END) AS goldilocks_12
                         FROM batch_run_res_summary
                         WHERE mode_filter = 2 AND exclude_stats = false
                         UNION
                         SELECT 2 AS type, 'walk_count' AS description, Count(DISTINCT batch_item_id) AS count,
                         SUM(CASE WHEN ((walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks,
                         SUM(CASE WHEN (delay_time_agg_cost  > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_0,
                         SUM(CASE WHEN ((delay_time_agg_cost + 60) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_1,
                         SUM(CASE WHEN ((delay_time_agg_cost + 120) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_2,
                         SUM(CASE WHEN ((delay_time_agg_cost + 180) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_3,
                         SUM(CASE WHEN ((delay_time_agg_cost + 240) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_4,
                         SUM(CASE WHEN ((delay_time_agg_cost + 300) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_5,
                         SUM(CASE WHEN ((delay_time_agg_cost + 360) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_6,
                         SUM(CASE WHEN ((delay_time_agg_cost + 420) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_7,
                         SUM(CASE WHEN ((delay_time_agg_cost + 480) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_8,
                         SUM(CASE WHEN ((delay_time_agg_cost + 540) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_9,
                         SUM(CASE WHEN ((delay_time_agg_cost + 600) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_10,
                         SUM(CASE WHEN ((delay_time_agg_cost + 660) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_11,
                         SUM(CASE WHEN ((delay_time_agg_cost + 720) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_12
                         FROM batch_run_res_summary
                         WHERE mode_filter = 2 AND exclude_stats = false
                         UNION
                         SELECT 3 AS type, 'pt_count' AS description, Count(DISTINCT batch_item_id) AS count,
                         SUM(CASE WHEN ((pt_Active_time_agg_cost * 1.25) > 599 AND (pt_Active_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks,
                         SUM(CASE WHEN (delay_time_agg_cost  > (pt_delay_time_agg_cost - pt_Active_time_agg_cost + (pt_Active_time_agg_cost * 1.25)) AND pt_Active_time_agg_cost > 599 AND (pt_Active_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_0,
                         SUM(CASE WHEN ((delay_time_agg_cost + 60) > (pt_delay_time_agg_cost - pt_Active_time_agg_cost + (pt_Active_time_agg_cost * 1.25)) AND (pt_Active_time_agg_cost * 1.25) > 599 AND (pt_Active_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_1,
                         SUM(CASE WHEN ((delay_time_agg_cost + 120) > (pt_delay_time_agg_cost - pt_Active_time_agg_cost + (pt_Active_time_agg_cost * 1.25)) AND (pt_Active_time_agg_cost * 1.25) > 599 AND (pt_Active_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_2,
                         SUM(CASE WHEN ((delay_time_agg_cost + 180) > (pt_delay_time_agg_cost - pt_Active_time_agg_cost + (pt_Active_time_agg_cost * 1.25)) AND (pt_Active_time_agg_cost * 1.25) > 599 AND (pt_Active_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_3,
                         SUM(CASE WHEN ((delay_time_agg_cost + 240) > (pt_delay_time_agg_cost - pt_Active_time_agg_cost + (pt_Active_time_agg_cost * 1.25)) AND (pt_Active_time_agg_cost * 1.25) > 599 AND (pt_Active_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_4,
                         SUM(CASE WHEN ((delay_time_agg_cost + 300) > (pt_delay_time_agg_cost - pt_Active_time_agg_cost + (pt_Active_time_agg_cost * 1.25)) AND (pt_Active_time_agg_cost * 1.25) > 599 AND (pt_Active_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_5,
                         SUM(CASE WHEN ((delay_time_agg_cost + 360) > (pt_delay_time_agg_cost - pt_Active_time_agg_cost + (pt_Active_time_agg_cost * 1.25)) AND (pt_Active_time_agg_cost * 1.25) > 599 AND (pt_Active_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_6,
                         SUM(CASE WHEN ((delay_time_agg_cost + 420) > (pt_delay_time_agg_cost - pt_Active_time_agg_cost + (pt_Active_time_agg_cost * 1.25)) AND (pt_Active_time_agg_cost * 1.25) > 599 AND (pt_Active_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_7,
                         SUM(CASE WHEN ((delay_time_agg_cost + 480) > (pt_delay_time_agg_cost - pt_Active_time_agg_cost + (pt_Active_time_agg_cost * 1.25)) AND (pt_Active_time_agg_cost * 1.25) > 599 AND (pt_Active_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_8,
                         SUM(CASE WHEN ((delay_time_agg_cost + 540) > (pt_delay_time_agg_cost - pt_Active_time_agg_cost + (pt_Active_time_agg_cost * 1.25)) AND (pt_Active_time_agg_cost * 1.25) > 599 AND (pt_Active_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_9,
                         SUM(CASE WHEN ((delay_time_agg_cost + 600) > (pt_delay_time_agg_cost - pt_Active_time_agg_cost + (pt_Active_time_agg_cost * 1.25)) AND (pt_Active_time_agg_cost * 1.25) > 599 AND (pt_Active_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_10,
                         SUM(CASE WHEN ((delay_time_agg_cost + 660) > (pt_delay_time_agg_cost - pt_Active_time_agg_cost + (pt_Active_time_agg_cost * 1.25)) AND (pt_Active_time_agg_cost * 1.25) > 599 AND (pt_Active_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_11,
                         SUM(CASE WHEN ((delay_time_agg_cost + 720) > (pt_delay_time_agg_cost - pt_Active_time_agg_cost + (pt_Active_time_agg_cost * 1.25)) AND (pt_Active_time_agg_cost * 1.25) > 599 AND (pt_Active_time_agg_cost * 1.25) < 1801) THEN 1 ELSE 0 END) AS goldilocks_12
                         FROM batch_run_res_summary
                         WHERE mode_filter = 2 AND exclude_stats = false                  
                         UNION
                         SELECT 4 AS type, 'active_count' AS description, Count(DISTINCT batch_item_id) AS count,
                         SUM(CASE WHEN (((bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) 
                         OR ((walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801)
                         OR ((pt_Active_time_agg_cost * 1.25) > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                         ) THEN 1 ELSE 0 END) AS goldilocks,
                         SUM(CASE WHEN ((delay_time_agg_cost > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) 
                         OR (delay_time_agg_cost > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801)
                         OR (delay_time_agg_cost > pt_delay_time_agg_cost AND (pt_Active_time_agg_cost * 1.25) > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                         ) THEN 1 ELSE 0 END) AS goldilocks_0,
                         SUM(CASE WHEN (((delay_time_agg_cost + 60) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) 
                         OR ((delay_time_agg_cost + 60) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801)
                         OR ((delay_time_agg_cost + 60) > pt_delay_time_agg_cost AND (pt_Active_time_agg_cost * 1.25) > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                         ) THEN 1 ELSE 0 END) AS goldilocks_1,
                         SUM(CASE WHEN (((delay_time_agg_cost + 120) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) 
                         OR ((delay_time_agg_cost + 120) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801)
                         OR ((delay_time_agg_cost + 120) > pt_delay_time_agg_cost AND (pt_Active_time_agg_cost * 1.25) > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                         ) THEN 1 ELSE 0 END) AS goldilocks_2,
                         SUM(CASE WHEN (((delay_time_agg_cost + 180) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) 
                         OR ((delay_time_agg_cost + 180) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801)
                         OR ((delay_time_agg_cost + 180) > pt_delay_time_agg_cost AND (pt_Active_time_agg_cost * 1.25) > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                         ) THEN 1 ELSE 0 END) AS goldilocks_3,
                         SUM(CASE WHEN (((delay_time_agg_cost + 240) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) 
                         OR ((delay_time_agg_cost + 240) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801)
                         OR ((delay_time_agg_cost + 240) > pt_delay_time_agg_cost AND (pt_Active_time_agg_cost * 1.25) > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                         ) THEN 1 ELSE 0 END) AS goldilocks_4,
                         SUM(CASE WHEN (((delay_time_agg_cost + 300) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) 
                         OR ((delay_time_agg_cost + 300) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801)
                         OR ((delay_time_agg_cost + 300) > pt_delay_time_agg_cost AND (pt_Active_time_agg_cost * 1.25) > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                         ) THEN 1 ELSE 0 END) AS goldilocks_5,
                         SUM(CASE WHEN (((delay_time_agg_cost + 360) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) 
                         OR ((delay_time_agg_cost + 360) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801)
                         OR ((delay_time_agg_cost + 360) > pt_delay_time_agg_cost AND (pt_Active_time_agg_cost * 1.25) > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                         ) THEN 1 ELSE 0 END) AS goldilocks_6,
                         SUM(CASE WHEN (((delay_time_agg_cost + 420) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) 
                         OR ((delay_time_agg_cost + 420) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801)
                         OR ((delay_time_agg_cost + 420) > pt_delay_time_agg_cost AND (pt_Active_time_agg_cost * 1.25) > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                         ) THEN 1 ELSE 0 END) AS goldilocks_7,
                         SUM(CASE WHEN (((delay_time_agg_cost + 480) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) 
                         OR ((delay_time_agg_cost + 480) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801)
                         OR ((delay_time_agg_cost + 480) > pt_delay_time_agg_cost AND (pt_Active_time_agg_cost * 1.25) > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                         ) THEN 1 ELSE 0 END) AS goldilocks_8,
                         SUM(CASE WHEN (((delay_time_agg_cost + 540) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) 
                         OR ((delay_time_agg_cost + 540) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801)
                         OR ((delay_time_agg_cost + 540) > pt_delay_time_agg_cost AND (pt_Active_time_agg_cost * 1.25) > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                         ) THEN 1 ELSE 0 END) AS goldilocks_9,
                         SUM(CASE WHEN (((delay_time_agg_cost + 600) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) 
                         OR ((delay_time_agg_cost + 600) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801)
                         OR ((delay_time_agg_cost + 600) > pt_delay_time_agg_cost AND (pt_Active_time_agg_cost * 1.25) > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                         ) THEN 1 ELSE 0 END) AS goldilocks_10,
                         SUM(CASE WHEN (((delay_time_agg_cost + 660) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) 
                         OR ((delay_time_agg_cost + 660) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801)
                         OR ((delay_time_agg_cost + 660) > pt_delay_time_agg_cost AND (pt_Active_time_agg_cost * 1.25) > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                         ) THEN 1 ELSE 0 END) AS goldilocks_11,
                         SUM(CASE WHEN (((delay_time_agg_cost + 720) > (bike_delay_time_agg_cost * 0.75) AND (bike_delay_time_agg_cost * 0.75) > 599 AND (bike_delay_time_agg_cost * 0.75) < 1801) 
                         OR ((delay_time_agg_cost + 720) > (walk_delay_time_agg_cost * 1.25) AND (walk_delay_time_agg_cost * 1.25) > 599 AND (walk_delay_time_agg_cost * 1.25) < 1801)
                         OR ((delay_time_agg_cost + 720) > pt_delay_time_agg_cost AND (pt_Active_time_agg_cost * 1.25) > 599 AND  pt_delay_time_agg_cost > 599 AND pt_delay_time_agg_cost < 1801)                      
                         ) THEN 1 ELSE 0 END) AS goldilocks_12
                         FROM batch_run_res_summary
                         WHERE mode_filter = 2 AND exclude_stats = false
) x 
                         ORDER BY x.type")

bike_count_mod <- subset(counts_mod, description=="bike_count")
walk_count_mod <- subset(counts_mod, description=="walk_count")
pt_count_mod <- subset(counts_mod, description=="pt_count")
active_count_mod <- subset(counts_mod, description=="active_count")

v_activeportionperc_mod_all = (active_count_mod$goldilocks / active_count_mod$total) * 100
v_bikeportionperc_mod_all = (bike_count_mod$goldilocks / bike_count_mod$total) * 100
v_walkportionperc_mod_all = (walk_count_mod$goldilocks / walk_count_mod$total) * 100
v_ptportionperc_mod_all = (pt_count_mod$goldilocks / pt_count_mod$total) * 100

v_activeportionperc_mod = (active_count_mod$goldilocks_10 / active_count_mod$total) * 100
v_bikeportionperc_mod = (bike_count_mod$goldilocks_10 / bike_count_mod$total) * 100
v_walkportionperc_mod = (walk_count_mod$goldilocks_10 / walk_count_mod$total) * 100
v_ptportionperc_mod = (pt_count_mod$goldilocks_10 / pt_count_mod$total) * 100





#Now some basic plots of the percentage of active modes faster than the car (door to door)
#with increasing additional delays to the car

v_temp0 <- 100 * (bike_vs_count$goldilocks_0 / bike_vs_count$total)
v_temp1 <- 100 * (bike_vs_count$goldilocks_1 / bike_vs_count$total)
v_temp2 <- 100 * (bike_vs_count$goldilocks_2 / bike_vs_count$total)
v_temp3 <- 100 * (bike_vs_count$goldilocks_3 / bike_vs_count$total)
v_temp4 <- 100 * (bike_vs_count$goldilocks_4 / bike_vs_count$total)
v_temp5 <- 100 * (bike_vs_count$goldilocks_5 / bike_vs_count$total)
v_temp6 <- 100 * (bike_vs_count$goldilocks_6 / bike_vs_count$total)
v_temp7 <- 100 * (bike_vs_count$goldilocks_7 / bike_vs_count$total)
v_temp8 <- 100 * (bike_vs_count$goldilocks_8 / bike_vs_count$total)
v_temp9 <- 100 * (bike_vs_count$goldilocks_9 / bike_vs_count$total)
v_temp10 <- 100 * (bike_vs_count$goldilocks_10 / bike_vs_count$total)
v_temp11 <- 100 * (bike_vs_count$goldilocks_11 / bike_vs_count$total)
v_temp12 <- 100 * (bike_vs_count$goldilocks_12 / bike_vs_count$total)

perc <- c(v_temp0, v_temp1, v_temp2, v_temp3, v_temp4, v_temp5, v_temp6, v_temp7, v_temp8, v_temp9, v_temp10, v_temp11,v_temp12)
delay <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
bike_vs_car <- data.frame(delay, perc)

v_temp0 <- 100 * (walk_vs_count$goldilocks_0 / walk_vs_count$total)
v_temp1 <- 100 * (walk_vs_count$goldilocks_1 / walk_vs_count$total)
v_temp2 <- 100 * (walk_vs_count$goldilocks_2 / walk_vs_count$total)
v_temp3 <- 100 * (walk_vs_count$goldilocks_3 / walk_vs_count$total)
v_temp4 <- 100 * (walk_vs_count$goldilocks_4 / walk_vs_count$total)
v_temp5 <- 100 * (walk_vs_count$goldilocks_5 / walk_vs_count$total)
v_temp6 <- 100 * (walk_vs_count$goldilocks_6 / walk_vs_count$total)
v_temp7 <- 100 * (walk_vs_count$goldilocks_7 / walk_vs_count$total)
v_temp8 <- 100 * (walk_vs_count$goldilocks_8 / walk_vs_count$total)
v_temp9 <- 100 * (walk_vs_count$goldilocks_9 / walk_vs_count$total)
v_temp10 <- 100 * (walk_vs_count$goldilocks_10 / walk_vs_count$total)
v_temp11 <- 100 * (walk_vs_count$goldilocks_11 / walk_vs_count$total)
v_temp12 <- 100 * (walk_vs_count$goldilocks_12 / walk_vs_count$total)

perc <- c(v_temp0, v_temp1, v_temp2, v_temp3, v_temp4, v_temp5, v_temp6, v_temp7, v_temp8, v_temp9, v_temp10, v_temp11,v_temp12)
delay <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
walk_vs_car <- data.frame(delay, perc)

v_temp0 <- 100 * (pt_vs_count$goldilocks_0 / pt_vs_count$total)
v_temp1 <- 100 * (pt_vs_count$goldilocks_1 / pt_vs_count$total)
v_temp2 <- 100 * (pt_vs_count$goldilocks_2 / pt_vs_count$total)
v_temp3 <- 100 * (pt_vs_count$goldilocks_3 / pt_vs_count$total)
v_temp4 <- 100 * (pt_vs_count$goldilocks_4 / pt_vs_count$total)
v_temp5 <- 100 * (pt_vs_count$goldilocks_5 / pt_vs_count$total)
v_temp6 <- 100 * (pt_vs_count$goldilocks_6 / pt_vs_count$total)
v_temp7 <- 100 * (pt_vs_count$goldilocks_7 / pt_vs_count$total)
v_temp8 <- 100 * (pt_vs_count$goldilocks_8 / pt_vs_count$total)
v_temp9 <- 100 * (pt_vs_count$goldilocks_9 / pt_vs_count$total)
v_temp10 <- 100 * (pt_vs_count$goldilocks_10 / pt_vs_count$total)
v_temp11 <- 100 * (pt_vs_count$goldilocks_11 / pt_vs_count$total)
v_temp12 <- 100 * (pt_vs_count$goldilocks_12 / pt_vs_count$total)

perc <- c(v_temp0, v_temp1, v_temp2, v_temp3, v_temp4, v_temp5, v_temp6, v_temp7, v_temp8, v_temp9, v_temp10, v_temp11,v_temp12)
delay <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
pt_vs_car <- data.frame(delay, perc)

#PLOT of walking, cycling and public transport in the goldilocks zone vs driving the car door to door

cols <- c("Cycling"="#4daf4a","Public Transport"="#984ea3","Walking"="#ff7f00")
ggplot() + 
  geom_line(data=bike_vs_car, mapping=aes(x=bike_vs_car$delay, y=bike_vs_car$perc, colour="Cycling"), size=1.5) +
  geom_line(data=pt_vs_car, mapping=aes(x=pt_vs_car$delay, y=pt_vs_car$perc, colour="Public Transport"), size=1.5) +
  geom_line(data=walk_vs_car, mapping=aes(x=walk_vs_car$delay, y=walk_vs_car$perc, colour="Walking"), size=1.5) +
  labs(title="", x="Minutes within driving the car (door to door)", y="Percentage of commutes") +
  scale_x_continuous(breaks=c(0:12), labels=c("0","1","2","3","4","5","6","7","8","9","10","11","12")) +
  scale_y_continuous(limits=c(0, 50), breaks=c(0,10,20,30,40,50), labels=c("0","10","20","30","40","50")) +  scale_colour_manual(name="Mode", values=cols) +
  theme(panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA))



#Now some basic plots of the percentage of active modes faster than the car (with parking)
#with increasing additional delays to the car

v_temp0 <- 100 * (bike_count$goldilocks_0 / bike_count$total)
v_temp1 <- 100 * (bike_count$goldilocks_1 / bike_count$total)
v_temp2 <- 100 * (bike_count$goldilocks_2 / bike_count$total)
v_temp3 <- 100 * (bike_count$goldilocks_3 / bike_count$total)
v_temp4 <- 100 * (bike_count$goldilocks_4 / bike_count$total)
v_temp5 <- 100 * (bike_count$goldilocks_5 / bike_count$total)
v_temp6 <- 100 * (bike_count$goldilocks_6 / bike_count$total)
v_temp7 <- 100 * (bike_count$goldilocks_7 / bike_count$total)
v_temp8 <- 100 * (bike_count$goldilocks_8 / bike_count$total)
v_temp9 <- 100 * (bike_count$goldilocks_9 / bike_count$total)
v_temp10 <- 100 * (bike_count$goldilocks_10 / bike_count$total)
v_temp11 <- 100 * (bike_count$goldilocks_11 / bike_count$total)
v_temp12 <- 100 * (bike_count$goldilocks_12 / bike_count$total)

perc <- c(v_temp0, v_temp1, v_temp2, v_temp3, v_temp4, v_temp5, v_temp6, v_temp7, v_temp8, v_temp9, v_temp10, v_temp11,v_temp12)
delay <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
bike_beat_car <- data.frame(delay, perc)

v_temp0 <- 100 * (walk_count$goldilocks_0 / walk_count$total)
v_temp1 <- 100 * (walk_count$goldilocks_1 / walk_count$total)
v_temp2 <- 100 * (walk_count$goldilocks_2 / walk_count$total)
v_temp3 <- 100 * (walk_count$goldilocks_3 / walk_count$total)
v_temp4 <- 100 * (walk_count$goldilocks_4 / walk_count$total)
v_temp5 <- 100 * (walk_count$goldilocks_5 / walk_count$total)
v_temp6 <- 100 * (walk_count$goldilocks_6 / walk_count$total)
v_temp7 <- 100 * (walk_count$goldilocks_7 / walk_count$total)
v_temp8 <- 100 * (walk_count$goldilocks_8 / walk_count$total)
v_temp9 <- 100 * (walk_count$goldilocks_9 / walk_count$total)
v_temp10 <- 100 * (walk_count$goldilocks_10 / walk_count$total)
v_temp11 <- 100 * (walk_count$goldilocks_11 / walk_count$total)
v_temp12 <- 100 * (walk_count$goldilocks_12 / walk_count$total)

perc <- c(v_temp0, v_temp1, v_temp2, v_temp3, v_temp4, v_temp5, v_temp6, v_temp7, v_temp8, v_temp9, v_temp10, v_temp11,v_temp12)
delay <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
walk_beat_car <- data.frame(delay, perc)

v_temp0 <- 100 * (pt_count$goldilocks_0 / pt_count$total)
v_temp1 <- 100 * (pt_count$goldilocks_1 / pt_count$total)
v_temp2 <- 100 * (pt_count$goldilocks_2 / pt_count$total)
v_temp3 <- 100 * (pt_count$goldilocks_3 / pt_count$total)
v_temp4 <- 100 * (pt_count$goldilocks_4 / pt_count$total)
v_temp5 <- 100 * (pt_count$goldilocks_5 / pt_count$total)
v_temp6 <- 100 * (pt_count$goldilocks_6 / pt_count$total)
v_temp7 <- 100 * (pt_count$goldilocks_7 / pt_count$total)
v_temp8 <- 100 * (pt_count$goldilocks_8 / pt_count$total)
v_temp9 <- 100 * (pt_count$goldilocks_9 / pt_count$total)
v_temp10 <- 100 * (pt_count$goldilocks_10 / pt_count$total)
v_temp11 <- 100 * (pt_count$goldilocks_11 / pt_count$total)
v_temp12 <- 100 * (pt_count$goldilocks_12 / pt_count$total)

perc <- c(v_temp0, v_temp1, v_temp2, v_temp3, v_temp4, v_temp5, v_temp6, v_temp7, v_temp8, v_temp9, v_temp10, v_temp11,v_temp12)
delay <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
pt_beat_car <- data.frame(delay, perc)

#PLOT of walking, cycling and public transport in the goldilocks zone vs parking the car

cols <- c("Cycling"="#4daf4a","Public Transport"="#984ea3","Walking"="#ff7f00")
ggplot() + 
  geom_line(data=bike_beat_car, mapping=aes(x=bike_beat_car$delay, y=bike_beat_car$perc, colour="Cycling"), size=1.5) +
  geom_line(data=pt_beat_car, mapping=aes(x=pt_beat_car$delay, y=pt_beat_car$perc, colour="Public Transport"), size=1.5) +
  geom_line(data=walk_beat_car, mapping=aes(x=walk_beat_car$delay, y=walk_beat_car$perc, colour="Walking"), size=1.5) +
  labs(title="", x="Minutes within parking the car", y="Percentage of commutes") +
  scale_x_continuous(breaks=c(0:12), labels=c("0","1","2","3","4","5","6","7","8","9","10","11","12")) +
  scale_y_continuous(limits=c(0, 50), breaks=c(0,10,20,30,40,50), labels=c("0","10","20","30","40","50")) +  scale_colour_manual(name="Mode", values=cols) +
  theme(panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA))


v_temp0 <- 100 * (bike_count_mod$goldilocks_0 / bike_count_mod$total)
v_temp1 <- 100 * (bike_count_mod$goldilocks_1 / bike_count_mod$total)
v_temp2 <- 100 * (bike_count_mod$goldilocks_2 / bike_count_mod$total)
v_temp3 <- 100 * (bike_count_mod$goldilocks_3 / bike_count_mod$total)
v_temp4 <- 100 * (bike_count_mod$goldilocks_4 / bike_count_mod$total)
v_temp5 <- 100 * (bike_count_mod$goldilocks_5 / bike_count_mod$total)
v_temp6 <- 100 * (bike_count_mod$goldilocks_6 / bike_count_mod$total)
v_temp7 <- 100 * (bike_count_mod$goldilocks_7 / bike_count_mod$total)
v_temp8 <- 100 * (bike_count_mod$goldilocks_8 / bike_count_mod$total)
v_temp9 <- 100 * (bike_count_mod$goldilocks_9 / bike_count_mod$total)
v_temp10 <- 100 * (bike_count_mod$goldilocks_10 / bike_count_mod$total)
v_temp11 <- 100 * (bike_count_mod$goldilocks_11 / bike_count_mod$total)
v_temp12 <- 100 * (bike_count_mod$goldilocks_12 / bike_count_mod$total)

perc <- c(v_temp0, v_temp1, v_temp2, v_temp3, v_temp4, v_temp5, v_temp6, v_temp7, v_temp8, v_temp9, v_temp10, v_temp11,v_temp12)
delay <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
bike20_beat_car <- data.frame(delay, perc)

v_temp0 <- 100 * (walk_count_mod$goldilocks_0 / walk_count_mod$total)
v_temp1 <- 100 * (walk_count_mod$goldilocks_1 / walk_count_mod$total)
v_temp2 <- 100 * (walk_count_mod$goldilocks_2 / walk_count_mod$total)
v_temp3 <- 100 * (walk_count_mod$goldilocks_3 / walk_count_mod$total)
v_temp4 <- 100 * (walk_count_mod$goldilocks_4 / walk_count_mod$total)
v_temp5 <- 100 * (walk_count_mod$goldilocks_5 / walk_count_mod$total)
v_temp6 <- 100 * (walk_count_mod$goldilocks_6 / walk_count_mod$total)
v_temp7 <- 100 * (walk_count_mod$goldilocks_7 / walk_count_mod$total)
v_temp8 <- 100 * (walk_count_mod$goldilocks_8 / walk_count_mod$total)
v_temp9 <- 100 * (walk_count_mod$goldilocks_9 / walk_count_mod$total)
v_temp10 <- 100 * (walk_count_mod$goldilocks_10 / walk_count_mod$total)
v_temp11 <- 100 * (walk_count_mod$goldilocks_11 / walk_count_mod$total)
v_temp12 <- 100 * (walk_count_mod$goldilocks_12 / walk_count_mod$total)

perc <- c(v_temp0, v_temp1, v_temp2, v_temp3, v_temp4, v_temp5, v_temp6, v_temp7, v_temp8, v_temp9, v_temp10, v_temp11,v_temp12)
delay <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
walk4_beat_car <- data.frame(delay, perc)

v_temp0 <- 100 * (pt_count_mod$goldilocks_0 / pt_count_mod$total)
v_temp1 <- 100 * (pt_count_mod$goldilocks_1 / pt_count_mod$total)
v_temp2 <- 100 * (pt_count_mod$goldilocks_2 / pt_count_mod$total)
v_temp3 <- 100 * (pt_count_mod$goldilocks_3 / pt_count_mod$total)
v_temp4 <- 100 * (pt_count_mod$goldilocks_4 / pt_count_mod$total)
v_temp5 <- 100 * (pt_count_mod$goldilocks_5 / pt_count_mod$total)
v_temp6 <- 100 * (pt_count_mod$goldilocks_6 / pt_count_mod$total)
v_temp7 <- 100 * (pt_count_mod$goldilocks_7 / pt_count_mod$total)
v_temp8 <- 100 * (pt_count_mod$goldilocks_8 / pt_count_mod$total)
v_temp9 <- 100 * (pt_count_mod$goldilocks_9 / pt_count_mod$total)
v_temp10 <- 100 * (pt_count_mod$goldilocks_10 / pt_count_mod$total)
v_temp11 <- 100 * (pt_count_mod$goldilocks_11 / pt_count_mod$total)
v_temp12 <- 100 * (pt_count_mod$goldilocks_12 / pt_count_mod$total)

perc <- c(v_temp0, v_temp1, v_temp2, v_temp3, v_temp4, v_temp5, v_temp6, v_temp7, v_temp8, v_temp9, v_temp10, v_temp11,v_temp12)
delay <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
pt4_beat_car <- data.frame(delay, perc)

#PLOT of walking, cycling and public transport (with modified speeds) in the goldilocks zone vs parking the car

cols <- c("Cycling"="#4daf4a","Public Transport"="#984ea3","Walking"="#ff7f00")
ggplot() + 
  geom_line(data=bike_beat_car, mapping=aes(x=bike_beat_car$delay, y=bike_beat_car$perc, colour="Cycling"), size=1.5) +
  geom_line(data=bike20_beat_car, mapping=aes(x=bike20_beat_car$delay, y=bike20_beat_car$perc, colour="Cycling"), size=1.5, linetype="dashed") +
  geom_line(data=pt_beat_car, mapping=aes(x=pt_beat_car$delay, y=pt_beat_car$perc, colour="Public Transport"), size=1.5) +
  geom_line(data=pt4_beat_car, mapping=aes(x=pt4_beat_car$delay, y=pt4_beat_car$perc, colour="Public Transport"), size=1.5, linetype="dashed") +
  geom_line(data=walk_beat_car, mapping=aes(x=walk_beat_car$delay, y=walk_beat_car$perc, colour="Walking"), size=1.5) +
  geom_line(data=walk4_beat_car, mapping=aes(x=walk4_beat_car$delay, y=walk4_beat_car$perc, colour="Walking"), size=1.5, linetype="dashed") +
  labs(title="", x="Minutes within parking the car", y="Percentage of commutes") +
  scale_x_continuous(breaks=c(0:12), labels=c("0","1","2","3","4","5","6","7","8","9","10","11","12")) +
  scale_y_continuous(limits=c(0,50), breaks=c(0,10,20,30,40,50), labels=c("0","10","20","30","40","50")) +  scale_colour_manual(name="Mode", values=cols) +
  theme(panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA))


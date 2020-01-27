library("e1071")
library("ggplot2")
library("RPostgreSQL")

# 
# Basic stats and plots for commute mode summary
#

dbname <- {"production"}
dbuser <- {"postgres"}
dbport <- {"5432"}
dbpw <- {"xxxxxxxxxxxxxxxxxxxx"}
dbhost <- {"localhost"}
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname = dbname, host = dbhost, port = dbport, user = dbuser, password = dbpw)
rm(dbpw)

summary <- dbGetQuery(con, "SELECT 
                      batch_run_id,
                      batch_item_id,
                      group_id,
                      batch_item_description,
                      mode_filter,
                      CASE WHEN mode_filter = 1 THEN 'Car (door to door)'
                        WHEN mode_filter = 2 THEN 'Car (with parking)'
                        WHEN mode_filter = 3 THEN 'Cycling'
                        WHEN mode_filter = 4 THEN 'Walking'
                        WHEN mode_Filter = 6 THEN 'Public Transport'
                      END AS mode,
                      home_imd_code,
                      home_imd_name,
                      home_imd_rank,
                      home_decile,
                      'decile_' || (home_decile-1) AS cat_home_decile,
                      home_quintile,
                      'quintile_' || (home_quintile-1) AS cat_home_quintile,
                      home_imd_health_rank,
                      home_health_decile,
                      'decile_' || (home_health_decile-1) AS cat_home_health_decile,
                      home_health_quintile,
                      'quintile_' || (home_health_quintile-1) AS cat_home_health_quintile,
                      length_agg_cost,
                      CEIL(length_agg_cost / 1000) AS km_ceil_cost,
                      CEIL(length_agg_cost / 2000) * 2 AS km_2_ceil_cost,
                      CEIL(length_agg_cost / 3000) * 3 AS km_3_ceil_cost,
                      CEIL(length_agg_cost / 5000) * 5 AS km_5_ceil_cost,
                      time_agg_cost,
                      delay_time_agg_cost,
                      CEIL(delay_time_agg_cost / 60) AS delay_time_ceil_cost,
                      CEIL(delay_time_agg_cost / 120) * 2 AS delay_time_2_ceil_cost,
                      CEIL(delay_time_agg_cost / 300) * 5 AS delay_time_5_ceil_cost,
                      CEIL(delay_time_agg_cost / 600) * 10 AS delay_time_10_ceil_cost,
                      ascent_agg_cost,
                      descent_agg_cost,
                      met_agg_cost,
                      delay_met_agg_cost,
                      delay_time_agg_interval,
                      delay_time_agg_format,
                      female_minus_1sd_agg_calories,
                      female_average_agg_calories,
                      female_plus_1sd_agg_calories,
                      male_average_agg_calories,
                      male_minus_1sd_agg_calories,
                      male_plus_1sd_agg_calories,
                      active_length_agg_cost,
                      active_time_agg_cost,
                      active_ascent_agg_cost,
                      active_descent_agg_cost,
                      active_met_agg_cost,
                      active_delay_time_agg_interval,
                      active_delay_time_agg_format,
                      active_female_minus_1sd_agg_calories,
                      active_female_average_agg_calories,
                      active_female_plus_1sd_agg_calories,
                      active_male_minus_1sd_agg_calories,
                      active_male_average_agg_calories,
                      active_male_plus_1sd_agg_calories,
                      car_length_agg_cost,
                      car_time_agg_cost,
                      car_delay_time_agg_cost,
                      car_ascent_agg_cost,
                      car_descent_agg_cost,
                      car_met_agg_cost,
                      car_delay_met_agg_cost,
                      car_delay_time_agg_interval,
                      car_delay_time_agg_format,
                      car_female_minus_1sd_agg_calories,
                      car_female_average_agg_calories,
                      car_female_plus_1sd_agg_calories,
                      car_male_average_agg_calories,
                      car_male_minus_1sd_agg_calories,
                      car_male_plus_1sd_agg_calories,
                      car_active_length_agg_cost,
                      car_active_time_agg_cost,
                      car_active_ascent_agg_cost,
                      car_active_descent_agg_cost,
                      car_active_met_agg_cost,
                      car_active_delay_time_agg_interval,
                      car_active_delay_time_agg_format,
                      car_active_female_minus_1sd_agg_calories,
                      car_active_female_average_agg_calories,
                      car_active_female_plus_1sd_agg_calories,
                      car_active_male_minus_1sd_agg_calories,
                      car_active_male_average_agg_calories,
                      car_active_male_plus_1sd_agg_calories,
                      park_length_agg_cost,
                      park_time_agg_cost,
                      park_delay_time_agg_cost,
                      park_ascent_agg_cost,
                      park_descent_agg_cost,
                      park_met_agg_cost,
                      park_delay_met_agg_cost,
                      park_delay_time_agg_interval,
                      park_delay_time_agg_format,
                      park_female_minus_1sd_agg_calories,
                      park_female_average_agg_calories,
                      park_female_plus_1sd_agg_calories,
                      park_male_minus_1sd_agg_calories,
                      park_male_average_agg_calories,
                      park_male_plus_1sd_agg_calories,
                      park_active_length_agg_cost,
                      park_active_time_agg_cost,
                      park_active_ascent_agg_cost,
                      park_active_descent_agg_cost,
                      park_active_met_agg_cost,
                      park_active_delay_time_agg_interval,
                      park_active_delay_time_agg_format,
                      park_active_female_minus_1sd_agg_calories,
                      park_active_female_average_agg_calories,
                      park_active_female_plus_1sd_agg_calories,
                      park_active_male_minus_1sd_agg_calories,
                      park_active_male_average_agg_calories,
                      park_active_male_plus_1sd_agg_calories,
                      bike_length_agg_cost,
                      bike_time_agg_cost,
                      bike_delay_time_agg_cost,
                      bike_ascent_agg_cost,
                      bike_descent_agg_cost,
                      bike_met_agg_cost,
                      bike_delay_met_agg_cost,
                      bike_delay_time_agg_interval,
                      bike_delay_time_agg_format,
                      bike_female_minus_1sd_agg_calories,
                      bike_female_average_agg_calories,
                      bike_female_plus_1sd_agg_calories,
                      bike_male_minus_1sd_agg_calories,
                      bike_male_average_agg_calories,
                      bike_male_plus_1sd_agg_calories,
                      bike_active_length_agg_cost,
                      bike_active_time_agg_cost,
                      bike_active_ascent_agg_cost,
                      bike_active_descent_agg_cost,
                      bike_active_met_agg_cost,
                      bike_active_delay_time_agg_interval,
                      bike_active_delay_time_agg_format,
                      bike_active_female_minus_1sd_agg_calories,
                      bike_active_female_average_agg_calories,
                      bike_active_female_plus_1sd_agg_calories,
                      bike_active_male_minus_1sd_agg_calories,
                      bike_active_male_average_agg_calories,
                      bike_active_male_plus_1sd_agg_calories,
                      (bike_time_agg_cost * 0.75) AS  bike20_time_agg_cost, --Cycling at 20kph rather than 15kph
                      (bike_delay_time_agg_cost * 0.75) AS bike20_delay_time_agg_cost,
                      (bike_met_agg_cost * 0.75) AS bike20_met_agg_cost,
                      (bike_delay_met_agg_cost * 0.75) AS bike20_delay_met_agg_cost,
                      (bike_active_time_agg_cost * 0.75) AS bike20_active_time_agg_cost,
                      (bike_active_met_agg_cost * 0.75) AS bike20_active_met_agg_cost,
                      walk_length_agg_cost,
                      walk_time_agg_cost,
                      walk_delay_time_agg_cost,
                      walk_ascent_agg_cost,
                      walk_descent_agg_cost,
                      walk_met_agg_cost,
                      walk_delay_met_agg_cost,
                      walk_delay_time_agg_interval,
                      walk_delay_time_agg_format,
                      walk_female_minus_1sd_agg_calories,
                      walk_female_average_agg_calories,
                      walk_female_plus_1sd_agg_calories,
                      walk_male_minus_1sd_agg_calories,
                      walk_male_average_agg_calories,
                      walk_male_plus_1sd_agg_calories,
                      walk_active_length_agg_cost,
                      walk_active_time_agg_cost,
                      walk_active_ascent_agg_cost,
                      walk_active_descent_agg_cost,
                      walk_active_met_agg_cost,
                      walk_active_delay_time_agg_interval,
                      walk_active_delay_time_agg_format,
                      walk_active_female_minus_1sd_agg_calories,
                      walk_active_female_average_agg_calories,
                      walk_active_female_plus_1sd_agg_calories,
                      walk_active_male_minus_1sd_agg_calories,
                      walk_active_male_average_agg_calories,
                      walk_active_male_plus_1sd_agg_calories,
                      (walk_time_agg_cost * 1.25) AS  walk4_time_agg_cost, --Walking at 4kph rather than 5kph
                      (walk_delay_time_agg_cost * 1.25) AS walk4_delay_time_agg_cost,
                      (walk_met_agg_cost * 1.25) AS walk4_met_agg_cost,
                      (walk_delay_met_agg_cost * 1.25) AS walk4_delay_met_agg_cost,
                      (walk_active_time_agg_cost * 1.25) AS walk4_active_time_agg_cost,
                      (walk_active_met_agg_cost * 1.25) AS walk4_active_met_agg_cost,
                      pt_length_agg_cost,
                      pt_time_agg_cost,
                      pt_delay_time_agg_cost,
                      pt_ascent_agg_cost,
                      pt_descent_agg_cost,
                      pt_met_agg_cost,
                      pt_delay_met_agg_cost,
                      pt_delay_time_agg_interval,
                      pt_delay_time_agg_format,
                      pt_female_minus_1sd_agg_calories,
                      pt_female_average_agg_calories,
                      pt_female_plus_1sd_agg_calories,
                      pt_male_minus_1sd_agg_calories,
                      pt_male_average_agg_calories,
                      pt_male_plus_1sd_agg_calories,
                      pt_active_length_agg_cost,
                      pt_active_time_agg_cost,
                      pt_active_ascent_agg_cost,
                      pt_active_descent_agg_cost,
                      pt_active_met_agg_cost,
                      pt_active_delay_time_agg_interval,
                      pt_active_delay_time_agg_format,
                      pt_active_female_minus_1sd_agg_calories,
                      pt_active_female_average_agg_calories,
                      pt_active_female_plus_1sd_agg_calories,
                      pt_active_male_minus_1sd_agg_calories,
                      pt_active_male_average_agg_calories,
                      pt_active_male_plus_1sd_agg_calories
                      FROM batch_run_res_summary
                      WHERE exclude_stats = FALSE")

cars <- subset(summary, mode_filter==1)
parking <- subset(summary, mode_filter==2)
bike <- subset(summary, mode_filter==3)
walk <- subset(summary, mode_filter==4)
pt <- subset(summary, mode_filter==6)

#basic stats
car_mean_length <- mean(cars$length_agg_cost)
car_mean_time <- mean(cars$delay_time_agg_cost)
car_mean_met <- mean(cars$delay_met_agg_cost)
car_mean_male_kcal <- mean(cars$male_average_agg_calories)
car_mean_female_kcal <- mean(cars$female_average_agg_calories)
car_mean_actiity_time <- mean(cars$active_time_agg_cost)
park_mean_length <- mean(parking$length_agg_cost)
park_mean_time <- mean(parking$delay_time_agg_cost)
park_mean_met <- mean(parking$delay_met_agg_cost)
park_mean_male_kcal <- mean(parking$male_average_agg_calories)
park_mean_female_kcal <- mean(parking$female_average_agg_calories)
park_mean_actiity_time <- mean(parking$active_time_agg_cost)
bike_mean_length <- mean(bike$length_agg_cost)
bike_mean_time <- mean(bike$delay_time_agg_cost)
bike_mean_met <- mean(bike$delay_met_agg_cost)
bike_mean_male_kcal <- mean(bike$male_average_agg_calories)
bike_mean_female_kcal <- mean(bike$female_average_agg_calories)
bike_mean_actiity_time <- mean(bike$active_time_agg_cost)
walk_mean_length <- mean(walk$length_agg_cost)
walk_mean_time <- mean(walk$delay_time_agg_cost)
walk_mean_met <- mean(walk$delay_met_agg_cost)
walk_mean_male_kcal <- mean(walk$male_average_agg_calories)
walk_mean_female_kcal <- mean(walk$female_average_agg_calories)
walk_mean_actiity_time <- mean(walk$active_time_agg_cost)
pt_mean_length <- mean(pt$length_agg_cost)
pt_mean_time <- mean(pt$delay_time_agg_cost)
pt_mean_met <- mean(pt$delay_met_agg_cost)
pt_mean_male_kcal <- mean(pt$male_average_agg_calories)
pt_mean_female_kcal <- mean(pt$female_average_agg_calories)
pt_mean_actiity_time <- mean(pt$active_time_agg_cost)

bike20_mean_time <- mean(bike$bike20_delay_time_agg_cost)
walk4_mean_time <- mean(walk$walk4_delay_time_agg_cost)

#1285.714285714286 #Time in seconds for minimum activity per day


#summary information
cars_summary <- summary(cars$length_agg_cost)
cars_sd <- sd(cars$length_agg_cost)
cars_time_summary <- summary(cars$delay_time_agg_cost)
cars_time_sd <- sd(cars$delay_time_agg_cost)
cars_skew <- skewness(cars$length_agg_cost)
cars_kurt <- kurtosis(cars$length_agg_cost)
cars_time_skew <-skewness(cars$delay_time_agg_cost)
cars_time_kurt <- kurtosis(cars$delay_time_agg_cost)
park_skew <- skewness(parking$length_agg_cost)
park_kurt <- kurtosis(parking$length_agg_cost)
park_time_summary <- summary(parking$delay_time_agg_cost)
park_time_sd <- sd(parking$delay_time_agg_cost)
bike_skew <- skewness(bike$length_agg_cost)
bike_kurt <- kurtosis(bike$length_agg_cost)
walk_skew <- skewness(walk$length_agg_cost)
walk_kurt <- kurtosis(walk$length_agg_cost)
pt_skew <- skewness(pt$length_agg_cost)
pt_kurt <- kurtosis(pt$length_agg_cost)


###########################################################################################
# IDENTIFY THE EXTREME RECORDS
###########################################################################################

#WHICH HAVE THE LONGEST DISTANCE COMMUTE
max_length_agg_cost_df <- summary[which.max(summary$length_agg_cost),]
#batch_item_id=4578 Upper Crabtree to Bramley via Public Transport, length=37215.5, time=04:02:26, or by car length=19087.62, time=00:18:30
max_car_length_agg_cost_df <- cars[which.max(cars$length_agg_cost),]
#batch_item_id=5129 Sheffield to Shireoaks, length=27913.73, time=00:28:22

#WHICH HAVE THE LONGEST TIME COMMUTE
max_delay_time_agg_cost_df <- summary[which.max(summary$delay_time_agg_cost),]
#batch_item_id=5129 SHeffield to Shireoaks via Walking, length=24723.43, time=05:28:07, or  by car length=27913.73, time=00:28:22
max_car_delay_time_agg_cost_df <- cars[which.max(cars$delay_time_agg_cost),]
#batch_item_id=1532 Thorpe Common to Rotherham length=9516.777, time=00:59:24
max_park_delay_time_agg_cost_df <- parking[which.max(parking$delay_time_agg_cost),]

#WHICH HAVE THE SHORTEST DISTANCE COMMUTE
min_length_agg_cost_df <- summary[which.min(summary$length_agg_cost),]
#batch_item_id=3013 Walkley to SHeffield via Walking, length=15.56907, time=00:00:11, or by car length=4265.351, 00:09:13
min_car_length_agg_cost_df <- cars[which.min(cars$length_agg_cost),]
#batch_item_id=4611 Sheffield to Sheffield length=43.66448, time=00:00:23

#WHICH HAVE THE SHORTEST TIME COMMUTE
min_delay_time_agg_cost_df <- summary[which.min(summary$delay_time_agg_cost),]
#batch_item_id=3013 Walkley to SHeffield via Walking, length=15.56907, time=00:00:11, or by car length=4265.351, 00:09:13
min_car_delay_time_agg_cost_df <- cars[which.min(cars$delay_time_agg_cost),]
#batch_item_id=4611 Sheffield to Sheffield length=43.66448, time=00:00:23
min_park_delay_time_agg_cost_df <- parking[which.min(parking$delay_time_agg_cost),]

#WHICH ROUTE HAS THE GREATEST ELEVATION GAIN
max_asscent_agg_cost_df <- summary[which.max(summary$ascent_agg_cost),]
#batch_item_id=4575 Upper Crabtree to Bramley via Public Transport ascent=576, length=37215.5, time04:02:26, or by car ascent=241.11, length=19087.62, time=00:18:30
max_car_ascent_agg_cost_df <- cars[which.max(cars$ascent_agg_cost),]
#batch_item_id=1288 Low Bradfield to Broomfield, ascent=476.84, length=13422.37, time=00:18:14

#WHICH ROUTE HAS THE LEAST ELEVATION GAIN
min_ascent_agg_cost_df <- summary[which.min(summary$ascent_agg_cost),]
#batch_item_id=3776 Meadow Hall to Sharrow Vale via Walking. ascent=0, length=15.70996, time=00:00:11, or by car ascent=126.41, length=9214.652, time=00:17:09
min_car_ascent_agg_cost_df <- cars[which.min(cars$ascent_agg_cost),]
#batch_item_id=3416 Crookesmoor to Crooksemoor, ascent=0, length=318.2739, time=00:01:13


###########################################################################################
# DISTANCE BY MODE
###########################################################################################

#DIRECTNESS OF COMMUTE - COMPARE MEAN DISTANCES OF TRANSPORT MODES

#GROUPED BY 1KM 
#ggplot(data=summary, aes(x=km_ceil_cost, colour=mode, fill=mode)) +
#  geom_bar(alpha=0.66) +
#  facet_wrap( ~ mode) +
#  labs(title="Commute distance by travel mode", x="Length (km)", y="Count") +
#  theme(strip.background=element_blank(), panel.border = element_rect(color = "#262626", size=0.5, linetype = "solid", fill=NA)) +
#  scale_x_continuous(limits=c(0, 30), breaks=c(0,10,20,30), labels=c("0","10","20","30")) +
#  scale_fill_manual(name="", values=c("Car (door to door)"="#e41a1c","Car (with parking)"="#377eb8","Cycling"="#4daf4a","Public Transport"="#ff7f00","Walking"="#984ea3")) +
#  scale_colour_manual(name="", values=c("Car (door to door)"="#e41a1c","Car (with parking)"="#377eb8","Cycling"="#4daf4a","Public Transport"="#ff7f00","Walking"="#984ea3")) 

#GROUPED BY 2KM 
#ggplot(data=summary, aes(x=km_2_ceil_cost, colour=mode, fill=mode)) +
#  geom_bar(alpha=0.66) +
#  facet_wrap( ~ mode) +
#  labs(title="Commute distance by travel mode", x="Length (km)", y="Count") +
#  theme(strip.background=element_blank(), panel.border = element_rect(color = "#262626", size=0.5, linetype = "solid", fill=NA)) +
#  scale_x_continuous(limits=c(0, 30), breaks=c(0,10,20,30), labels=c("0","10","20","30")) +
#  scale_fill_manual(name="", values=c("Car (door to door)"="#e41a1c","Car (with parking)"="#377eb8","Cycling"="#4daf4a","Public Transport"="#ff7f00","Walking"="#984ea3")) +
#  scale_colour_manual(name="", values=c("Car (door to door)"="#e41a1c","Car (with parking)"="#377eb8","Cycling"="#4daf4a","Public Transport"="#ff7f00","Walking"="#984ea3")) 

#GROUPED BY 3KM 
#ggplot(data=summary, aes(x=km_3_ceil_cost, colour=mode, fill=mode)) +
#  geom_bar(alpha=0.66) +
#  facet_wrap( ~ mode) +
#  labs(title="Commute distance by travel mode", x="Length (km)", y="Count") +
#  theme(strip.background=element_blank(), panel.border = element_rect(color = "#262626", size=0.5, linetype = "solid", fill=NA)) +
#  scale_x_continuous(limits=c(0, 30), breaks=c(0,10,20,30), labels=c("0","10","20","30")) +
#  scale_fill_manual(name="", values=c("Car (door to door)"="#e41a1c","Car (with parking)"="#377eb8","Cycling"="#4daf4a","Public Transport"="#ff7f00","Walking"="#984ea3")) +
#  scale_colour_manual(name="", values=c("Car (door to door)"="#e41a1c","Car (with parking)"="#377eb8","Cycling"="#4daf4a","Public Transport"="#ff7f00","Walking"="#984ea3")) 

#GROUPED BY 5KM
#ggplot(data=summary, aes(x=km_5_ceil_cost, colour=mode, fill=mode)) +
#  geom_bar(alpha=0.66) +
#  facet_wrap( ~ mode) +
#  labs(title="Commute distance by travel mode", x="Length (km)", y="Count") +
#  theme(strip.background=element_blank(), panel.border = element_rect(color = "#262626", size=0.5, linetype = "solid", fill=NA)) +
#  scale_x_continuous(limits=c(0, 30), breaks=c(0,10,20,30), labels=c("0","10","20","30")) +
#  scale_fill_manual(name="", values=c("Car (door to door)"="#e41a1c","Car (with parking)"="#377eb8","Cycling"="#4daf4a","Public Transport"="#ff7f00","Walking"="#984ea3")) +
#  scale_colour_manual(name="", values=c("Car (door to door)"="#e41a1c","Car (with parking)"="#377eb8","Cycling"="#4daf4a","Public Transport"="#ff7f00","Walking"="#984ea3")) 

#DENSITY

#DENSITY OF DISTANCES FOR CAR (DOOR TO DOOR)
ggplot(cars) + 
  labs(title="", x="Commute distance (km)", y="Density") +
  geom_density(aes(length_agg_cost, fill="Car (door to door)"), alpha=0.66, show.legend=FALSE) +
  scale_x_continuous(limits=c(0, 30000), breaks=c(0,10000,20000,30000), labels=c("0","10","20","30")) +
  theme(panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) +
  scale_fill_manual(name="", values=c("Car (door to door)"="#e41a1c","Car (with parking)"="#377eb8","Cycling"="#4daf4a","Public Transport"="#ff7f00","Walking"="#984ea3")) + 
  geom_vline(xintercept=car_mean_length, linetype="dotted", color="black", size=1) 


#DENSITIES OF ALL MODES
ggplot(summary) + 
  labs(title="Commute distance by travel mode", x="Commute distance (km)", y="Density") +
  geom_density(aes(length_agg_cost, colour=mode), size=1, show_guide=FALSE) +
  stat_density(aes(length_agg_cost, colour=mode), geom="line", position="identity", size=1) +
  scale_x_continuous(limits=c(0, 30000), breaks=c(0,10000,20000,30000), labels=c("0","10","20","30")) +
  theme(panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) +
  scale_color_brewer(palette = "Set1")
 
#BOX PLOT OF DISTRIBUTIONS   
ggplot(summary) + 
  labs(title="", y="Commute distance (km)", x="Mode") +
  geom_boxplot(aes(y=length_agg_cost, x=mode, colour=mode), outlier.color="black") +
  scale_y_continuous(limits=c(0, 30000), breaks=c(0,10000,20000,30000), labels=c("0","10","20","30")) +
  theme(legend.position = "non", panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) +
  scale_color_brewer(palette = "Set1")

#AOV
mode_length_aov <- aov(length_agg_cost ~ mode, data=summary)
summary(mode_length_aov)
mode_length_tuk <- TukeyHSD(mode_length_aov)
plot(mode_length_tuk, col="#08306b", las=1, cex.axis=0.75)

############################################################################################
# TIME MODE COMPARISONS
##############################################################################################


#ggplot(data=summary, aes(x=delay_time_ceil_cost, colour=mode, fill=mode)) +
#  geom_bar(alpha=0.66) +
#  facet_wrap( ~ mode) +
#  labs(title="Travel time by travel mode", x="Active time (minutes)", y="Count") +
#  theme(strip.background=element_blank(), panel.border = element_rect(color = "#262626", size=0.5, linetype = "solid", fill=NA)) +
#  scale_x_continuous(limits=c(0, 60), breaks=c(0,10,20,30,40,50,60), labels=c("0","10","20","30","40","50","60")) +
  #scale_y_continuous(limits=c(0, 30000), breaks=c(0,10000,20000,30000), labels=c("0","10","20","30")) +
#  scale_fill_manual(name="", values=c("Car (door to door)"="#e41a1c","Car (with parking)"="#377eb8","Cycling"="#4daf4a","Public Transport"="#ff7f00","Walking"="#984ea3")) +
#  scale_colour_manual(name="", values=c("Car (door to door)"="#e41a1c","Car (with parking)"="#377eb8","Cycling"="#4daf4a","Public Transport"="#ff7f00","Walking"="#984ea3")) 

#ggplot(data=summary, aes(x=delay_time_2_ceil_cost, colour=mode, fill=mode)) +
#  geom_bar(alpha=0.66) +
#  facet_wrap( ~ mode) +
#  labs(title="Travel time by travel mode", x="Active time (minutes)", y="Count") +
#  theme(strip.background=element_blank(), panel.border = element_rect(color = "#262626", size=0.5, linetype = "solid", fill=NA)) +
#  scale_x_continuous(limits=c(0, 60), breaks=c(0,10,20,30,40,50,60), labels=c("0","10","20","30","40","50","60")) +
  #scale_y_continuous(limits=c(0, 30000), breaks=c(0,10000,20000,30000), labels=c("0","10","20","30")) +
#  scale_fill_manual(name="", values=c("Car (door to door)"="#e41a1c","Car (with parking)"="#377eb8","Cycling"="#4daf4a","Public Transport"="#ff7f00","Walking"="#984ea3")) +
#  scale_colour_manual(name="", values=c("Car (door to door)"="#e41a1c","Car (with parking)"="#377eb8","Cycling"="#4daf4a","Public Transport"="#ff7f00","Walking"="#984ea3")) 

#ggplot(data=summary, aes(x=delay_time_5_ceil_cost, colour=mode, fill=mode)) +
#  geom_bar(alpha=0.66) +
#  facet_wrap( ~ mode) +
#  labs(title="Travel time by travel mode", x="Active time (minutes)", y="Count") +
#  theme(strip.background=element_blank(), panel.border = element_rect(color = "#262626", size=0.5, linetype = "solid", fill=NA)) +
#  scale_x_continuous(limits=c(0, 60), breaks=c(0,10,20,30,40,50,60), labels=c("0","10","20","30","40","50","60")) +
  #scale_y_continuous(limits=c(0, 30000), breaks=c(0,10000,20000,30000), labels=c("0","10","20","30")) +
#  scale_fill_manual(name="", values=c("Car (door to door)"="#e41a1c","Car (with parking)"="#377eb8","Cycling"="#4daf4a","Public Transport"="#ff7f00","Walking"="#984ea3")) +
#  scale_colour_manual(name="", values=c("Car (door to door)"="#e41a1c","Car (with parking)"="#377eb8","Cycling"="#4daf4a","Public Transport"="#ff7f00","Walking"="#984ea3")) 

#DENSITY
#ggplot() + 
#  labs(title="Commute time by travel mode", x="Commute time (minutes)", y="Density") +
#  geom_density(data=cars, aes(delay_time_agg_cost, fill="Car (door to door)"), alpha=0.66) +
#  geom_density(data=parking, aes(delay_time_agg_cost, fill="Car (with parking)"), alpha=0.66) +
#  geom_density(data=bike, aes(delay_time_agg_cost, fill="Cycling"), alpha=0.66) +
#  geom_density(data=pt, aes(delay_time_agg_cost, fill="Public Transport"), alpha=0.66) +
#  geom_density(data=walk, aes(delay_time_agg_cost, fill="Walking"), alpha=0.66) + 
#  scale_x_continuous(limits=c(0, 3600), breaks=c(0,600,1200,1800,2400,3000,3600), labels=c("0","10","20","30","40","50","60")) +
#  theme(panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) +
#  scale_fill_manual(name="", values=c("Car (door to door)"="#e41a1c","Car (with parking)"="#377eb8","Cycling"="#4daf4a","Public Transport"="#ff7f00","Walking"="#984ea3"))

#DENSITY OF CARS (DOOR TO DOOR)
ggplot(cars) + 
  labs(title="", x="Commute time (minutes)", y="Density") +
  geom_density(aes(delay_time_agg_cost, fill="Car (door to door)"), alpha=0.66, show.legend=FALSE) +
  scale_x_continuous(limits=c(0, 3600), breaks=c(0,600,1200,1800,2400,3000,3600), labels=c("0","10","20","30","40","50","60")) +
  theme(panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) +
  scale_fill_manual(name="", values=c("Car (door to door)"="#e41a1c","Car (with parking)"="#377eb8","Cycling"="#4daf4a","Public Transport"="#ff7f00","Walking"="#984ea3")) + 
  geom_vline(xintercept=car_mean_time, linetype="dotted", color="black", size=1) 

#DENSITIES OF ALL MODES
ggplot(summary) + 
  labs(title="Commute time by travel mode", x="Commute time (minutes)", y="Density") +
  geom_density(aes(delay_time_agg_cost, colour=mode), size=1, show_guide=FALSE) +
  stat_density(aes(delay_time_agg_cost, colour=mode), geom="line", position="identity", size=1) +
  scale_x_continuous(limits=c(0, 3600), breaks=c(0,600,1200,1800,2400,3000,3600), labels=c("0","10","20","30","40","50","60")) +
  theme(panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) +
  scale_color_brewer(palette = "Set1")

#BOX PLOT OF DISTRIBUTIONS   
ggplot(summary) + 
  labs(title="", y="Commute time (minutes)", x="Mode") +
  geom_boxplot(aes(y=delay_time_agg_cost, x=mode, colour=mode), outlier.color="black") +
  scale_y_continuous(limits=c(0, 3600), breaks=c(0,600,1200,1800,2400,3000,3600), labels=c("0","10","20","30","40","50","60")) +
  theme(legend.position = "none", panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) +
  scale_color_brewer(palette = "Set1")


# AOV
mode_time_aov <- aov(delay_time_agg_cost ~ mode, data=summary)
summary(mode_time_aov)
mode_time_tuk <- TukeyHSD(mode_time_aov)
plot(mode_time_tuk, col="#08306b", las=1, cex.axis=0.75)

##############################################################################################
# IMD DIFFERENCES BY TRAVEL DISTANCE
##############################################################################################

imd_means_decile <- aggregate(parking$length_agg_cost, list(parking$home_decile), mean) 
colnames(imd_means_decile) <- c("home_decile", "length_agg_cost")
ggplot(parking) + 
  geom_boxplot(aes(x=home_decile, y=length_agg_cost, colour=cat_home_decile), outlier.color="black") +
  labs(title="", y="Commute distance (km)", x="IMD decile") +
  scale_x_continuous(breaks=c(1:10), labels=c("1","2","3","4","5","6","7","8","9","10")) +
  scale_y_continuous(limits=c(0, 30000), breaks=c(0,10000,20000,30000), labels=c("0","10","20","30")) +
  geom_point(data=imd_means_decile,  mapping=aes(x=home_decile, y=length_agg_cost), col="black") +
  geom_line(data=imd_means_decile,  mapping=aes(x=home_decile, y=length_agg_cost, group=1), col="black") +
  theme(legend.position = "non", panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) +
  scale_colour_brewer(palette = "Spectral")


#BOXPLOT OF Commute distance by IMD health decile
imd_means_health_decile <- aggregate(parking$length_agg_cost, list(parking$home_health_decile), mean) 
colnames(imd_means_health_decile) <- c("home_health_decile", "length_agg_cost")
ggplot(parking) + 
  geom_boxplot(aes(x=home_health_decile, y=length_agg_cost, colour=cat_home_health_decile), outlier.color="black") +
  labs(title="", y="Commute distance (km)", x="Health decile") +
  scale_x_continuous(breaks=c(1:10), labels=c("1","2","3","4","5","6","7","8","9","10")) +
  scale_y_continuous(limits=c(0, 30000), breaks=c(0,10000,20000,30000), labels=c("0","10","20","30")) +
  geom_point(data=imd_means_health_decile,  mapping=aes(x=home_health_decile, y=length_agg_cost), col="black") +
  geom_line(data=imd_means_health_decile,  mapping=aes(x=home_health_decile, y=length_agg_cost, group=1), col="black") +
  theme(legend.position = "non", panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) +
  scale_colour_brewer(palette = "Spectral")



#Repeat with delay_time_agg_cost
imd_means_time_decile <- aggregate(parking$delay_time_agg_cost, list(parking$home_decile), mean) 
colnames(imd_means_time_decile) <- c("home_decile", "delay_time_agg_cost")
ggplot(parking) + 
  geom_boxplot(aes(x=home_decile, y=delay_time_agg_cost, colour=cat_home_decile), outlier.color="black") +
  labs(title="", y="Commute time (minutes)", x="IMD decile") +
  scale_x_continuous(breaks=c(1:10), labels=c("1","2","3","4","5","6","7","8","9","10")) +
  scale_y_continuous(limits=c(0, 2400), breaks=c(0,600,1200,1800,2400), labels=c("0","10","20","30","40")) +
  geom_point(data=imd_means_time_decile,  mapping=aes(x=home_decile, y=delay_time_agg_cost), col="black") +
  geom_line(data=imd_means_time_decile,  mapping=aes(x=home_decile, y=delay_time_agg_cost, group=1), col="black") +
  theme(legend.position = "non", panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) +
  scale_colour_brewer(palette = "Spectral")


#BOXPLOT OF Commute time by IMD health decile
imd_means_time_health_decile <- aggregate(parking$delay_time_agg_cost, list(parking$home_health_decile), mean) 
colnames(imd_means_time_health_decile) <- c("home_health_decile", "delay_time_agg_cost")
ggplot(parking) + 
  geom_boxplot(aes(x=home_health_decile, y=delay_time_agg_cost, colour=cat_home_health_decile), outlier.color="black") +
  labs(title="", y="Commute time (minutes)", x="Health decile") +
  scale_x_continuous(breaks=c(1:10), labels=c("1","2","3","4","5","6","7","8","9","10")) +
  scale_y_continuous(limits=c(0, 2400), breaks=c(0,600,1200,1800,2400), labels=c("0","10","20","30","40")) +
  geom_point(data=imd_means_time_health_decile,  mapping=aes(x=home_health_decile, y=delay_time_agg_cost), col="black") +
  geom_line(data=imd_means_time_health_decile,  mapping=aes(x=home_health_decile, y=delay_time_agg_cost, group=1), col="black") +
  theme(legend.position = "non", panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) +
  scale_colour_brewer(palette = "Spectral")




# IMD DIFFERENCE TEST _ ANOVA
imd_length_aov <- aov(length_agg_cost ~ cat_home_decile, data=parking)
summary(imd_length_aov)
imd_length_tuk <- TukeyHSD(imd_length_aov)

imd_time_aov <- aov(delay_time_agg_cost ~ cat_home_decile, data=parking)
summary(imd_time_aov)
imd_time_tuk <- TukeyHSD(imd_time_aov)

imd_health_length_aov <- aov(length_agg_cost ~ cat_home_health_decile, data=parking)
summary(imd_health_length_aov)
imd_health_length_tuk <- TukeyHSD(imd_health_length_aov)

imd_health_time_aov <- aov(delay_time_agg_cost ~ cat_home_health_decile, data=parking)
summary(imd_health_time_aov)
imd_health_time_tuk <- TukeyHSD(imd_health_time_aov)

###########################################################################################
# ACTIVE TIME MODE COMPARISIONS
###########################################################################################

ggplot(data=summary, aes(x=active_time_agg_cost, y=length_agg_cost, colour=mode)) +
  geom_point(size=0.2, alpha=0.66) +
  geom_vline(xintercept=643, linetype=3, alpha=1) + #50% Daily recomended of moderate exercise
  geom_vline(xintercept=1286, linetype=2, alpha=0.66) + #100% Daily recomended moderate exercise
  facet_wrap( ~ mode) +
  labs(title="Active time by travel mode", x="Active time (minutes)", y="Distance (km)") +
  theme(strip.background=element_blank(), panel.border = element_rect(color = "#262626", size=0.5, linetype = "solid", fill=NA)) +
  scale_x_continuous(limits=c(0, 14400), breaks=c(0,3600,7200,10800,14400), labels=c("0","60","120","180","240")) +
  scale_y_continuous(limits=c(0, 30000), breaks=c(0,10000,20000,30000), labels=c("0","10","20","30")) +
  scale_colour_manual(name="", values=c("Car"="#e41a1c","Car (with parking)"="#377eb8","Cycling"="#4daf4a","Public Transport"="#ff7f00","Walking"="#984ea3")) 

# DENSITY
ggplot() + 
  labs(title="Commute time by travel mode", x="Active time (minutes)", y="Density") +
  geom_density(data=cars, aes(active_time_agg_cost, fill="Car"), alpha=0.66) +
  geom_density(data=parking, aes(active_time_agg_cost, fill="Car (with parking)"), alpha=0.66) +
  geom_density(data=bike, aes(active_time_agg_cost, fill="Cycling"), alpha=0.66) +
  geom_density(data=pt, aes(active_time_agg_cost, fill="Public Transport"), alpha=0.66) +
  geom_density(data=walk, aes(active_time_agg_cost, fill="Walking"), alpha=0.66) + 
  scale_x_continuous(limits=c(0, 1200), breaks=c(0,120,240,360,480,600,720,840,960,1080,1200), labels=c("0","2","4","6","8","10","12","14","16","18","20")) +
  theme(panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) +
  scale_fill_manual(name="", values=c("Car"="#e41a1c","Car (with parking)"="#377eb8","Cycling"="#4daf4a","Public Transport"="#ff7f00","Walking"="#984ea3"))

# AOV
mode_active_time_aov <- aov(active_time_agg_cost ~ mode, data=summary)
summary(mode_active_time_aov)
mode_active_time_tuk <- TukeyHSD(mode_active_time_aov)
plot(mode_active_time_tuk)


#ACTIVITY TIME DIFFERENCES PER IMD DECILES
ggplot(data=cars, aes(active_time_agg_cost)) +
  geom_density(fill="#e41a1c", alpha=0.66) +
  facet_wrap( ~ cat_home_decile, ncol=5) +
  labs(title="Active time during car commute by decile", x="Active time (minutes)", y="") +
  theme(strip.text.x = element_blank(), 
        axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank(),
        legend.position="none", strip.background=element_blank(), 
        panel.border = element_rect(color = "#262626", size=0.5, linetype = "solid", fill=NA)) +
  scale_x_continuous(limits=c(0, 360), breaks=c(0,120,240,360), labels=c("0","20","40","60"))

ggplot(data=parking, aes(active_time_agg_cost)) +
  geom_density(fill="#377eb8", alpha=0.66) +
  facet_wrap( ~ cat_home_decile, ncol=5) +
  labs(title="Active time during car commute when parking by IMD decile", x="Active time (minutes)", y="") +
  theme(strip.text.x = element_blank(), 
        axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank(),
        legend.position="none", strip.background=element_blank(), 
        panel.border = element_rect(color = "#262626", size=0.5, linetype = "solid", fill=NA)) +
  scale_x_continuous(limits=c(0, 360), breaks=c(0,120,240,360), labels=c("0","20","40","60"))

ggplot(data=bike, aes(active_time_agg_cost)) +
  geom_density(fill="#4daf4a", alpha=0.66) +
  facet_wrap( ~ cat_home_decile, ncol=5) +
  labs(title="Active time during bike commute by IMD decile", x="Active time (minutes)", y="") +
  theme(strip.text.x = element_blank(), 
        axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank(),
        legend.position="none", strip.background=element_blank(), 
        panel.border = element_rect(color = "#262626", size=0.5, linetype = "solid", fill=NA)) +
  scale_x_continuous(limits=c(0, 360), breaks=c(0,120,240,360), labels=c("0","20","40","60"))


ggplot(data=pt, aes(active_time_agg_cost)) +
  geom_density(fill="#ff7f00", alpha=0.66) +
  facet_wrap( ~ cat_home_decile, ncol=5) +
  labs(title="Active time during public transport commute by IMD decile", x="Active time (minutes)", y="") +
  theme(strip.text.x = element_blank(), 
        axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank(),
        legend.position="none", strip.background=element_blank(), 
        panel.border = element_rect(color = "#262626", size=0.5, linetype = "solid", fill=NA)) +
  scale_x_continuous(limits=c(0, 360), breaks=c(0,120,240,360), labels=c("0","20","40","60"))

ggplot(data=walk, aes(active_time_agg_cost)) +
  geom_density(fill="#984ea3", alpha=0.66) +
  facet_wrap( ~ cat_home_decile, ncol=5) +
  labs(title="Active time during walking commute by IMD decile", x="Active time (minutes)", y="") +
  theme(strip.text.x = element_blank(), 
        axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank(),
        legend.position="none", strip.background=element_blank(), 
        panel.border = element_rect(color = "#262626", size=0.5, linetype = "solid", fill=NA)) +
  scale_x_continuous(limits=c(0, 360), breaks=c(0,120,240,360), labels=c("0","20","40","60"))


ggplot(data=cars, aes(active_time_agg_cost)) +
  geom_density(fill="#e41a1c", alpha=0.66) +
  facet_wrap( ~ cat_home_health_decile, ncol=5) +
  labs(title="Active time during car commute by IMD health decile", x="Active time (minutes)", y="") +
  theme(strip.text.x = element_blank(), 
        axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank(),
        legend.position="none", strip.background=element_blank(), 
        panel.border = element_rect(color = "#262626", size=0.5, linetype = "solid", fill=NA)) +
  scale_x_continuous(limits=c(0, 360), breaks=c(0,120,240,360), labels=c("0","20","40","60"))

ggplot(data=parking, aes(active_time_agg_cost)) +
  geom_density(fill="#377eb8", alpha=0.66) +
  facet_wrap( ~ cat_home_health_decile, ncol=5) +
  labs(title="Active time during car commute when parking by IMD health decile", x="Active time (minutes)", y="") +
  theme(strip.text.x = element_blank(), 
        axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank(),
        legend.position="none", strip.background=element_blank(), 
        panel.border = element_rect(color = "#262626", size=0.5, linetype = "solid", fill=NA)) +
  scale_x_continuous(limits=c(0, 360), breaks=c(0,120,240,360), labels=c("0","20","40","60"))

ggplot(data=bike, aes(active_time_agg_cost)) +
  geom_density(fill="#4daf4a", alpha=0.66) +
  facet_wrap( ~ cat_home_health_decile, ncol=5) +
  labs(title="Active time during bike commute by IMD health decile", x="Active time (minutes)", y="") +
  theme(strip.text.x = element_blank(), 
        axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank(),
        legend.position="none", strip.background=element_blank(), 
        panel.border = element_rect(color = "#262626", size=0.5, linetype = "solid", fill=NA)) +
  scale_x_continuous(limits=c(0, 360), breaks=c(0,120,240,360), labels=c("0","20","40","60"))


ggplot(data=pt, aes(active_time_agg_cost)) +
  geom_density(fill="#ff7f00", alpha=0.66) +
  facet_wrap( ~ cat_home_health_decile, ncol=5) +
  labs(title="Active time during public transport commute by IMD health decile", x="Active time (minutes)", y="") +
  theme(strip.text.x = element_blank(), 
        axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank(),
        legend.position="none", strip.background=element_blank(), 
        panel.border = element_rect(color = "#262626", size=0.5, linetype = "solid", fill=NA)) +
  scale_x_continuous(limits=c(0, 360), breaks=c(0,120,240,360), labels=c("0","20","40","60"))

ggplot(data=walk, aes(active_time_agg_cost)) +
  geom_density(fill="#984ea3", alpha=0.66) +
  facet_wrap( ~ cat_home_health_decile, ncol=5) +
  labs(title="Active time during walking commute by IMD health decile", x="Active time (minutes)", y="") +
  theme(strip.text.x = element_blank(), 
        axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank(),
        legend.position="none", strip.background=element_blank(), 
        panel.border = element_rect(color = "#262626", size=0.5, linetype = "solid", fill=NA)) +
  scale_x_continuous(limits=c(0, 360), breaks=c(0,120,240,360), labels=c("0","20","40","60"))


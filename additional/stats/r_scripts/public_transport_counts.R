library("e1071")
library("ggplot2")
library("RPostgreSQL")

#
# Investigate if public transport stops and frequency varies by IMD deciles
#

dbname <- {"production"}
dbuser <- {"postgres"}
dbport <- {"5432"}
dbpw <- {"xxxxxxxxxxxxxxxxxxxx"}
dbhost <- {"localhost"}
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname = dbname, host = dbhost, port = dbport, user = dbuser, password = dbpw)
rm(dbpw)

counts <- dbGetQuery(con, "SELECT id, gid, code, name, label, ruc11cd, ruc11, ovrk2015, decile, 
       quintile, hlth2015, hlthdecile, hlthquintile, stop_count, morning_stop_time_count, 
        'decile_' || (hlthdecile-1) AS cat_home_health_decile,
                    evening_stop_time_count, total_stop_time_count, stop_count_b10, 
                    morning_stop_time_count_b10, evening_stop_time_count_b10, total_stop_time_count_b10, 
                    stop_count_b25, morning_stop_time_count_b25, evening_stop_time_count_b25, 
                    total_stop_time_count_b25
                    FROM sheffield.lsoa_imd_sheffield_pt")

max_stop_count_df <- counts[which.max(counts$stop_count_b25),]
max_stop_times_count_df <- counts[which.max(counts$total_stop_time_count_b25),]

min_stop_count_df <- counts[which.min(counts$stop_count_b25),]
min_stop_times_count_df <- counts[which.min(counts$total_stop_time_count_b25),]

skew <- skewness(counts$stop_count_b25)
kurt <- kurtosis(counts$stop_count_b25)
skew_times <- skewness(counts$total_stop_time_count_b25)
kurt_times <- kurtosis(counts$total_stop_time_count_b25)

ggplot(counts) + 
  labs(title="", x="Public transport stop count per LSOA", y="Density") +
  geom_density(aes(stop_count_b25), alpha=0.66, fill="#e41a1c", show.legend=FALSE) +
  theme(panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) +
  geom_vline(xintercept=mean(counts$stop_count_b25), linetype="dotted", color="black", size=1) 


#BOXPLOT OFPUBLIC TRANSPORT STOP DISTRIBUTION
imd_means_stop_count_health_decile <- aggregate(counts$stop_count_b25, list(counts$hlthdecile), mean) 
colnames(imd_means_stop_count_health_decile) <- c("hlthdecile", "stop_count_b25")
ggplot(counts) + 
  geom_boxplot(aes(x=hlthdecile, y=stop_count_b25, colour=cat_home_health_decile), outlier.color="black") +
  labs(title="", y="No. public transport stops", x="Health decile") +
  scale_x_continuous(breaks=c(1:10), labels=c("1","2","3","4","5","6","7","8","9","10")) +
  #scale_y_continuous(limits=c(0, 100), breaks=c(0,10,20,30,40,50,60,70,80,90,100), labels=c("0","10","20","30","40","50","60","70","80,","90","100")) +
  geom_point(data=imd_means_stop_count_health_decile,  mapping=aes(x=hlthdecile, y=stop_count_b25), col="black") +
  geom_line(data=imd_means_stop_count_health_decile,  mapping=aes(x=hlthdecile, y=stop_count_b25, group=1), col="black") +
  theme(legend.position = "non", panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) +
  scale_colour_brewer(palette = "Spectral")

imd_means_total_times_count_health_decile <- aggregate(counts$total_stop_time_count_b25, list(counts$hlthdecile), mean) 
colnames(imd_means_total_times_count_health_decile) <- c("hlthdecile", "total_stop_time_count_b25")
ggplot(counts) + 
  geom_boxplot(aes(x=hlthdecile, y=total_stop_time_count_b25, colour=cat_home_health_decile), outlier.color="black") +
  labs(title="", y="No. public transport visits", x="Health decile") +
  scale_x_continuous(breaks=c(1:10), labels=c("1","2","3","4","5","6","7","8","9","10")) +
  scale_y_continuous(limits=c(0, 25000), breaks=c(0,5000,10000,15000,20000,25000), labels=c("0","5000","10000","15000","20000","25000")) +
  geom_point(data=imd_means_total_times_count_health_decile,  mapping=aes(x=hlthdecile, y=total_stop_time_count_b25), col="black") +
  geom_line(data=imd_means_total_times_count_health_decile,  mapping=aes(x=hlthdecile, y=total_stop_time_count_b25, group=1), col="black") +
  theme(legend.position = "non", panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) +
  scale_colour_brewer(palette = "Spectral")

# IMD DIFFERENCE TEST _ ANOVA
imd_hlth_pt_count_aov <- aov(stop_count_b25 ~ cat_home_health_decile, data=counts)
summary(imd_hlth_pt_count_aov)
#imd_hlth_pt_count_tuk <- TukeyHSD(imd_hlth_pt_count_aov)

imd_hlth_pt_times_count_aov <- aov(total_stop_time_count_b25 ~ cat_home_health_decile, data=counts)
summary(imd_hlth_pt_times_count_aov)
#imd_hlth_pt_count_tuk <- TukeyHSD(imd_hlth_pt_count_aov)


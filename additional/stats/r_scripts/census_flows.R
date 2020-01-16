library("e1071")
library("ggplot2")
library("RPostgreSQL")
library("gplots") 
library("multcompView")

#
# Basic stats and charts for cencus travel to work flow directions based on the records sampled for routing.
#

dbname <- {"production"}
dbuser <- {"postgres"}
dbport <- {"5432"}
dbpw <- {"xxxxxxxxxxxxxxxxxxxx"}
dbhost <- {"localhost"}
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname = dbname, host = dbhost, port = dbport, user = dbuser, password = dbpw)
rm(dbpw)

flows <- dbGetQuery(con, "SELECT id, 
	                    source_oa, 
                      target_oa, 
                      count,
                      code as IMD_code,
                      ovrk2015, 
                      decile,
                      quintile,
                      hlth2015,
                      hlthdecile,
                      hlthquintile,
                      flow_direction,
                      (SELECT name FROM os_open_names WHERE id = c.home_settlement_id) AS home_name,
                      (SELECT name FROM os_open_names WHERE id = c.work_settlement_id) AS work_name 
                      FROM census_flows c")

#reshape the data for summary info
#prob an easier way to do this with reshape or something, but given lack of knowledge longhand version used
inflow <- subset(flows, flow_direction=="in")
outflow <- subset(flows, flow_direction=="out")
outinflow <- subset(flows, flow_direction=="out_in")

inagg <- aggregate(flow_direction ~ hlthdecile, inflow, length)
inagg$direction <- c(rep("inwards", times=10))

outagg <- aggregate(flow_direction ~ hlthdecile, outflow, length)
outagg$direction <- c(rep("outwards", times=10))

outinagg <- aggregate(flow_direction ~ hlthdecile, outinflow, length)
outinagg$direction <- c(rep("another", times=10))

summary <- rbind(inagg, outagg, outinagg)

#flow_direction is really a count of flows in a particular direction
colnames(summary)[colnames(summary)=="flow_direction"] <- "count"

colours <- c("#a6cee3", "#1f78b4", "#b2df8a")

ggplot(summary) +
  labs(title="", y="Count", x="Health decile") +
  geom_bar(aes(x=hlthdecile, y=count, fill=direction), stat="identity") +
  scale_x_continuous(breaks=c(1:10), labels=c("1","2","3","4","5","6","7","8","9","10")) +
  theme(panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) +
  scale_fill_manual(values=colours)

#Get some basic stats for percentages of flow direction
v_totalcount <- sum(flows$count)
v_incount <- sum(inflow$count)
v_outcount <- sum(outflow$count)
v_outincount <- sum(outinflow$count)

v_inperc <- (v_incount / v_totalcount) * 100
v_outperc <- (v_outcount / v_totalcount) * 100
v_outinperc <- (v_outincount / v_totalcount) * 100


#Now work out by decile...
#Got to be a better way, but don't know it
flowsummaryperc <- function(x, n){
  #Calculate the percentage n direction is of the total
  (subset(x, direction==n)[["count"]] / sum(x$count)) * 100
}

percentages <- c(flowsummaryperc(subset(summary, hlthdecile==1), "inwards"), 
             flowsummaryperc(subset(summary, hlthdecile==2), "inwards"), 
             flowsummaryperc(subset(summary, hlthdecile==3), "inwards"),
             flowsummaryperc(subset(summary, hlthdecile==4), "inwards"),
             flowsummaryperc(subset(summary, hlthdecile==5), "inwards"),
             flowsummaryperc(subset(summary, hlthdecile==6), "inwards"),
             flowsummaryperc(subset(summary, hlthdecile==7), "inwards"),
             flowsummaryperc(subset(summary, hlthdecile==8), "inwards"),
             flowsummaryperc(subset(summary, hlthdecile==9), "inwards"),
             flowsummaryperc(subset(summary, hlthdecile==10), "inwards"),
             flowsummaryperc(subset(summary, hlthdecile==1), "outwards"), 
             flowsummaryperc(subset(summary, hlthdecile==2), "outwards"), 
             flowsummaryperc(subset(summary, hlthdecile==3), "outwards"),
             flowsummaryperc(subset(summary, hlthdecile==4), "outwards"),
             flowsummaryperc(subset(summary, hlthdecile==5), "outwards"),
             flowsummaryperc(subset(summary, hlthdecile==6), "outwards"),
             flowsummaryperc(subset(summary, hlthdecile==7), "outwards"),
             flowsummaryperc(subset(summary, hlthdecile==8), "outwards"),
             flowsummaryperc(subset(summary, hlthdecile==9), "outwards"),
             flowsummaryperc(subset(summary, hlthdecile==10), "outwards"),
             flowsummaryperc(subset(summary, hlthdecile==1), "another"), 
              flowsummaryperc(subset(summary, hlthdecile==2), "another"), 
              flowsummaryperc(subset(summary, hlthdecile==3), "another"),
              flowsummaryperc(subset(summary, hlthdecile==4), "another"),
              flowsummaryperc(subset(summary, hlthdecile==5), "another"),
              flowsummaryperc(subset(summary, hlthdecile==6), "another"),
              flowsummaryperc(subset(summary, hlthdecile==7), "another"),
              flowsummaryperc(subset(summary, hlthdecile==8), "another"),
              flowsummaryperc(subset(summary, hlthdecile==9), "another"),
              flowsummaryperc(subset(summary, hlthdecile==10), "another"))

direction <- c(rep("inwards", 10), rep("outwards", 10), rep("another", 10))

deciles <- c(1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10)

percentagesDf <- data.frame(deciles, percentages, direction)

ggplot(percentagesDf) +
  labs(title="", y="Percentage", x="Health decile") +
  geom_bar(aes(x=deciles, y=percentages, fill=direction), stat="identity") +
  scale_x_continuous(breaks=c(1:10), labels=c("1","2","3","4","5","6","7","8","9","10")) +
  theme(panel.border = element_rect(color = "#262626", size = 1.5, linetype = "solid", fill=NA)) +
  scale_fill_manual(values=colours)




library("RPostgreSQL")
library("ggplot2")
library("grid")

#
# Create a simple chart showing the total physical activity time for each commute mode 
# as a percentage of the required physical activity in the NHS guidelines.
# Save each of these as a PNG file with the "group_id" identifier, which keeps together each distinct commute by the mode measured.
# These are later used in the QGis Atlas as external images.
#

dbname <- {"production"}
dbuser <- {"postgres"}
dbport <- {"5432"}
dbpw <- {"xxxxxxxxxxxxxxxxxxxx"}
dbhost <- {"localhost"}
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname = dbname, host = dbhost, port = dbport, user = dbuser, password = dbpw)
rm(dbpw)

#colour definitions for the categories
#requires the same name as the as each category
borderDefs <- c("Active"="#398237","Inactive"="#171717")
colourDefs <- c("Active"="#398237","Inactive"="#d4d4d4")


groups <- dbGetQuery(con,
"SELECT i.*,
	CASE 
		WHEN active_percent_5days > 100 THEN 100
		ELSE active_percent_5days
	END AS chart_percent_5days,
	CASE 
		WHEN active_percent_7days > 100 THEN 100
		ELSE active_percent_7days
	END AS chart_percent_7days,
	CASE 
		WHEN active_percent_5days >= 100 THEN 0
		ELSE 100-active_percent_5days 
	END AS remain_percent_5days,
	CASE 
		WHEN active_percent_7days >= 100 THEN 0
		ELSE 100-active_percent_7days 
	END AS remain_percent_7days
FROM (
SELECT group_id, 
	active_time_agg_cost,
	active_delay_time_agg_format,
	(active_time_agg_cost / ((150 / 5 :: decimal) * 60) :: decimal) * 100 AS active_percent_5days,
	(active_time_agg_cost / ((150 / 7 :: decimal) * 60) :: decimal) * 100 AS active_percent_7days
FROM batch_run_res_summary
WHERE sample = true
) i")


#now loop through the groups and create a bar chart for each
for(i in 1:nrow(groups))
{
  #based on https://stackoverflow.com/questions/13615562/ggplot-donut-chart
  #and https://stackoverflow.com/questions/55232334/r-ggplot-putting-annotation-in-geom-rect
  #i <- 1
  
  #transform the row into columns of data
  categories <- c("Active", "Inactive")
  percents <- c(groups[i, "chart_percent_5days"], groups[i, "remain_percent_5days"])
  
  # Add addition columns, needed for drawing with geom_rect.
  fractions = percents / sum(percents)
  maximums <- cumsum(fractions)
  minimums <- c(0, head(maximums, n=-1))

  #create custom data.frame with the data transposed
  plotDf <- data.frame(categories, percents, fractions, maximums, minimums)
  
  #and another one for the central label
  labels <- c(round(groups[i, "active_percent_5days"]))
  labelsDf <- data.frame(labels)

  # plot a donut chart PER group_id
  box <- ggplot(data=plotDf, aes(fill=categories, ymax=maximums, ymin=minimums, xmax=4, xmin=3)) +
    geom_rect(colour="#000000", size=0.5,
              show.legend = FALSE) +
    coord_polar(theta="y") +
    xlim(c(0, 4)) +
    theme(panel.grid=element_blank(),
          axis.text=element_blank(),
          axis.title = element_blank(),
          axis.ticks=element_blank(),
          panel.background = element_blank()
    ) +
    scale_colour_manual(name="", values=borderDefs) + #TODO Border colour not being used, only from the rect setting
    scale_fill_manual(name="", values=colourDefs) +
    annotate(geom="text", 
             x=0.75, y=0, 
             label=paste(toString(round(groups[i, "active_percent_5days"])), "%", sep=""),
             size=12,
             fontface=2,
             colour=borderDefs[1]
    ) +
    annotate(geom="text", 
             x=-1, y=0, 
             label="of the daily recommended physical activity",
             size=12,
             fontface=2,
             colour="#000000"
    )
             
    #geom_segment(aes(xend=c(10, NA), yend=c(10, NA)),
    #           arrow=arrow(length=unit(0.3,"cm")))
              
  #save file
  ggsave(paste("active_", groups[i, "group_id"], ".png", sep="", collapse=NULL),
         plot=box,
         device="png",
         width=7,
         height=7,
         units="cm",
         dpi=300)
}

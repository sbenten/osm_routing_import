library("RPostgreSQL")
library("ggplot2")

#
# Create a simple bar chart showing the total time for each commute mode
#and compare it to the other modes for the same commute. 
# Save each of these as a PNG file with the "group_id" identifier, which keeps together each distinct commute by the mode measured.
# These are later used in the QGis Atlas as external images.
#

dbname <- {"production"}
dbuser <- {"postgres"}
dbport <- {"5432"}
dbpw <- {"xxxxxxxxxxxxxxxxxxx"}
dbhost <- {"localhost"}
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname = dbname, host = dbhost, port = dbport, user = dbuser, password = dbpw)
rm(dbpw)

#borderDefs <- c("Car (door to door)"="#ab1415","Car (with parking)"="#295e89","Cycling"="#398237","Public Transport"="#c76300","Walking"="#693671")
#colourDefs <- c("Car (door to door)"="#e41a1c","Car (with parking)"="#377eb8","Cycling"="#4daf4a","Public Transport"="#ff7f00","Walking"="#984ea3") 


groups <- dbGetQuery(con,
                     "SELECT group_id, 
	                   mode_filter, 
                     CASE WHEN mode_filter = 1 THEN 'Car (door to door)'
                     WHEN mode_filter = 2 THEN 'Car (with parking)'
                     WHEN mode_filter = 3 THEN 'Cycling'
                     WHEN mode_filter = 4 THEN 'Walking'
                     WHEN mode_Filter = 6 THEN 'Public Transport'
                     END AS mode,
                     car_delay_time_agg_cost / 60 AS car_time, 
                     park_delay_time_agg_cost / 60 AS park_time,
                     bike_delay_time_agg_cost / 60 AS bike_time,
                     walk_delay_time_agg_cost / 60 AS walk_time,
                     CASE WHEN Coalesce(pt_delay_time_agg_cost, 0) = 0 THEN 0 ELSE pt_delay_time_agg_cost / 60 END AS pt_time,
                     to_char(car_delay_time_agg_cost * '00:00:01'::interval, 'MIm SSs'::text) AS car_time_format,
                     to_char(park_delay_time_agg_cost * '00:00:01'::interval, 'MIm SSs'::text) AS park_time_format,
                     to_char(bike_delay_time_agg_cost * '00:00:01'::interval, 'MIm SSs'::text) AS bike_time_format,
                     CASE WHEN walk_delay_time_agg_cost >= 3600 THEN 
                     to_char(walk_delay_time_agg_cost * '00:00:01'::interval, 'HH24h MIm SSs'::text)
                     ELSE
                     to_char(walk_delay_time_agg_cost * '00:00:01'::interval, 'MIm SSs'::text) 
                     END AS walk_time_format,
                     CASE WHEN pt_delay_time_agg_cost >= 3600 THEN
                     to_char(pt_delay_time_agg_cost * '00:00:01'::interval, 'HH24h MIm SSs'::text)
                     ELSE
                     to_char(pt_delay_time_agg_cost * '00:00:01'::interval, 'MIm SSs'::text) 
                     END AS pt_time_format
                     FROM batch_run_res_summary
                     WHERE sample = true")

#https://stackoverflow.com/questions/20123147/add-line-break-to-axis-labels-and-ticks-in-ggplot
addline_format <- function(x,...){
  gsub('\\s\\(','\n\\(',x)
}



#now loop through the groups and create a bar chart for each
for(i in 1:nrow(groups))
{
  #transform the row into columns of data
  modes <- c("Car (door to door)", "Car (with parking)", "Cycling", "Public Transport", "Walking")
  
  selectedMode <- c(rep(groups[i, "mode"], 5))
  
  times <- c(groups[i, "car_time"], groups[i, "park_time"], groups[i, "bike_time"], groups[i, "pt_time"], groups[i, "walk_time"])
  
  formats <- c(groups[i, "car_time_format"], groups[i, "park_time_format"], groups[i, "bike_time_format"], groups[i, "pt_time_format"], groups[i, "walk_time_format"])
  
  alphas <- c(ifelse(modes[1]==groups[i, "mode"], 1, 0.33), 
              ifelse(modes[2]==groups[i, "mode"], 1, 0.33),
              ifelse(modes[3]==groups[i, "mode"], 1, 0.33),
              ifelse(modes[4]==groups[i, "mode"], 1, 0.33),
              ifelse(modes[5]==groups[i, "mode"], 1, 0.33))
  
  #create custom data.frame with the data transposed
  plotDf <- data.frame(modes, selectedMode, times, formats, alphas)
  
  # plot a bar chart PER group_id
  bar <- ggplot(data=plotDf, aes(x=modes, y=times, fill=modes)) + 
    geom_bar(stat="identity", alpha=rev(plotDf$alphas)) + 
    coord_flip() +
    scale_x_discrete(limits = rev(plotDf$modes)) +
    scale_y_continuous(expand = c(0, 0), limits = c(0, round(max(plotDf$times)+5, -1))) +
    guides(fill=FALSE) + 
    theme(axis.title = element_text(size = 8),
          axis.title.y = element_blank(),
          axis.text.x = element_text(size = 7),
          axis.text.y = element_text(size = 7),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          panel.background = element_blank(),
          axis.line.x = element_line(colour = 'black'),
          legend.position = "none") +
    ylab("Time (minutes)") +
    scale_fill_manual(name="", values=colourDefs) +
    scale_colour_manual(name="", values=borderDefs)
  
  #save file
  ggsave(paste("time_", groups[i, "group_id"], ".png", sep="", collapse=NULL),
         plot=bar,
         device="png",
         width=9.5,
         height=4.5,
         units="cm",
         dpi=300)
}

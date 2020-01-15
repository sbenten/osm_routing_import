library("RPostgreSQL")
library("ggplot2")

#
# Create a simple chart showing topological profile of the path taken by commute mode.
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
groups <- dbGetQuery(con,
"SELECT DISTINCT group_id
FROM sheffield.batch_run_res_summary
WHERE sample = true")

for(i in 1:nrow(groups))
{
  #FOR TESTING PLOT ASSIGN i<-1 42

  #get the points for the lines(s) as x (distance), y (altitude) values from a pre-filled table
  sql <- paste("SELECT (SUM(distance) OVER (PARTITION BY group_id ORDER BY sub_group_id, batch_run_res_id, id) / 1000) AS X, altitude AS Y FROM sheffield.batch_run_res_points WHERE group_id = ", groups[i, "group_id"], " AND geom IS NOT NULL ORDER BY sub_group_id, batch_run_res_id, id;", sep="", collapse = NULL)
  groupDef <- dbGetQuery(con, sql)
  
  # variables for the polygon which requires a few extra points than a line
  xx <- c(groupDef$x, rev(groupDef$x))
  yy <- c(rep(0, nrow(groupDef)), rev(groupDef$y))
  plotDf <- data.frame(xx, yy)
  
  # plot a bar chart PER group_id
  tp <- ggplot(data=plotDf, aes(x = xx, y = yy)) + 
    geom_polygon(fill = "#398237") +
    scale_x_continuous(expand = c(0, 0)) +
    scale_y_continuous(expand = c(0, 0), limits = c(0, 300)) +
    theme(axis.title = element_text(size = 8),
          axis.text = element_text(size = 8),
          panel.background = element_blank(),
          panel.grid.major = element_line(colour = "black", size = 0.25, linetype = 3),
          panel.border = element_rect(colour = "black", fill = NA),
          legend.position = "none") +
    xlab("Distance (km)") +
    ylab("Height (m)") 
  
  #save file
  ggsave(paste("topov3_", groups[i, "group_id"], ".png", sep="", collapse=NULL),
         plot=tp,
         device="png",
         width=25.5,
         height=4.5,
         units="cm",
         dpi=300)
}

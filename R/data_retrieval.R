
library(ggplot2)
library(reshape2)
library(lubridate)
library(scales)
library(RColorBrewer)
# Data Visualizations for PLOS data
# 
data <- read.csv('data/many_articles.csv', header = T)
# Convert pub date to Date and get months since pub to now.
data$publication_date <- as.Date(data$publication_date)
data$months <- round(difftime(as.Date(now()), sub_data$publication_date, unit ="weeks")/4)
data <- arrange(data, publication_date)
# Aggregating stats
data2 <- data[, 1:10]
data2$facebook <- apply(data[,grepl("facebook", names(data))], 1, sum)
data2$mendeley <- apply(data[,grepl("mendeley", names(data))], 1, sum)
data2$twitter <- data$twitter
data2$months <- as.numeric(data$months)
data2$scopus <- data$scopus
data2$pmc <- data$pmc

d3 <- melt(data2, id.vars=c(1:7,14))

myPalette <- colorRampPalette(rev(brewer.pal(11, "Spectral")))

ggplot(d3, aes(months, variable, fill = value)) + geom_tile() + 
 scale_fill_gradientn(colours = myPalette(100)) + facet_wrap(~journal) + scale_x_discrete(expand = c(0, 0)) + scale_y_discrete(expand = c(0, 0)) + coord_flip() 
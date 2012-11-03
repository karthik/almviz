
library(ggplot2)
library(reshape2)
library(lubridate)
# Data Visualizations for PLOS data
# 
data <- read.csv('data/many_articles.csv', header = T)
data$total_count <- apply(sub_data[,8:ncol(sub_data)], 1, sum)
data$publication_date <- 
sub_data <- melt(data, id.vars = 1:7)

f_data <- subset(sub_data, variable == "total_count")
ggplot(f_data, aes(doi, value, color = journal, show_guides = FALSE)) + geom_point(aes(size = 1.2 * value), show_guide = FALSE) 



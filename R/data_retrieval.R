
library(ggplot2)
library(reshape2)
library(lubridate)
require(scales)

# Data Visualizations for PLOS data
# 
data <- read.csv('data/many_articles.csv', header = T)
# Convert pub date to Date and get months since pub to now.
data$publication_date <- as.Date(data$publication_date)
data$months <- round(difftime(as.Date(now()), sub_data$publication_date, unit ="weeks")/4)
data <- arrange(data, publication_date)




# f_data <- subset(sub_data, variable == "counter_html")
# ggplot(f_data, aes(doi, value, color = journal)) + geom_point(aes(size = 1.2 * value), show_guide = FALSE) 


# ggplot(subset(sub_data, journal == "PLoS Biology"), aes(publication_date, counter_html, color = journal)) + geom_point(aes(size = 5 * scopus), show_guide = FALSE) 

# ggplot(sub_data, aes(publication_date, counter_html, color = journal)) + geom_point(aes(size = 5 * scopus)) 

# # + scale_y_log10()

ggplot(sub_data, ) + facet_wrap(~journal)
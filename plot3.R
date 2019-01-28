library(tidyverse)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds") 
#Contains data frame with all PM2.5 emissions data for the years
#Contains # of tons

SCC <- readRDS("Source_Classification_Code.rds")
#Provides a mapping from the SC digit strings to the actual name of the source


#Question 3
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? 
#Use the ggplot2 plotting system to make a plot answer this question.
agg_NEI_Balt_type <- NEI %>% group_by(year,type) %>% filter(fips == "24510") %>% summarize(totalEmissions = sum(Emissions, na.rm = TRUE))
agg_NEI_Balt_type %>% ggplot(aes(x = factor(year), y = totalEmissions)) + geom_bar(stat = 'identity', aes(fill = type))
#Increases: Point increased until 2005, where it went back down to right above starting
#Descreases: Non-road, nonpoint, and on-road all saw decreases



dev.copy(png,"plot3.png", width=480, height=480)
dev.off()

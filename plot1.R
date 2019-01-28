library(tidyverse)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds") 
#Contains data frame with all PM2.5 emissions data for the years
#Contains # of tons

SCC <- readRDS("Source_Classification_Code.rds")
#Provides a mapping from the SC digit strings to the actual name of the source

#Question 1
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all 
#sources for each of the years 1999, 2002, 2005, and 2008.
agg_NEI <- NEI %>% group_by(year) %>% summarize(totalEmissions = sum(Emissions, na.rm = TRUE))
plot(agg_NEI$year, agg_NEI$totalEmissions, type = 'l',xlab = "year", ylab ="Total emissions (tons)")
#Yes, total emissions have decreased.


dev.copy(png,"plot1.png", width=480, height=480)
dev.off()

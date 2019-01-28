library(tidyverse)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds") 
#Contains data frame with all PM2.5 emissions data for the years
#Contains # of tons

SCC <- readRDS("Source_Classification_Code.rds")
#Provides a mapping from the SC digit strings to the actual name of the source

#Question 2
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
#fips == "24510"from 1999 to 2008? Use the base plotting system to make a plot answering this question.

agg_NEI_Balt <- NEI %>% group_by(year) %>% filter(fips == "24510") %>% summarize(totalEmissions = sum(Emissions, na.rm = TRUE))
plot(agg_NEI_Balt$year, agg_NEI_Balt$totalEmissions, type = 'l',xlab = "year", ylab ="Total emissions (tons)")
#Yes they have, but there was a spike in emissions in 2005

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()

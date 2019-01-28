library(tidyverse)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds") 
#Contains data frame with all PM2.5 emissions data for the years
#Contains # of tons

SCC <- readRDS("Source_Classification_Code.rds")
#Provides a mapping from the SC digit strings to the actual name of the source

# Question 5
#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
carBool <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = T)
carCodes <- SCC[carBool,]$SCC
carCodes
carNEI <- NEI[NEI$SCC %in% carCodes,]
carNEI
NEI_car_balt <- carNEI %>% filter(fips == "24510")

NEI_car_balt %>% ggplot(aes(x=factor(year),y = Emissions))+ geom_bar(stat = "identity")
#Emissions have severely decreased in Baltimore since 1999




dev.copy(png,"plot5.png", width=480, height=480)
dev.off()

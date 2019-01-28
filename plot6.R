library(tidyverse)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds") 
#Contains data frame with all PM2.5 emissions data for the years
#Contains # of tons

SCC <- readRDS("Source_Classification_Code.rds")
#Provides a mapping from the SC digit strings to the actual name of the source




#Question 6
#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037").
#Which city has seen greater changes over time in motor vehicle emissions?
carBool <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = T)
carCodes <- SCC[carBool,]$SCC
carCodes
carNEI <- NEI[NEI$SCC %in% carCodes,]
carNEI
NEI_car_balt<- carNEI %>% filter(fips == "06037")
NEI_car_la<- carNEI %>% filter(fips == "24510")
NEI_car_balt_la <- rbind(NEI_car_balt, NEI_car_la)
NEI_car_balt_la %>% ggplot(aes(x = factor(year), y = Emissions)) + geom_bar(stat = "identity",aes(fill = fips))
#LA has seen greater changes over time with regards to motor vehicle emissions. 
#It increased from 1999 to 2005, and then decreased to just above starting levels in 2008






dev.copy(png,"plot6.png", width=480, height=480)
dev.off()

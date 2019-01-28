library(tidyverse)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds") 
#Contains data frame with all PM2.5 emissions data for the years
#Contains # of tons

SCC <- readRDS("Source_Classification_Code.rds")
#Provides a mapping from the SC digit strings to the actual name of the source
#Question 4
#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
coalBool <- grepl("Coal",SCC$SCC.Level.Four,ignore.case = T)
combustionBool <- grepl("combustion",SCC$SCC.Level.One, ignore.case = T)
coalCombBool <- combustionBool & coalBool
coalCodes <- SCC[coalCombBool,]$SCC
coalNEI <- NEI[NEI$SCC %in% coalCodes,]
coalNEI %>% ggplot(aes(x = factor(year), y = Emissions)) + geom_bar(stat = "identity")
#Emissions from coal-combustion sources went down in 2002, increased slightly in 2005 and decreased in 2008





dev.copy(png,"plot4.png", width=480, height=480)
dev.off()

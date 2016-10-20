NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

ALL<- merge(NEI, SCC, by = "SCC")

# 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

YearTypeVsEmissions <- aggregate( Emissions ~ year + type , NEI, sum)

#library(lattice)
#xyplot(YearTypeVsEmissions$Emissions ~ YearTypeVsEmissions$year | factor(YearTypeVsEmissions$type), type = "l", xlab = "Year", ylab ="Emission", main = "PM 2.5 Emission")

qplot(y=Emissions, x=year, data = YearTypeVsEmissions , facets = ~  type, geom = "line")
ggsave("plot3.png")

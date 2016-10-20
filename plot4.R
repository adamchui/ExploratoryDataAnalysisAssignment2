NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

ALL<- merge(NEI, SCC, by = "SCC")

# 4. Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

#Related EI Secotr
TargetGroup <- unique(grep("Fuel Comb.*-.*Coal", SCC$EI.Sector, value = TRUE))

CoalCombData <- subset(ALL, EI.Sector %in% TargetGroup)

YearVsEmissions_CoalComb <- aggregate( Emissions ~ year, CoalCombData, sum)

png("plot4.png", width = 480, height = 480)
plot(YearVsEmissions_CoalComb$Emissions ~ YearVsEmissions_CoalComb$year, type = "l", xlab = "Year", ylab ="Emission", main = "PM 2.5 Emission From Coal Combustion Related")
dev.off()

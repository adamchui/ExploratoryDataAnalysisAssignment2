NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

ALL<- merge(NEI, SCC, by = "SCC")


# 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

vehicles <- grep("vehicle", ALL$SCC.Level.Two, ignore.case = TRUE)
vehiclesSet <- ALL[vehicles, ]
vehiclesSet_Baltimore <- vehiclesSet[vehiclesSet$fips == 24510, ]
vehiclesSet_LA <- vehiclesSet[vehiclesSet$fips == "06037", ]

YearVsEmissions_Baltimore_Motor <- aggregate( Emissions ~ year, vehiclesSet_Baltimore, sum)
YearVsEmissions_LA_Motor <- aggregate( Emissions ~ year, vehiclesSet_LA, sum)

png("plot6.png", width = 480, height = 480)
plot(y = YearVsEmissions_LA_Motor$Emissions , x = YearVsEmissions_LA_Motor$year, type = "l", xlab = "Year", ylab ="Emission", main = "PM 2.5 Emission From Vehicles in Baltimore & LA", col = "red", ylim = c(0,10000))
lines(y = YearVsEmissions_Baltimore_Motor$Emissions, x = YearVsEmissions_Baltimore_Motor$year, col = "blue")
legend('topright' , legend = c("LA","Baltimore"), lty = c(1,1,1), cex=0.8, col = c("red","blue"))
dev.off()




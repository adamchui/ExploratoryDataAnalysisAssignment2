NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

ALL<- merge(NEI, SCC, by = "SCC")

# 5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

vehicles <- grep("vehicle", ALL$SCC.Level.Two, ignore.case = TRUE)
vehiclesSet <- ALL[vehicles, ]
vehiclesSet_Baltimore <- vehiclesSet[vehiclesSet$fips == 24510, ]

YearVsEmissions_Baltimore_Motor <- aggregate( Emissions ~ year, vehiclesSet_Baltimore, sum)

png("plot5.png", width = 480, height = 480)
plot(YearVsEmissions_Baltimore_Motor$Emissions ~ YearVsEmissions_Baltimore_Motor$year, type = "l", xlab = "Year", ylab ="Emission", main = "PM 2.5 Emission From Vehicles in Baltimore")
dev.off()


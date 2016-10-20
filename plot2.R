NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

ALL<- merge(NEI, SCC, by = "SCC")


# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.


YearVsEmissions_Baltimore <- aggregate( Emissions ~ year, ALL[ALL$fips == "24510",], sum)

png("plot2.png", width = 480, height = 480)
plot(YearVsEmissions_Baltimore$Emissions ~ YearVsEmissions_Baltimore$year, type = "l", xlab = "Year", ylab ="Emission", main = "PM 2.5 Emission in Baltimore")
dev.off()

setwd("C:/Users/HomeUser/Documents/Spécialité Data Science/Exploratory Data Analysis/repos/NEI_UsPollution")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("../../data/summarySCC_PM25.rds")
SCC <- readRDS("../../data/Source_Classification_Code.rds")

head(SCC)
head(NEI)

subset_totalPM <- aggregate(Emissions ~ year, data = NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",], sum)

png(file = "plot5.png", width = 480, height = 480, bg = "transparent")
plot(subset_totalPM, type="line"
     ,xlab = "Year"
     ,ylab = "Tons of PM2.5"
     ,main = "Baltimore: PM2.5 Emissions from motor vehicle sources")
dev.off()
setwd("C:/Users/HomeUser/Documents/Spécialité Data Science/Exploratory Data Analysis/repos/NEI_UsPollution")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("../../data/summarySCC_PM25.rds")
SCC <- readRDS("../../data/Source_Classification_Code.rds")

head(SCC)
head(NEI)

Baltimore_NEI <- NEI[NEI$fips == "24510",]
Baltimore_totalPM <- tapply(Baltimore_NEI$Emissions, Baltimore_NEI$year, sum)

png(file = "plot2.png", width = 480, height = 480, bg = "transparent")
plot(names(Baltimore_totalPM),Baltimore_totalPM, type = "l"
     ,xlab = "Year"
     ,ylab = "Tons of PM2.5"
     ,main = "Baltimore: Fine particulate matter emission by year")
dev.off()
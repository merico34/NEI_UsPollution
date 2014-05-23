setwd("C:/Users/HomeUser/Documents/Spécialité Data Science/Exploratory Data Analysis/repos/NEI_UsPollution")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("../../data/summarySCC_PM25.rds")
SCC <- readRDS("../../data/Source_Classification_Code.rds")

head(SCC)
head(NEI)

#1.
totalPM <- tapply(NEI$Emissions, NEI$year, sum)
head(totalPM)

png(file = "plot1.png", width = 480, height = 480, bg = "transparent")
plot(names(totalPM),totalPM, type = "l"
     ,xlab = "Year"
     ,ylab = "Tons of PM2.5"
     ,main = "Fine particulate matter emission by year")
dev.off()
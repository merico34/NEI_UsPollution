setwd("C:/Users/HomeUser/Documents/Spécialité Data Science/Exploratory Data Analysis/repos/NEI_UsPollution")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("../../data/summarySCC_PM25.rds")
SCC <- readRDS("../../data/Source_Classification_Code.rds")

head(SCC)
head(NEI)

library(ggplot2)

subset_totalPM <- aggregate(Emissions ~ year + fips, data = NEI[(NEI$fips == "24510" | NEI$fips == "06037") & NEI$type == "ON-ROAD",], sum)

png(file = "plot6.png", width = 680, height = 480, bg = "transparent")

ggplot(subset_totalPM, aes(x=year, y = Emissions)) +
        facet_grid(facets = fips ~ . ,scales="free") +
        geom_line() +
        labs(x = "Year") +
        labs(y = "Tons of PM2.5") +
        labs(title = "Baltimore (24510) VS Los Angeles (06037): PM2.5 Emissions from motor vehicle sources")

dev.off()
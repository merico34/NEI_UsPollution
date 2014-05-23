setwd("C:/Users/HomeUser/Documents/Spécialité Data Science/Exploratory Data Analysis/repos/NEI_UsPollution")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("../../data/summarySCC_PM25.rds")
SCC <- readRDS("../../data/Source_Classification_Code.rds")

head(SCC)
head(NEI)

library(ggplot2)

subset_totalPM <- aggregate(Emissions ~ year + type, data = NEI[NEI$fips == "24510",], sum)

png(file = "plot3.png", width = 480, height = 480, bg = "transparent")
ggplot(subset_totalPM, aes(x=year, y = Emissions)) +
        facet_grid(facets = type ~ . ,scales="free") +
        geom_line()
#        geom_line(aes(color = type))
dev.off()
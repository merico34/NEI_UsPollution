setwd("C:/Users/HomeUser/Documents/Spécialité Data Science/Exploratory Data Analysis/repos/NEI_UsPollution")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("../../data/summarySCC_PM25.rds")
SCC <- readRDS("../../data/Source_Classification_Code.rds")

head(SCC)
head(NEI)

SCC_coal_comb <- SCC[grepl("combustion", SCC$SCC.Level.One, ignore.case=TRUE)
                     & (grepl("coal", SCC$SCC.Level.Three, ignore.case=TRUE)
                        | grepl("lignite", SCC$SCC.Level.Three, ignore.case=TRUE)),]

subset_totalPM <- aggregate(Emissions ~ year, data = NEI[NEI$SCC %in% SCC_coal_comb$SCC,], sum)

png(file = "plot4.png", width = 480, height = 480, bg = "transparent")
plot(subset_totalPM, type="line"
     ,xlab = "Year"
     ,ylab = "Tons of PM2.5"
     ,main = "US PM2.5 Emissions from coal combustion-related sources")
dev.off()
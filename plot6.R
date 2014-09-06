source("datprep.R")

# Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, California 
# (fips == "06037"). Which city has seen greater changes over time in motor 
# vehicle emissions?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# all motor vehicle IDs, includes aircraft & marine vessels
nums <- SCC$SCC[c(542:2288, 4313:4332)]

# subset to baltimore city and LA
baltimore <- subset(NEI, NEI$fips == "24510")
angels <- subset(NEI, NEI$fips == "06037")

# subset all baltimore & LA emissions, where SCC is in nums
baltmotor <- subset(baltimore, baltimore$SCC %in% nums)
angelsmotor <-subset(angels, angels$SCC %in% nums)

#sum up emissions data
baltdata <- tapply(baltmotor$Emissions, baltmotor$year, sum)
angelsdata <- tapply(angelsmotor$Emissions, angelsmotor$year, sum)

# plot with 1-row, 2 cols
png("plot6.png")
par(mfrow = c(1,2))
barplot(baltdata, xlab = "Year", ylab=expression(~ PM[2.5] ~ "Emissions (tons)"), 
        main=expression("Baltimore" ~ PM[2.5] ~ "Vehicle Emissions"), col="red")
barplot(angelsdata, xlab = "Year", ylab=expression(~ PM[2.5] ~ "Emissions (tons)"), 
        main=expression("LA" ~ PM[2.5] ~ "Vehicle Emissions"), col="red")
dev.off()


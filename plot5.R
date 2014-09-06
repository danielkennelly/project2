source("datprep.R")

# How have emissions from motor vehicle sources 
# changed from 1999–2008 in Baltimore City?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# all motor vehicle IDs, includes aircraft & marine vessels
nums <- SCC$SCC[c(542:2288, 4313:4332)]

# subset to baltimore city
baltimore <- subset(NEI, NEI$fips == "24510")

# subset all baltimore emissions, where SCC is in nums
motor <- subset(baltimore, baltimore$SCC %in% nums)

#sum up emissions data
data <- tapply(motor$Emissions, motor$year, sum)

png("plot5.png")
barplot(data, xlab = "Year", ylab=expression(~ PM[2.5] ~ "Emissions (tons)"), 
        main=expression("Baltimore" ~ PM[2.5] ~ "Vehicle Emissions"), col="red")
dev.off()
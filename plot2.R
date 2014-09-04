source("datprep.R")

# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? Use the base 
# plotting system to make a plot answering this question.

NEI <- readRDS("summarySCC_PM25.rds")

baltimore <- subset(NEI, NEI$fips == "24510")

baltdat <- tapply(baltimore$Emissions, baltimore$year, sum)

png("plot2.png")
barplot(baltdat, xlab = "Year", ylab=expression(~ PM[2.5] ~ "Emissions (tons)"), 
        main=expression("Total Baltimore"~ PM[2.5] ~ "Emissions by Year"), 
        col="red")
dev.off()
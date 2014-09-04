source("datprep.R")

NEI <- readRDS("summarySCC_PM25.rds")

data <- tapply(NEI$Emissions, NEI$year, sum)

png("plot1.png")
barplot(data, xlab = "Year", ylab=expression(~ PM[2.5] ~ "Emissions (tons)"), 
        main=expression("Total US"~ PM[2.5] ~ "Emissions by Year"), col="red")
dev.off()
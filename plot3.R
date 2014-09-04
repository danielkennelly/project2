source("datprep.R")

#Of the four types of sources indicated by the type (point, nonpoint, onroad, 
#nonroad) variable, which of these four sources have seen decreases in emissions 
#from 1999–2008 for Baltimore City? Which have seen increases in emissions from 
#1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")

baltimore <- subset(NEI, NEI$fips == "24510")
baltimore$year <- as.factor(baltimore$year)
baltimore$type <- as.factor(baltimore$type)


png("plot3.png")
plot3 <- ggplot(baltimore, aes(year, Emissions))
plot3 <- plot3 + geom_bar(stat="identity")
plot3 <- plot3 + ylab(expression(~ PM[2.5] ~ "Emissions (tons)"))
plot3 <- plot3 + ggtitle(expression("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year and Type"))
plot3 <- plot3 + facet_grid(. ~ type)
plot3
dev.off()
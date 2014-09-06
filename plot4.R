source("datprep.R")

#Across the United States, how have emissions from coal combustion-related 
#sources changed from 1999–2008?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#all coal IDs
nums <- subset(SCC$SCC, grepl("[Cc]oal", SCC$Short.Name))

#subset all NEI obs. where NEI$SCC is in nums
coal <- subset(NEI, NEI$SCC %in% nums)

#sum emissions
data <- tapply(coal$Emissions, coal$year, sum)

png("plot4.png")
barplot(data, xlab = "Year", ylab=expression(~ PM[2.5] ~ "Emissions (tons)"), 
        main=expression("Total US"~ PM[2.5] ~ "Coal Emissions by Year"), col="red")
dev.off()
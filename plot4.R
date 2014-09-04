source("datprep.R")

#Across the United States, how have emissions from coal combustion-related 
#sources changed from 1999–2008?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


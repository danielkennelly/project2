#download and unzip files
if (!"summarySCC_PM25.rds" %in% list.files() | !"Source_Classification_Code.rds" %in% list.files()) {
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
        destfile <- "dataset.zip"
        download.file(url, destfile, method = "curl")
        unzip(destfile)
}
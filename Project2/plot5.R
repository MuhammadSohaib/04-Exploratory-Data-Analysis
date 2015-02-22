library(ggplot2)
destfile <- "Data-EDA-Project2"
NEI <- readRDS(paste("data", destfile, "summarySCC_PM25.rds", sep="/"))
SCC <- readRDS(paste("data", destfile, "Source_Classification_Code.rds", sep="/"))

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
data_source <- SCC[vehicles,]$SCC
data <- NEI[NEI$SCC %in% data_source,]
data_subset <- subset(data, fips == "24510") 

png("plot5.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)

plot <- ggplot(data_subset,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(plot)

dev.off()

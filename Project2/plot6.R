library(ggplot2)
destfile <- "Data-EDA-Project2"
NEI <- readRDS(paste("data", destfile, "summarySCC_PM25.rds", sep="/"))
SCC <- readRDS(paste("data", destfile, "Source_Classification_Code.rds", sep="/"))

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
data_source <- SCC[vehicles,]$SCC
data <- NEI[NEI$SCC %in% data_source,]
data_subset <- subset(data, fips == "24510") 
data_subset$city<-"Baltimore City"

data_subset2 <- subset(data, fips == "06037") 
data_subset2$city<-"Los Angeles County"

merge_data<-rbind(data_subset,data_subset2)
png("plot6.png",width=480,height=480,units="px",bg="transparent")


plot <- ggplot(merge_data, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

print(plot)

dev.off()
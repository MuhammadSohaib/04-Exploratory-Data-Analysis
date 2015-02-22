#Plot2

destfile <- "Data-EDA-Project2"
NEI <- readRDS(paste("data", destfile, "summarySCC_PM25.rds", sep="/"))
data_subset <- subset(NEI, fips == "24510") 
Total <- aggregate(Emissions ~ year, data_subset,sum)
png("plot2.png",width=480,height=480,units="px",bg="transparent")

barplot(
  Total$Emissions,
  names.arg=Total$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From all Baltimore City Sources"
)

dev.off()


#Plot1

destfile <- "Data-EDA-Project2"
NEI <- readRDS(paste("data", destfile, "summarySCC_PM25.rds", sep="/"))
Total <- aggregate(Emissions ~ year,NEI, sum)
png("plot1.png",width=480,height=480,units="px",bg="transparent")

barplot(
  (Total$Emissions)/10^6,
  names.arg=Total$year,
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total PM2.5 Emissions From All US Sources"
)

dev.off()
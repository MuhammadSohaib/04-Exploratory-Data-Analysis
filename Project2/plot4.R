library(ggplot2)
destfile <- "Data-EDA-Project2"
NEI <- readRDS(paste("data", destfile, "summarySCC_PM25.rds", sep="/"))
SCC <- readRDS(paste("data", destfile, "Source_Classification_Code.rds", sep="/"))

combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
merge <- (combustion & coal)
data_SCC <- SCC[merge,]$SCC
data <- NEI[NEI$SCC %in% data_SCC,]

png("plot5.png",width=480,height=480,units="px",bg="transparent")
plot <- ggplot(data,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

print(plot)

dev.off()

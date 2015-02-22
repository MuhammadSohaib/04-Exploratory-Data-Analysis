library(ggplot2)

destfile <- "Data-EDA-Project2"
NEI <- readRDS(paste("data", destfile, "summarySCC_PM25.rds", sep="/"))
data_subset <- subset(NEI, fips == "24510") 

png("plot3.png",width=480,height=480,units="px",bg="transparent")

plot <- ggplot(data_subset,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(plot)

dev.off()
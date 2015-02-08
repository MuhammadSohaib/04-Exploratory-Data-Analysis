plot2<-function(){
  data<- read.table(file.choose(), header=T, stringsAsFactors = F, na.strings= "?",sep=";")
  data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
  png("plot2.png", width=480, height= 480)
  plot(data$DateTime, data$Global_active_power,type= "l",ylab= "Global Active Power (kilowatts)",xlab="")
  dev.off()
}
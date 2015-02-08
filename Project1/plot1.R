plot1<-function(){
  data<- read.table(file.choose(), header=T, stringsAsFactors = F, na.strings= "?",sep=";")
  data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 
  png("plot1.png", width=480, height= 480)
  hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power",col= "red")
  dev.off()
}
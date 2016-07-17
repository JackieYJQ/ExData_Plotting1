file<- file("D:/Bentley/Data Science/dataset/household_power_consumption.txt")
data<-read.table(text = grep("^[1,2]/2/2007",readLines(file),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data<-data[complete.cases(data),]
data$DateTime<-paste(data$Date,data$Time)
data<-data[,3:10]
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
Sys.setlocale(category = "LC_ALL", locale = "english")
plot2<- plot(data$Global_active_power~data$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png",width=480,height=480)
dev.off()
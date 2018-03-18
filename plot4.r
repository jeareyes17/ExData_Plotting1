#read file
power<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
#format date
power$Date<-as.Date(as.character(power$Date),"%d/%m/%Y")
#filter the data
data<-subset(power, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
data$Global_active_power<-as.numeric(data$Global_active_power)
data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
#graph data
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,bty="n",
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global Reactive Power (kilowatts)",xlab="")
})
#save the file
dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()
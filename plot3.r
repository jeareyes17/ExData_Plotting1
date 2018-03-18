#read file
power<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
#format date
power$Date<-as.Date(as.character(power$Date),"%d/%m/%Y")
#filter the data
data<-subset(power, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
data$Global_active_power<-as.numeric(data$Global_active_power)
data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
#graph data
with(data,{
plot(data$DateTime, data$Sub_metering_1, type="l", ylab = "Energy sub metering",xlab="")
lines(Sub_metering_2~DateTime,col="Red")
lines(Sub_metering_3~DateTime,col="Blue")
})
legend("topright",col=c("black","red","blue"),lty=1,lwd=1,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#save the file
dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()

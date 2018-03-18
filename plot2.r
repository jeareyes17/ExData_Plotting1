#read file
power<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
#format date
power$Date<-as.Date(as.character(power$Date),"%d/%m/%Y")
#filter the data
data<-subset(power, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
#graph data
plot(data$DateTime,data$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l") 
#save the file
dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()
 



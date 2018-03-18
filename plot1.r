#read file
power<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
#format date
power$Date<-as.Date(as.character(power$Date),"%d/%m/%Y")
#filter the data
data<-subset(power, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
data$Global_active_power<-as.numeric(data$Global_active_power)
#construct graph
hist(data$Global_active_power,col="red",20,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
#save the file
dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()
 
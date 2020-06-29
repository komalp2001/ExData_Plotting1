data <- read.csv("household_power_consumption.txt", header=T, sep=';')
data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)
with(data1, plot(Sub_metering_1~Datetime, type = "l", 
                 ylab = "Energy sub metering", xlab = ""))
lines(data1$Sub_metering_2~data1$Datetime,col='Red')
lines(data1$Sub_metering_3~data1$Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
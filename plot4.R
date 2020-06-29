data <- read.csv("household_power_consumption.txt", header=T, sep=';')
data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)
par(mfcol = c(2,2))

## Plot 2
with(data1, {
          plot(Global_active_power~Datetime, type="l",
               ylab="Global Active Power (kilowatts)", xlab="")})

## Plot 3
with(data1, plot(Sub_metering_1~Datetime, type = "l", 
                 ylab = "Energy sub metering", xlab = ""))
lines(data1$Sub_metering_2~data1$Datetime,col='Red')
lines(data1$Sub_metering_3~data1$Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Plot 4
with(data1, plot(data1$Voltage~data1$Datetime, type = "l", xlab = "datetime", 
                 ylab = "Voltage"))

## Plot 5 
with(data1, plot(data1$Global_reactive_power~data1$Datetime, type = "l", 
                 xlab = "datetime", ylab = "Global_reactive_power"))
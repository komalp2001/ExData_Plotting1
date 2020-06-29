data <- read.csv("household_power_consumption.txt", header=T, sep=';')
data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

## Plot 2
with(data1, {
          plot(Global_active_power~Datetime, type="l",
               ylab="Global Active Power (kilowatts)", xlab="")})
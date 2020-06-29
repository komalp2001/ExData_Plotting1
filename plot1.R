data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data1 <- subset(data1, Global_active_power != "?")
data1$Global_active_power <- as.numeric(data1$Global_active_power)
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
png(filename = "plot1.png")
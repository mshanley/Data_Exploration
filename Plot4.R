##Using terminal window to limit data after download
##head -n 1 household_power_consumption.txt > feb2007data.txt cat household_power_consumption.txt  | grep '^0\{0,1\}[12]/0\{0,1\}2/2007' >> feb2007data.txt
##cat household_power_consumption.txt  | grep '^0\{0,1\}[12]/0\{0,1\}2/2007' >> feb2007data.txt
##Set Working Directory

datafile <- "feb2007data.txt"
data <- read.table(datafile, sep = ";", header = T, na.strings = "?")

data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png('plot4.png')
par(mfrow = c(2, 2))

# plot1
plot(data$Datetime, data$Global_active_power, type = "l", ylab = "Global Active Power", 
     xlab = "")

# plot2
plot(data$Datetime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# plot3
plot(data$Datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", 
     xlab = "", col = "black")
points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", 
       col = "red")
points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", 
       col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                        "Sub_metering_2", "Sub_metering_3"), bty = "n", )

# plot4
plot(data$Datetime, data$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power", ylim = c(0, 0.5))
dev.off()
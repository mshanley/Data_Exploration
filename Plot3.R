##Using terminal window to limit data after download
##head -n 1 household_power_consumption.txt > feb2007data.txt cat household_power_consumption.txt  | grep '^0\{0,1\}[12]/0\{0,1\}2/2007' >> feb2007data.txt
##cat household_power_consumption.txt  | grep '^0\{0,1\}[12]/0\{0,1\}2/2007' >> feb2007data.txt
##Set Working Directory

datafile <- "feb2007data.txt"
data <- read.table(datafile, sep = ";", header = T, na.strings = "?")

data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png('plot3.png')
plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "red")
points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                        "Sub_metering_2", "Sub_metering_3"))
dev.off()
##Using terminal window to limit data after download
##head -n 1 household_power_consumption.txt > feb2007data.txt cat household_power_consumption.txt  | grep '^0\{0,1\}[12]/0\{0,1\}2/2007' >> feb2007data.txt
##cat household_power_consumption.txt  | grep '^0\{0,1\}[12]/0\{0,1\}2/2007' >> feb2007data.txt
##Set Working Directory

datafile <- "feb2007data.txt"
data <- read.table(datafile, sep = ";", header = T, na.strings = "?")

data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png('plot2.png')
plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
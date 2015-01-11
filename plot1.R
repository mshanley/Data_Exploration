##Using terminal window to limit data after download
##head -n 1 household_power_consumption.txt > feb2007data.txt cat household_power_consumption.txt  | grep '^0\{0,1\}[12]/0\{0,1\}2/2007' >> feb2007data.txt
##cat household_power_consumption.txt  | grep '^0\{0,1\}[12]/0\{0,1\}2/2007' >> feb2007data.txt
##Set Working Directory

datafile <- "feb2007data.txt"
data <- read.table(datafile, sep = ";", header = T, na.strings = "?")

data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png('plot1.png')
hist(data$Global_active_power, main = "Global Active Power", ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13, ylim = c(0, 1200), xlim = c(0, 6), xaxp = c(0, 6, 3))
dev.off()

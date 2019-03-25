library(dplyr)

# Set the working directory
setwd("~/Coursera/Exploratory Data Analysis")

# Importing the data
data <- read.delim("household_power_consumption.txt", header=TRUE, sep=";", dec=".")
data <- mutate(data,t= as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S"))
data$Date <- as.Date(data$Date, format=c("%d/%m/%Y"))

# Select the data wiht the appropriate dates
epc <- dplyr::filter(data, Date=="2007-02-01" | Date=="2007-02-02")
epc <- unfactor(epc)

# Remove the "big" dataset from environment
rm(data)

# Plot 1
png("Plot1.png", width = 480, height = 480)
hist(epc$Global_active_power, col="red", main = "Global Active Power", xlab= "Global Active Power (Kilowatts)")
dev.off()

# Plot 2
png("Plot2.png", width = 480, height = 480)
plot(epc$t, epc$Global_active_power, type="l", main = "", ylab="Global Active Power (kilowatts)", xlab = "")
dev.off()

# Plot 3
png("Plot3.png", width = 480, height = 480)
plot(epc$t, epc$Sub_metering_1, type="l", ylab="Energy sub metering", main="", xlab="")
lines(epc$t, epc$Sub_metering_2, col="red")
lines(epc$t, epc$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=c(2,2), col=c("black", "red", "blue"), y.intersp = 1)
dev.off()

# Plot 4
png("Plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(epc$t, epc$Global_active_power, type="l", main = "", ylab="Global Active Power", xlab = "")
plot(epc$t, epc$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", main = "")
plot(epc$t, epc$Sub_metering_1, type="l", ylab="Energy sub metering", main="", xlab="")
lines(epc$t, epc$Sub_metering_2, col="red")
lines(epc$t, epc$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=c(2,2), col=c("black", "red", "blue"), y.intersp = 1)
plot(epc$t, epc$Global_active_power, xlab = "datetime", ylab = "Global_active_power", type="l")
dev.off()



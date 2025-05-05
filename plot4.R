# Load and subset the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data2 <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
data2$DateTime <- strptime(paste(data2$Date, data2$Time), "%Y-%m-%d %H:%M:%S")

# Plot 4: Multi-panel diagnostic
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Top left
plot(data2$DateTime, data2$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

# Top right
plot(data2$DateTime, data2$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

# Bottom left
plot(data2$DateTime, data2$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(data2$DateTime, data2$Sub_metering_2, col = "red")
lines(data2$DateTime, data2$Sub_metering_3, col = "blue")
legend("topright", bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

# Bottom right
plot(data2$DateTime, data2$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global Reactive Power")
dev.off()


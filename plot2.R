# Load and subset the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data2 <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
data2$DateTime <- strptime(paste(data2$Date, data2$Time), "%Y-%m-%d %H:%M:%S")

# Plot 2: Line plot of Global Active Power
png("plot2.png", width = 480, height = 480)
plot(data2$DateTime, data2$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

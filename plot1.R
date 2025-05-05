# Load and subset the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data2 <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Plot 1: Histogram of Global Active Power
png("plot1.png", width = 480, height = 480)
hist(data2$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()

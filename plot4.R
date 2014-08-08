# Read source data into table

# Read one row (with column names) into table
power <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, nrows = 1)

# Get column names
names <- colnames(power)

# Read two specific days of data (column names with not be included)
power <- read.table("./data/household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# Add column names back
colnames(power) <- names

#power <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, nrows = 5000)

# Convert Date to date/time
power$Date <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")



# Plot to PNG file
png(filename = "./plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
plot(power$Date, power$Global_active_power, type = "l", 
     ylab = "Global Active Power", xlab = "")

plot(power$Date, power$Voltage, type = "l", 
     ylab = "Voltage", xlab = "datetime")

plot(power$Date, power$Sub_metering_1, type = "l", col = "black",
     ylab = "Energy sub metering", xlab = "")
lines(power$Date, power$Sub_metering_2, type = "l", col = "red")
lines(power$Date, power$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, lwd = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), inset = 0, bty = "n")

plot(power$Date, power$Global_reactive_power, type = "l", col = "black",
     ylab = "Global_reactive_power", xlab = "datetime")

dev.off()




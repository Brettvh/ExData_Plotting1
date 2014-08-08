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

# Create plot
png(filename = "./plot3.png", width = 480, height = 480, units = "px")
plot(power$Date, power$Sub_metering_1, type = "l", col = "black",
     ylab = "Energy sub metering", xlab = "")
lines(power$Date, power$Sub_metering_2, type = "l", col = "red")
lines(power$Date, power$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, lwd = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), inset = 0)
dev.off()


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
plot(power$Date, power$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")


# Copy plot to PNG file
dev.copy(png, file = "./plot2.png", width = 480, height = 480, units = "px")
dev.off()


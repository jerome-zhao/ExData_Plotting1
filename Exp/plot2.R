# Read data seperated by ";"
t <- read.csv2(file='household_power_consumption.txt', header = TRUE, sep=';')

# Filter data by Date and merge the data sets
data_1 <- t[t$Date=="1/2/2007", ]
data_2 <- t[t$Date=="2/2/2007", ]
data <- rbind(data_1, data_2)

# Date and time conversion
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S")

# Device PNG
png("plot2.png", 480, 480)

# Plotting
plot(data$datetime, as.numeric(as.character(data$Global_active_power)), type = 'l', 
     xlab = '', ylab = 'Global Active Power (kilowatts)')

# Close device
dev.off()
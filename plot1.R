# Read data seperated by ";"
t <- read.csv2(file='household_power_consumption.txt', header = TRUE, sep=';')

# Filter data by Date and merge the data sets
data_1 <- t[t$Date=="1/2/2007", ]
data_2 <- t[t$Date=="2/2/2007", ]
data <- rbind(data_1, data_2)

# PNG device
png('plot1.png', 480, 480)

# Create histogram
hist(as.numeric(as.character(data$Global_active_power)),
     main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red')

# Close device
dev.off()
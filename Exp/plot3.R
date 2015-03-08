# Read data seperated by ";"
t <- read.csv2(file='household_power_consumption.txt', header = TRUE, sep=';')

# Filter data by Date and merge the data sets
data_1 <- t[t$Date=="1/2/2007", ]
data_2 <- t[t$Date=="2/2/2007", ]
data <- rbind(data_1, data_2)

# Date and time conversion
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime, '%d/%m/%Y %H:%M:%S')

# PNG device
png('plot3.png', 480, 480)

# Plotting
with(data, {
  plot(datetime, Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
  lines(datetime, Sub_metering_2, col='red')
  lines(datetime, Sub_metering_3, col='blue')  
  legend('topright', lwd = 1, col = c('black', 'red', 'blue'), 
         legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
  }
)

dev.off()
# Filter data by Date and merge the data sets
data_1 <- t[t$Date=="1/2/2007", ]
data_2 <- t[t$Date=="2/2/2007", ]
data <- rbind(data_1, data_2)

# Date and time conversion
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime, '%d/%m/%Y %H:%M:%S')

png('plot4.png', 480, 480)

par(mfrow = c(2, 2))

with(data, {
  plot(datetime, as.numeric(as.character(Global_active_power)), type = 'l', xlab = '', ylab = 'Global Active Power')
  plot(datetime, Voltage, type = 'l')  
  plot(datetime, Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
  lines(datetime, Sub_metering_2, col='red')
  lines(datetime, Sub_metering_3, col='blue')
  legend('topright', bty = 'n', lwd = 1, col = c('black', 'red', 'blue'), 
         legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
  plot(datetime, as.numeric(as.character(Global_reactive_power)), type = 'l')
})

dev.off()
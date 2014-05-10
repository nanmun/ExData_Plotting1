plot4 <- function() {

  # Read the file
  data <- read.table("household_power_consumption.txt", header=TRUE, sep =";", na.strings = "?")
  
  # Get the data for dates 1st and 2nd Feb 2007
  mydata <- data[(as.Date(data$Date, format="%d/%m/%Y")=="2007-02-01") | (as.Date(data$Date, format="%d/%m/%Y")=="2007-02-02"),]
  
  # Convert date and time into POSIX
  newtime <- strptime(paste(as.character(mydata$Date, format="%d/%m/%Y"), as.character(mydata$Time, format="%H:%M:%S")), format="%d/%m/%Y %H:%M:%S")
  
  
  # Open the PNG device 
  png(filename="plot4.png", width=480, height=480)
  
  
  # Set 2 X 2 plots on the device, with columns filling first.
  par(mfcol = c(2, 2))
  
  # Plot the first chart
  plot(newtime, mydata$Global_active_power, type="l", ylab="Global Active Power", xlab="")
  
  # Plot the second chart
  plot(newtime, mydata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  points(newtime, mydata$Sub_metering_2, type="l", col="red")
  points(newtime, mydata$Sub_metering_3, type="l", col="blue")
  # Add legends to second chart
  legend("topright",  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red", "blue"), bty = "n")
  
  # Plot the third chart
  plot(newtime, mydata$Voltage, type="l", ylab="Voltage", xlab="datetime")
  
  # Plot the fourth chart
  plot(newtime, mydata$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
  
  
  
  # Close the file device
  dev.off()
  
}
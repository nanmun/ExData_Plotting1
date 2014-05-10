plot3 <- function() {
  
  # Read the file
  data <- read.table("household_power_consumption.txt", header=TRUE, sep =";", na.strings = "?")
  
  # Get the data for dates 1st and 2nd Feb 2007
  mydata <- data[(as.Date(data$Date, format="%d/%m/%Y")=="2007-02-01") | (as.Date(data$Date, format="%d/%m/%Y")=="2007-02-02"),]
  
  # Convert date and time into POSIX
  newtime <- strptime(paste(as.character(mydata$Date, format="%d/%m/%Y"), as.character(mydata$Time, format="%H:%M:%S")), format="%d/%m/%Y %H:%M:%S")
  
  # Open the PNG device 
  png(filename="plot3.png", width=480, height=480)
  
  # Plot the first submeter chart
  plot(newtime, mydata$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
  
  # Add other 2 charts
  points(newtime, mydata$Sub_metering_2, type="l", col="red")
  points(newtime, mydata$Sub_metering_3, type="l", col="blue")
  
  # Add legends
  legend("topright",  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red", "blue"))
  
  # Close the file device
  dev.off()

}
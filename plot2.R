plot2 <- function() {
  
  # Read the file
  data <- read.table("household_power_consumption.txt", header=TRUE, sep =";", na.strings = "?")
  
  # Get the data for dates 1st and 2nd Feb 2007
  mydata <- data[(as.Date(data$Date, format="%d/%m/%Y")=="2007-02-01") | (as.Date(data$Date, format="%d/%m/%Y")=="2007-02-02"),]
  
  # Convert date and time into POSIX
  newtime <- strptime(paste(as.character(mydata$Date, format="%d/%m/%Y"), as.character(mydata$Time, format="%H:%M:%S")), format="%d/%m/%Y %H:%M:%S")
  
  # Open the PNG device 
  png(filename="plot2.png", width=480, height=480)  
  
  # Plot the chart
  plot(newtime, mydata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  # Close the file device
  dev.off()

}
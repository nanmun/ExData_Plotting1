plot1 <- function() {
  
  # Read the file
  data <- read.table("household_power_consumption.txt", header=TRUE, sep =";", na.strings = "?")
  
  # Get the data for dates 1st and 2nd Feb 2007
  mydata <- data[(as.Date(data$Date, format="%d/%m/%Y")=="2007-02-01") | (as.Date(data$Date, format="%d/%m/%Y")=="2007-02-02"),]
  
  # Open the PNG device 
  png(filename="plot1.png", width=480, height=480)
  
  # Plot the histogram
  hist(mydata$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
  
  # Close the file device
  dev.off()

}
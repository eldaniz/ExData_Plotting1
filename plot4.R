# data read function in another file
source("readData.R")

drawplot4 <- function() {
  png(filename = "plot4.png", width = 480, height = 480)
  par( mfrow = c(2, 2))
  
  plot(
    x = elpower$Time,
    y = elpower$Global_active_power, 
    xlab = "",
    ylab = "Global Active Power",
    type = "l")
  
  plot(
    x = elpower$Time,
    y = elpower$Voltage, 
    xlab = "datetime",
    ylab = "Voltage",
    type = "l")
  
  plot(
    x = elpower$Time,
    y = elpower$Sub_metering_1, 
    xlab = "",
    ylab = "Enegry sub metering",
    type = "n"
  )
  
  points(x = elpower$Time, y = elpower$Sub_metering_1, type = "l")
  points(x = elpower$Time, y = elpower$Sub_metering_2, type = "l", col="red")
  points(x = elpower$Time, y = elpower$Sub_metering_3, type = "l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lwd = 2, col=c("black", "red", "blue"), bty = "n")
  
  plot(
    x = elpower$Time,
    y = elpower$Global_reactive_power, 
    xlab = "datetime",
    ylab = "Global_reactive_power",
    type = "l")
  
  dev.off()
}

# date bounds
d1 = as.Date("01/02/2007", format="%d/%m/%Y")
d2 = as.Date("02/02/2007", format="%d/%m/%Y")
#elpower <- readData("household_power_consumption.txt", d1, d2)

# !!! set English language (for non-english countries)
Sys.setlocale("LC_TIME", "C")

drawplot4()
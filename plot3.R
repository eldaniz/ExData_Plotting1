# data read function in another file
source("readData.R")

drawplot3 <- function() {
  png(filename = "plot3.png", width = 480, height = 480)
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
         lwd = 2, col=c("black", "red", "blue"))
  
  #dev.copy(png, file = "plot3.png", width = 480, height = 480)
  dev.off()
}

# date bounds
d1 = as.Date("01/02/2007", format="%d/%m/%Y")
d2 = as.Date("02/02/2007", format="%d/%m/%Y")
elpower <- readData("household_power_consumption.txt", d1, d2)

# !!! set English language (for non-english countries)
Sys.setlocale("LC_TIME", "C")

drawplot3()
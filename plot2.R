# data read function in another file
source("readData.R")

drawplot2 <- function() {
  png(filename = "plot2.png", width = 480, height = 480)
  plot(
    x = elpower$Time,
    y = elpower$Global_active_power, 
    xlab = "",
    ylab = "Global Active Power (kilowatts)",
    type = "l")
  #dev.copy(png, file = "plot2.png", width = 480, height = 480)
  dev.off()
}

# date bounds
d1 = as.Date("01/02/2007", format="%d/%m/%Y")
d2 = as.Date("02/02/2007", format="%d/%m/%Y")
elpower <- readData("household_power_consumption.txt", d1, d2)

# !!! set English language (for non-english countries)
Sys.setlocale("LC_TIME", "C")

drawplot2()
# data read function in another file
source("readData.R")

drawplot1 <- function() {
  png(filename = "plot1.png", width = 480, height = 480)
  
  hist(elpower$Global_active_power, 
       xlab = "Global Active Power (kilowatts)", 
       main = "Global Active Power",
       col = "red")
  
  dev.off()
}

# date bounds
d1 = as.Date("01/02/2007", format="%d/%m/%Y")
d2 = as.Date("02/02/2007", format="%d/%m/%Y")
elpower <- readData("household_power_consumption.txt", d1, d2)

# !!! set English language (for non-english countries)
Sys.setlocale("LC_TIME", "C")

drawplot1()
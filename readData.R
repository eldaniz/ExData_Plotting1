readData <- function(filename, d1, d2) 
{
  read_lines = 200000
  read_pos = 0

  tb <- data.frame()
  
  # columns classes
  columnsCls1=c("character",  "character", rep("character", 7))
  columnsCls2=c("Date",  "POSIXct", rep("numeric", 7))

  # read header
  next_lines = scan(filename, 
                    what=list(""),
                    skip = read_pos, nlines = read_lines, sep = "\n")
  # parse header
  elpower <- read.table(sep = ";", 
                   colClasses = columnsCls2,
                   header = TRUE, text = next_lines[[1]][1])

  total = 1
  # partial parse
  nReadLines = length(next_lines[[1]])
  while(nReadLines > 0)
  {
    for (i in c(2:nReadLines)) {
      t <- read.table(sep=";", 
                    colClasses=columnsCls1, 
                    header = FALSE, text = next_lines[[1]][i], stringsAsFactors = FALSE)
    
      d = as.Date(t[1,1], format="%d/%m/%Y")
      if (d > d2)
        return (elpower)

      if (d >= d1)
      {
        # time
        elpower[total, 2] <- as.POSIXct(paste(t[1, 1], t[1, 2]), format="%d/%m/%Y %H:%M:%S")
        
        for (j in 3:9) 
          elpower[total,j] <- as.numeric(t[1,j])
        
        #tb[total,] <- t
        elpower[total,1] <- d
        total = total + 1;
      }
    }
    
    read_pos = read_pos + nReadLines
    
    # read next portion
    next_lines = scan(filename, 
                      what=list(""),
                      skip = read_pos, nlines = read_lines, sep = "\n")
    nReadLines = length(next_lines[[1]])
  }
  return (elpower)
}
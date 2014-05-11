# Explanotory Data Analisys 2014
# Course Project 1
#

# loading data

# determining column's classes
temp <- read.table('household_power_consumption.txt', header = TRUE, nrows = 5, sep = ';')
classes <- sapply(temp, class)

# reading dataset
data <- read.table(
  'household_power_consumption.txt',
  header = TRUE, 
  colClasses = classes,
  sep = ';',
  na.strings = '?'
)

# datetime column
dt <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
data <- cbind(data, dt)

#converting
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y")

# subseting
#df <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
df <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")




# set locale
Sys.setlocale(category = "LC_TIME", locale = "US")


# transperat background
par(bg=NA)

# 2*2
par(mfrow = c(2, 2))

with(df,{
    # 1,1
    plot(
      x=df$dt,
      y=df$Global_active_power,
      type = "l",
      ylab ="Global Active Power (kilowatts)",
      xlab = "",
      main = ""
    )
    # 1,2
    plot(
      x=df$dt,
      y=df$Voltage,
      type = "l",
      ylab ="Voltage",
      xlab = "datetime",
      main = ""
    )
    
    # 2,1
    plot( df$dt, df$Sub_metering_1,  type = "l", ylab = "Energy sub metering",xlab = " ")
    lines(df$dt, df$Sub_metering_2, col = "red")
    lines(df$dt, df$Sub_metering_3, col = "blue")
    
    legend(
      'topright',
      pch = "_", 
      col = c("black", "red","blue"),
      legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    )
    
    
    # 2,2
    plot(
      x=df$dt,
      y=df$Global_reactive_power,
      type = "l",
      ylab ="Global_reactive_power",
      xlab = "datetime",
      main = ""
    )
    
  }
)


dev.copy(png, file = "plot4.png", width = 480, height = 480) # Copy  plot to a PNG 
dev.off() # close the PNG device

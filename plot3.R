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

#with(df, plot(
#  df$dt, 
#  df$Sub_metering_1,
#  type = "l",
#  ylab = "Energy sub metering",
#  xlab = " "
#  )
#)

#with(df, lines(df$dt, df$Sub_metering_1, col = "black"))
#with(df, lines(df$dt, df$Sub_metering_2, col = "red"))
#with(df, lines(df$dt, df$Sub_metering_3, col = "blue"))

plot( df$dt, df$Sub_metering_1,  type = "l", ylab = "Energy sub metering",xlab = " ")
lines(df$dt, df$Sub_metering_2, col = "red")
lines(df$dt, df$Sub_metering_3, col = "blue")

legend(
  'topright',
  pch = "_", 
  col = c("black", "red","blue"),
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)


dev.copy(png, file = "plot3.png", width = 480, height = 480) # Copy  plot to a PNG 
dev.off() # close the PNG device


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

#?
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# subseting
#df <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
df <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")


# converting
dt <- strptime(paste(df$Date, df$Time), format='%d/%m/%Y %H:%M:%S')
df <- cbind(df, dt)

# set locale
Sys.setlocale(category = "LC_TIME", locale = "US")


# transperat background
par(bg=NA)

hist(
  df$Global_active_power, 
  xlab = 'Global Active Power (kilowatts)',
  main = 'Global Active Power',
  col = c("red")
)

#bg = "transparent"

dev.copy(png, file = "plot1.png", width = 480, height = 480) # Copy  plot to a PNG 
dev.off() # close the PNG device!
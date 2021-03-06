# Explanotory Data Analisys 2014
# Course Project 1
#

# get dataset
if(!file.exists("household_power_consumption.txt")) {
  temp <- tempfile()
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, temp, method="curl")
  unzip(temp)
  unlink(temp)
}

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

plot(
  x=df$dt,
  y=df$Global_active_power,
  type = "l",
  ylab ="Global Active Power (kilowatts)",
  xlab = "",
  main = ""
)


dev.copy(png, file = "plot2.png", width = 480, height = 480) # Copy  plot to a PNG 
dev.off() # close the PNG device!
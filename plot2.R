##Use the "sqldf" library

require(sqldf)

##Read the data restricting it to days 1&2 of Feb 2007; remember to
##have the data set in your working directory

dat <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file
	WHERE Date IN('1/2/2007','2/2/2007')", sep = ";", header = TRUE)

## Converting dates to useful date format

dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(dat$Date), dat$Time)
dat$datetime <- as.POSIXct(datetime)

##Construct the plot

plot(dat$Global_active_power~dat$datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

##Write the plot to a .png file

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
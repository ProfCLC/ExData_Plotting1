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

with(dat, {
    plot(Sub_metering_1~datetime, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~datetime,col='Red')
    lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), adj = .1)

##Write the plot to a .png file

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
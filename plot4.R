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

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dat, {
    plot(Global_active_power~datetime, type="l", 
         ylab="Global Active Power", xlab="")
    plot(Voltage~datetime, type="l", 
         ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~datetime, type="l", 
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~datetime,col='Red')
    lines(Sub_metering_3~datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), adj = .1)
    plot(Global_reactive_power~datetime, type="l", 
         ylab="Global_reactive_power",xlab="datetime")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
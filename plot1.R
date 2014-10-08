##Use the "sqldf" library

require(sqldf)

##Read the data restricting it to days 1&2 of Feb 2007; remember to
##have the data set in your working directory

dat <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file
	WHERE Date IN('1/2/2007','2/2/2007')", sep = ";", header = TRUE)

##Construct the histogram

hist(dat$Global_active_power, breaks = 11, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##Write the histogram to a .png file

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
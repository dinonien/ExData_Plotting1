###########################################################
## Coursera : Exploratory Data Analysis
## Course Project 1
## Author: Dino N.
## Filename. plot3.R
###########################################################

# This code loads dataset "Electric Power Consumption" available from UC Irvine Machine Learning Repository 
# and plots Sub_metering chart for 2 days.
# Please make sure file household_power_consumption.txt is in your workspace.

# Load file household_power_consumption.txt
power <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE  , header = TRUE, sep=";")

# Transform Date Column to Date Format
power <- transform(power,Date = as.Date(Date,"%d/%m/%Y"))
# Subset to the dates 2007-02-01 and 2007-02-02
power <- (subset(power,Date >= "2007-02-01" & Date < "2007-02-03"))

# Create new Column for plotting graphs easier
power$DateTime <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")

#Open PNG file
png(file = "./ExData_Plotting1/plot3.png", width = 480, height = 480, units="px")

# Draw line diagram according to assignment requirements
with(power, {
        plot(DateTime,Sub_metering_1 ,type="n", ylab = "Energy sub metering", xlab = "")
        lines(DateTime,Sub_metering_1 )
        lines(DateTime,Sub_metering_2, col = "red" )
        lines(DateTime,Sub_metering_3, col = "blue" )
        legend("topright", pch = "", lwd = 1,    col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
    })

#Close PNG file
dev.off()



###########################################################
## Coursera : Exploratory Data Analysis
## Course Project 1
## Author: Dino N.
## Filename. plot4.R
###########################################################

# This code loads dataset "Electric Power Consumption" available from UC Irvine Machine Learning Repository 
# and plots 4 graphs into a 2*2 grid structure
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
png(file = "./ExData_Plotting1/plot4.png", width = 480, height = 480, units="px")

# Draw  diagram according to assignment requirements , in 2*2 Grid Structure
par(mfrow = c(2,2))
with(power, {
    #Line Graph Global Active Power
    plot(DateTime,Global_active_power,type="n", ylab = "Global Active Power", xlab = "")
    lines(DateTime,Global_active_power)
    
    #Line Graph Voltage
    plot(DateTime,Voltage,type="n", ylab = "Voltage", xlab = "datetime")
    lines(DateTime,Voltage)
    
    #Line Graph Energy Sub Metering
    plot(DateTime,Sub_metering_1 ,type="n", ylab = "Energy sub metering", xlab = "")
    lines(DateTime,Sub_metering_1 )
    lines(DateTime,Sub_metering_2, col = "red" )
    lines(DateTime,Sub_metering_3, col = "blue" )
    legend("topright", pch = "", lwd = 1,    col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
    
    #Line Graph Global Reactive Power
    plot(DateTime,Global_reactive_power,type="n", ylab = "Global_reactive_power", xlab = "datetime")
    lines(DateTime,Global_reactive_power)   
})


#Close PNG file
dev.off()
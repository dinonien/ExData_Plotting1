###########################################################
## Coursera : Exploratory Data Analysis
## Course Project 1
## Author: Dino N.
## Filename. Plot1.R
###########################################################

# This code loads dataset "Electric Power Consumption" available from UC Irvine Machine Learning Repository 
# and plots Histogramm Global Active Power.
# Please make sure file household_power_consumption.txt is in your workspace.

# Load file household_power_consumption.txt
power <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE  , header = TRUE, sep=";")

# Transform Date Column to Date Format
power <- transform(power,Date = as.Date(Date,"%d/%m/%Y"))
# Subset to the dates 2007-02-01 and 2007-02-03
power <- (subset(power,Date >= "2007-02-01" & Date < "2007-02-03"))

# Create new Column for plotting graphs easier
power$DateTime <- as.POSIXct(paste(power$Date, power$time), format="%Y-%m-%d %H:%M:%S")

#Open PNG file
png(file = "./ExData_Plotting1/plot1.png", width = 480, height = 480, units="px")

# Draw histogramm according to assignment requirements
hist(as.numeric(power$Global_active_power),main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

#Close PNG file
dev.off()

#with(power,plot(DateTime,Global_active_power,type="n"))
#with(power,lines(DateTime,Global_active_power))
#with(power,lines(DateTime,Sub_metering_1))

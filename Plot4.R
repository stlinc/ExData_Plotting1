#Load data
householdPowerData <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

#Subset of records on 1/2/2007 and 2/2/2007
householdPowerDataSubset <- householdPowerData[grepl("^(1/2/2007|2/2/2007)", householdPowerData$Date), ]

#Base plot
library(datasets)
## Create plot on screen device
par(mfrow = c(2,2), mar = c(5,4,2,1))
globalActivePower <- as.numeric(householdPowerDataSubset$Global_active_power)
dateTime <- strptime(paste(householdPowerDataSubset$Date, householdPowerDataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#Plot 1st chart
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
#Plot 2nd chart
voltage <- as.numeric(householdPowerDataSubset$Voltage)
plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")
#Plot 3rd chart
subMeter1 <- as.numeric(householdPowerDataSubset$Sub_metering_1)
subMeter2 <- as.numeric(householdPowerDataSubset$Sub_metering_2)
subMeter3 <- as.numeric(householdPowerDataSubset$Sub_metering_3)
plot(dateTime, subMeter1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
legend("topright", lty = 1, lwd=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Plot 4th chart
globalReactivePower <- as.numeric(householdPowerDataSubset$Global_reactive_power)
plot(dateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
## Copy plot (plot on current device) to a PNG file
dev.copy(png, file = "Plot1.png", width = 480, height = 480)
## Don't forget to close the PNG device!
dev.off()

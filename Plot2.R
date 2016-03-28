#Load data
householdPowerData <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

#Subset of records on 1/2/2007 and 2/2/2007
householdPowerDataSubset <- householdPowerData[grepl("^(1/2/2007|2/2/2007)", householdPowerData$Date), ]

#Base plot
library(datasets)
## Create plot on screen device
globalActivePower <- as.numeric(householdPowerDataSubset$Global_active_power)
dateTime <- strptime(paste(householdPowerDataSubset$Date, householdPowerDataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
## Copy plot (plot on current device) to a PNG file
dev.copy(png, file = "Plot1.png", width = 480, height = 480)
## Don't forget to close the PNG device!
dev.off()

#Load data
householdPowerData <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

#Subset of records on 1/2/2007 and 2/2/2007
householdPowerDataSubset <- householdPowerData[grepl("^(1/2/2007|2/2/2007)", householdPowerData$Date), ]

#Base plot
library(datasets)
## Create plot on screen device
householdPowerDataSubset$Global_active_power <- as.numeric(householdPowerDataSubset$Global_active_power)
globalActivePower <- as.numeric(householdPowerDataSubset$Global_active_power)
hist(globalActivePower, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
## Copy plot (plot on current device) to a PNG file
dev.copy(png, file = "Plot1.png")
## Don't forget to close the PNG device!
dev.off()
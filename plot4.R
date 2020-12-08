#Data has been investigated beforehand to determine, which required rows to read in.

#Read column labels
collabels <- read.table("./household_power_consumption.txt", nrows = 1, sep = ";", stringsAsFactors = FALSE)

#Read in rows for February 1st 2007 and February 2nd 2007. Assign column labels
plotdata <- read.table("./household_power_consumption.txt", na.strings = "?", skip = 66637, header = FALSE, nrows = 2880, sep = ";", col.names = collabels,
                       stringsAsFactors = FALSE)

#Convert Date into Date class
plotdata$Date <- as.Date(plotdata$Date, format = "%d/%m/%Y")

#Convert Time into Date/Time class
plotdata$Time <- strptime(paste(plotdata$Date, plotdata$Time), format = "%Y-%m-%d %H:%M:%S")

#Open empty png device with width and height as specified in the assignment, call it plot4.png. 
png("plot4.png", width = 480, height = 480)

#Create four separate line graph plots, showing in the same viewport, as shown in the example for Plot 4
par(mfrow = c(2,2))
with(plotdata, {
  plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(Time,Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
    lines(Time, Sub_metering_1, col = "black")
    lines(Time, Sub_metering_2, col = "red")
    lines(Time, Sub_metering_3, col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
  plot(Time, Global_reactive_power, type = "l", xlab = "datetime")
})

#Save the created plot and close the file
dev.off()
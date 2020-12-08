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

#Open empty png device with width and height as specified in the assignment, call it plot2.png. 
png("plot2.png", width = 480, height = 480)

#Create a line graph between variable Global_active_power and Time, as shown in the example for Plot 2
plot(plotdata$Time,plotdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Save the created plot and close the file
dev.off()
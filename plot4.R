# Create the fourth plot for the course project

# Read the data file - pipe it through grep to get just the rows we want
# - we also need to get the first line for the headers.
# keep Date and Time as strings so we can convert them afterwards.
datafile  <- pipe("egrep '^Date|^[12]/2/2007' ./household_power_consumption.txt")
data = read.csv2(datafile, na.strings="?", dec=".", as.is=c("Date", "Time"))

# convert the date and time column into a single Date-time value
datetime  <- strptime(paste(data$Date, data2$Time, sep=" "),
                      format="%d/%m/%Y %H:%M:%S")
# create the plots
png("plot4.png", width=480, height=480)
par(mfrow=c(2, 2))
with(data, {
    plot(datetime, Global_active_power,
         xlab="", ylab="Global Active Power (kilowatts)", type="l")

    plot(datetime, Voltage, type="l")

    plot(datetime, data$Sub_metering_1,
         xlab="", ylab="Energy sub metering", type="l")
    lines(datetime, data$Sub_metering_2, col="red")
    lines(datetime, data$Sub_metering_3, col="blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col=c("black", "red", "blue"), lwd=1)

    plot(datetime, Global_reactive_power, type="l")

})

dev.off()
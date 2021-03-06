# Create the second plot for the course project

# Read the data file - pipe it through grep to get just the rows we want
# - we also need to get the first line for the headers.
# keep Date and Time as strings so we can convert them afterwards.
datafile  <- pipe("egrep '^Date|^[12]/2/2007' ./household_power_consumption.txt")
data = read.csv2(datafile, na.strings="?", dec=".", as.is=c("Date", "Time"))

# convert the date and time column into a single Date-time value
datetime  <- strptime(paste(data$Date, data2$Time, sep=" "),
                      format="%d/%m/%Y %H:%M:%S")

# create the plot
png("plot2.png", width=480, height=480)
plot(datetime, data$Global_active_power,
     xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()
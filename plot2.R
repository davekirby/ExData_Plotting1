# Create the second plot for the course project

# read the data file
datafile  <- "./household_power_consumption.txt"
data = read.csv2(datafile, na.strings="?", dec=".")

# strip NA entries
data2 <- data[!is.na(data$Global_active_power),]

# Convert Date column to date objects
data2$Date <- as.Date(data2$Date, "%d/%m/%Y")

# extract a subset for the dates we are interested in
data3 <- data2[data2$Date >= as.Date("2007-02-01")
               & data2$Date <= as.Date("2007-02-02"),]

# convert the date and time column into a single Date-time value
datetime  <- strptime(paste(data3$Date, data3$Time, sep=" "),
                      format="%Y-%m-%d %h:%m:%s")

# create the plot
#png("plot1.png", width=480, height=480)
plot(datetime, data3$Global_active_power,
     xlab="", ylab="Global Active Power (kilowatts)")
#TODO:  set the weekdays on the X axis#
dev.off()
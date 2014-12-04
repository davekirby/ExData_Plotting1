# Create the first plot for the course project

# Read the data file - pipe it through grep to get just the rows we want
# - we also need to get the first line for the headers.
datafile  <- pipe("egrep '^Date|^[12]/2/2007' ./household_power_consumption.txt")
data = read.csv2(datafile, na.strings="?", dec=".")

# create the plot
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
# Done.  Go to bed
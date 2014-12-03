# Create the first plot for the course project

# read the data file
datafile  <- "./household_power_consumption.txt"
data = read.csv2(datafile, na.strings="?", dec=".")

# strip NA entries
data2 <- data2[!is.na(data2$Global_active_power),]

# Convert Date column to date objects
data2$Date <- as.Date(data2$Date, "%d/%m/%Y")

# extract a subset for the dates we are interested in
data3 <- data2[data2$Date >= as.Date("2007-02-01") & data2$Date <= as.Date("2007-02-02"),]

# create the plot
png("plot1.png", width=480, height=480)
hist(data3$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
# Done.  Go to bed
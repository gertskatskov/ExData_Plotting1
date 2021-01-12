# reading .txt file from Working Directory:

data <- read.csv(".//household_power_consumption.txt", sep = ";")

# subsetting given dates from data table

data <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")

# converting characters to Date and POSIXlt format:

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time,format="%H:%M:%S")

# adding dates to Time column

data[1:1440, "Time"] <- format(data[1:1440, "Time"], "2007-02-01 %H:%M:%S")
data[1441:2880, "Time"] <- format(data[1441:2880, "Time"],"2007-02-02 %H:%M:%S")

# creating the plot

plot(data$Time, data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

# creating and saving the .png file:

dev.copy(png, "plot2.png", width=480, height=480)
dev.off()




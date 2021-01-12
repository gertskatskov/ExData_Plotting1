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

plot(data$Time, data$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering",)
with(data, lines(Time, data$Sub_metering_1))
with(data, lines(Time, data$Sub_metering_2, col="red"))
with(data, lines(Time, data$Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Defining the frequency of Y axis:
axis(2, seq(0,35,5))

# Annotating the graph

title(main="Energy sub-metering")

# Exporting to .png

dev.copy(png, "plot3.png")
dev.off()


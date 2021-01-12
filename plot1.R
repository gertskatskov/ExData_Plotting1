# calculate how much memory is needed: 8bytes/cell*9columns*2075259 = 149.418648Mb

# reading .txt file from Working Directory:

data <- read.csv(".//household_power_consumption.txt", sep = ";")

# subsetting given dates from data table

data <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")

# creating the plot:

hist(as.numeric(as.character(data$Global_active_power)), main= "Global Active power", col="red", xlab ="Global Active Power(kilowatts)")

# creating the png file:

dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
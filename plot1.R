### Read data and plot a histogram

data <- read.table("household_power_consumption.txt", sep=";",header=TRUE)
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01") & 
                 as.Date(DateTime) <= as.Date("2007-02-02"))
data$Global_active_power = as.numeric(as.character(data$Global_active_power))
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kW)", col = "Red")
dev.off()
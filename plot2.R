### Read data and plot

data <- read.table("household_power_consumption.txt", sep=";",header=TRUE)
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01") & 
                 as.Date(DateTime) <= as.Date("2007-02-02"))
data$Global_active_power = as.numeric(as.character(data$Global_active_power))
png("plot2.png", height=480, width=480)
plot(data$DateTime, data$Global_active_power, pch=NA, xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)
dev.off()
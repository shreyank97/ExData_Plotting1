library(dplyr)
read <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- read[read$Date %in% c("1/2/2007", "2/2/2007"),]
rm(read)
data <- data %>% mutate(Date = as.Date(Date, "%d/%m/%Y"))
TD <- paste(data$Date, data$Time)
data$Time <- strptime(TD, "%Y-%m-%d %H:%M:%S")
png(filename = "plot4.png")
par(mfrow = c(2,2))
with(data, plot(Time, Global_active_power, ylab = "Global Active Power", type = "l"))
with(data, plot(Time, Voltage, ylab = "Voltage", type = "l", xlab = "DateTime"))
with(data, plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering", col = "red"))
lines(data$Time, data$Sub_metering_2, col = "blue")
lines(data$Time, data$Sub_metering_3, col = "green")
legend("topright", legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), fill = c("red", "blue", "green"))
with(data, plot(Time, Global_reactive_power, ylab = "Global Active Power", type = "l", xlab = "DateTime"))
dev.off()
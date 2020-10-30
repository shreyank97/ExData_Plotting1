read <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data <- read[read$Date %in% c("1/2/2007", "2/2/2007"),]
png(filename = "plot1.png")
hist(as.numeric(data$Global_active_power), breaks = 12, main = "Global Active Power", xlab = "Global Active Power(killowatts)")
dev.off()
library(lubridate)
library(datasets)

#read and subset data
data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?")
data2 <- subset(data, Date == "1/2/2007" | data$Date == "2/2/2007")
#data2 <- data[(strftime(as.POSIXct(as.Date(dmy(data$Date))), format="%Y-%m-%d") == d1 | strftime(as.POSIXct(as.Date(dmy(data$Date))), format="%Y-%m-%d") == d2),]
#data2 <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

#set variables
d1 <- ymd("2007-02-01")
d2 <- d1 + 1
d3 <- d2 + 1
maxY = max(as.numeric(data2$Sub_metering_1), as.numeric(data2$Sub_metering_2), as.numeric(data2$Sub_metering_3))

#plot to png
png("plot3.png", width=480, height=480)
par(bg = "white")

#plot 3
par(mfrow = c(1,1), mar = c(5.1,4.1,4.1,2.1))
plot(as.numeric(data2$Date), type = "n", ylim = c(0, maxY), xaxt = "n", xlab = "", ylab = "Energy sub metering")
lines(as.numeric(data2$Sub_metering_1), col = "black")
lines(as.numeric(data2$Sub_metering_2), col = "red")
lines(as.numeric(data2$Sub_metering_3), col = "blue")
axis(side = 1, at = c(1,nrow(data2)/2,nrow(data2)), labels = c(as.character(wday(d1, label = TRUE)), as.character(wday(d2, label = TRUE)), as.character(wday(d2+1, label = TRUE))))
legend("topright", lty = 1, col = c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()

#plot to screen
par(mfrow = c(1,1), mar = c(5.1,4.1,4.1,2.1))
plot(as.numeric(data2$Date), type = "n", ylim = c(0, maxY), xaxt = "n", xlab = "", ylab = "Energy sub metering")
lines(as.numeric(data2$Sub_metering_1), col = "black")
lines(as.numeric(data2$Sub_metering_2), col = "red")
lines(as.numeric(data2$Sub_metering_3), col = "blue")
axis(side = 1, at = c(1,nrow(data2)/2,nrow(data2)), labels = c(as.character(wday(d1, label = TRUE)), as.character(wday(d2, label = TRUE)), as.character(wday(d2+1, label = TRUE))))
legend("topright", lty = 1, col = c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))



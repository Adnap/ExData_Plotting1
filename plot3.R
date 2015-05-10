source("prepare_data.R")

plotData <- getPlotData("2007-02-01", "2007-02-02")

png(file="plot3.png", width = 480, height = 480)

plot(plotData$DateTime, plotData$Sub_metering_1,
     ylab = "Energy sub metering",
     xlab = "",
     type="l")

lines(plotData$DateTime, plotData$Sub_metering_2, col="red")
lines(plotData$DateTime, plotData$Sub_metering_3, col="blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty=1)

dev.off()
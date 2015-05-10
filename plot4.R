source("prepare_data.R")

createGlobalActivePowerPlot <- function(plotInfo) {
  plot(plotInfo$DateTime, plotInfo$Global_active_power,
       ylab = "Global Active Power (kilowatts)",
       xlab = "",
       type="l")
}

createVoltagePlot <- function(plotInfo) {
  plot(plotInfo$DateTime, plotInfo$Voltage,
       ylab = "Voltage",
       xlab = "datetime",
       type="l")
}

createGlovalREactivePowerPlot <- function(plotInfo) {
  plot(plotInfo$DateTime, plotInfo$Global_reactive_power,
       ylab = "Global_reactive_power",
       xlab = "datetime",
       type="l")
}

createEnergySubMeteringPlot <- function(plotInfo) {
  plot(plotInfo$DateTime, plotInfo$Sub_metering_1,
       ylab = "Energy sub metering",
       xlab = "",
       type="l")
  
  lines(plotInfo$DateTime, plotInfo$Sub_metering_2, col="red")
  lines(plotInfo$DateTime, plotInfo$Sub_metering_3, col="blue")
  
  legend("topright",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("black", "red", "blue"),
         bty="n", lty=1)
}


plotData <- getPlotData("2007-02-01", "2007-02-02")

png(file="plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

createGlobalActivePowerPlot(plotData)
createVoltagePlot(plotData)
createEnergySubMeteringPlot(plotData)
createGlovalREactivePowerPlot(plotData)

dev.off()
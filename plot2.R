source("prepare_data.R")

plotData <- getPlotData("2007-02-01", "2007-02-02")

png(file="plot2.png", width = 480, height = 480)

plot(plotData$DateTime, plotData$Global_active_power,
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type="l")

dev.off()
source("prepare_data.R")

plotData <- getPlotData("2007-02-01", "2007-02-02")

png(file="plot1.png", width = 480, height = 480)

hist(plotData$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

dev.off()
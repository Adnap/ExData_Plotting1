dataFolder <- "plotsData"
downloadFile <- paste(dataFolder, "household_power_consumption.zip", sep="/")
unzipDataFile <- paste(dataFolder, "household_power_consumption.txt", sep="/")
dataUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip?accessType=DOWNLOAD"

ensureDataFileExistence <- function() {
  if (!file.exists(dataFolder)) {
      dir.create(dataFolder)  
  }
  if (file.exists(unzipDataFile)) {
      return
  }
  if (!file.exists(downloadFile)) {
      download.file(dataUrl, destfile=downloadFile, method="auto", mode="wb")    
  }
  unzip(downloadFile, exdir=dataFolder)
}

getPlotData <- function(fromDate, toDate) {
  ensureDataFileExistence()
  
  data <- fread(unzipDataFile, na.strings="?", colClasses=c("character"))
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  
  plotData <- subset(data, Date >= fromDate & Date <= toDate)
  plotData$DateTime <- as.POSIXct(strptime(paste(plotData$Date, plotData$Time), format = "%Y-%m-%d %H:%M:%S"))
  plotData$Global_active_power <- as.numeric(plotData$Global_active_power)
  
  plotData
}

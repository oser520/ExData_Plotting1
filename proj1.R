# file:   proj1.R
# author: Omar Serrano
# date:   2015-07-08
#
# The purpose of the functions below are to create plots for exploring a set of
# data about household power consumption. The functions with name something
# work are responsible for drawing the plots, and that's what you want to use
# if you are exploring the plots interactively. If you want to create PNG files
# out of the plots, which is the purpose of the assignment, then you can call
# the plot1, plot2, or other plot functions that don't contain the word work
# embedded in them.
#
# The instructions are for each function to be defined in a separate file;
# however, a file for each of these functions is not only overkill, but also
# poor design, because all of these functions are related, and hece it makes
# more sense to define them in the same file.
# 
# If you want to see the images created by these functions without running R,
# then see 'Reconstructing plots' in the README.

readProj1Data <- function(fileName='household_power_consumption.txt') {
  # Reads the data for household power consumption and returns a data frame.
  # Args:
  #   fileName: the CSV file with the data
  # Returns:
  #   A data frame with only data for February 1st and 2nd
  colclass=c('character', 'character', rep('numeric', 7))
  df <- read.table(fileName, header=T, sep=';', na.strings='?',
                   colClasses=colclass, strip.white=T)
  df[grep('^0?(1|2)/0?2/2007$', df[,1], perl=T),]
}

plot1work <- function(data) {
  # Constructs a histogram of global active power.
  # Args:
  #   data: a data frame with a vector for global active power
  hist(data$Global_active_power, col='red', main='Global Active Power',
       xlab='Global active power (kilowatts)')
}

plot1 <- function(data, plotName='plot1.png') {
  # A wrapper for plot1work, creates a PNG file of histogram.
  # Args:
  #   data: a data frame
  #   plotName: the name of the PNG file
  png(plotName)
  plot1work(data)
  dev.off()
}

plot2work <- function(data) {
  # Constructs a plot of global active power over a two day period
  # Args:
  #   data: a data frame
  plot(data$Global_active_power, type='l', xlab='', xaxt='n',
       ylab='Global active power (kilowatts)')
  nPoints <- nrow(data)
  axis(1, at=c(0, nPoints/2, nPoints+1), labels=c('Thu', 'Fri', 'Sat'))
}

plot2 <- function(data, plotName='plot2.png') {
  # A wrapper for plot2work, creates PNG file.
  # Args:
  #   data: a data frame
  #   plotName: the name of the PNG file
  png(plotName)
  plot2work(data)
  dev.off()
}

plot3work <- function(data) {
  # Constructs of plot of energy submetering with a legend.
  # Args:
  #   data: a data frame
  plot(data$Sub_metering_1, type='l', xlab='', xaxt='n',
       ylab='Energy sub metering')
  lines(data$Sub_metering_2, col='red')
  lines(data$Sub_metering_3, col='blue')
  nPoints <- nrow(data)
  axis(1, at=c(0, nPoints/2, nPoints+1), labels=c('Thu', 'Fri', 'Sat'))
  legendText <- c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
  legend('topright', legend=legendText, col=c('black', 'red', 'blue'), lty=1,
         bty='n')
}

plot3 <- function(data, plotName='plot3.png') {
  # A wrapper for plot3work, creates PNG file.
  # Args:
  #   data: a data frame
  #   plotName: the name of the PNG file
  png(plotName)
  plot3work(data)
  dev.off()
}

plot4work <- function(data) {
  # Creates 4 mini-plots.
  # Args:
  #   data: a data frame
  par(mfcol=c(2,2))
  plot2work(data)
  plot3work(data)
  plot(data$Voltage, type='l', xlab='', xaxt='n', ylab='Voltage')
  nPoints <- nrow(data)
  axis(1, at=c(0, nPoints/2, nPoints+1), labels=c('Thu', 'Fri', 'Sat'))
  plot(data$Global_reactive_power, type='l', xlab='', xaxt='n',
       ylab='Global reactive power') # position (2,2)
  axis(1, at=c(0, nPoints/2, nPoints+1), labels=c('Thu', 'Fri', 'Sat'))
}

plot4 <- function(data, plotName='plot4.png') {
  # Wrapper for plot4work, creats a PNG file.
  # Args:
  #   data: a data frame
  #   plotName: the name of the PNG file
  png(plotName)
  plot4work(data)
  dev.off()
}

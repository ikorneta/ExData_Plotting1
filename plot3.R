download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile='./exdata_data_household_power_consumption.zip')
system('unzip ./exdata_data_household_power_consumption.zip')

###read the data
library(lubridate)
hpc <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)
hpc$Date <- dmy(hpc$Date)
hpc <- hpc[format(hpc$Date, "%Y-%m")=="2007-02",]
hpc2<-hpc[format(hpc$Date, "%d")<"03",]

###plot
png(file="plot3.png", width=480, height=480)
plot(hpc$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l", xaxt="n")
lines(hpc$Sub_metering_2, col=2)
lines(hpc$Sub_metering_3, col=4)
legend("topright", col = c("black", "red", "blue"), lty = c(1,1, 1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(side=1, at=c("0", "1440", "2880"), labels=c("Thu", "Fri", "Sat"))
dev.off()
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile='./exdata_data_household_power_consumption.zip')
system('unzip ./exdata_data_household_power_consumption.zip')

###read the data
library(lubridate)
hpc <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)
hpc$Date <- dmy(hpc$Date)
hpc <- hpc[format(hpc$Date, "%Y-%m")=="2007-02",]
hpc2<-hpc[format(hpc$Date, "%d")<"03",]

png(file="plot2.png", width=480, height=480)
plot(hpc$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l", xaxt="n")
axis(side=1, at=c("0", "1440", "2880"), labels=c("Thu", "Fri", "Sat"))
dev.off()
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
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile='./exdata_data_household_power_consumption.zip')
system('unzip ./exdata_data_household_power_consumption.zip')


###read the data
library(lubridate)
hpc <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)
hpc$Date <- dmy(hpc$Date)
hpc <- hpc[format(hpc$Date, "%Y-%m")=="2007-02",]
hpc2<-hpc[format(hpc$Date, "%d")<"03",]

png(file="plot1.png", width=480, height=480)
hist(hpc$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col=2)
dev.off()
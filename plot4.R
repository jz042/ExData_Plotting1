### Johns Hopkins Data Science Specialization Coursera Course
### Course 4: Exploratory Data Analysis
### Project 1

# IMPORTING AND SUBSETTING DATA

getwd()
setwd("/Users/juliezhou/Documents/Coursera/4. Explorary Data Analysis")

library(data.table)
library(plyr)

DT <- fread("sed '1p;/^[12]\\/2\\/2007/!d' household_power_consumption.txt", na.strings = c("?", ""))
names(DT)                   #Check headings
head(DT,10)

DT$Date <- as.Date(DT$Date, "%d/%m/%Y")     #Convert to date format
DT$DateTime <- as.POSIXct(paste(DT$Date, DT$Time)) 

ddply(DT, .(Date), nrow)    #Check num of rows by date

# PLOT 4

png(file="plot4.png",width=480,height=480,res=72)

par(mfrow=c(2,2),cex=0.6)

plot(xrange,DT$Global_active_power,type="l",main="",xlab="",ylab="Global Active Power")

plot(xrange,DT$Voltage,type="l",main="",ylab="Voltage",xlab="datetime")

plot(xrange,yrange1,type="l",ylab="Energy sub metering",xlab="")
lines(xrange,yrange2,type="l",col="red")
lines(xrange,yrange3,type="l",col="blue")
legend("topright",legendtext,lty=1,col=c("black","red","blue"),bty="n")

plot(xrange,DT$Global_reactive_power, type="l",main="", ylab="Global Reactive Power",xlab="datetime")

dev.off()
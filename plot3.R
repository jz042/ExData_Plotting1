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

# PLOT 3

xrange <- DT$DateTime
yrange1 <- DT$Sub_metering_1
yrange2 <- DT$Sub_metering_2
yrange3 <- DT$Sub_metering_3
legendtext <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")

png(file="plot3.png",width=480,height=480,res=72)
plot(xrange,yrange1,type="l",ylab="Energy sub metering",xlab="")
lines(xrange,yrange2,type="l",col="red")
lines(xrange,yrange3,type="l",col="blue")
legend("topright",legendtext,lty=1,col=c("black","red","blue"))
dev.off()
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

# PLOT 1

png(file="plot1.png",width=480,height=480,res=72)
hist(DT$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
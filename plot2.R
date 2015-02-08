
## CourseRA--Exploratory Data Analysis--Project 1
## plot2.R
## 2015/02/08

## loading the data
data <- read.table("./data/household_power_consumption.txt",
                   header=TRUE,sep=";",stringsAsFactors=FALSE)

## convert the Date variables to Date class
data$Date <- as.Date(data$Date,"%d/%m/%Y")

## subset the data from the dates 2007-02-01 and 2007-02-02
data2 <- subset(data,data$Voltage!="?"& (data$Date=="2007-02-01"|data$Date=="2007-02-02"))

data2$weekday <- weekdays(data2$Date)

## convert the electrical quantities and some sub-metering 
## variables to numeric class
data2$Global_active_power <- as.numeric(data2$Global_active_power)
data2$Global_reactive_power <- as.numeric(data2$Global_reactive_power)
data2$Voltage <- as.numeric(data2$Voltage)
data2$Global_intensity <- as.numeric(data2$Global_intensity)
data2$Sub_metering_1 <- as.numeric(data2$Sub_metering_1)
data2$Sub_metering_2 <- as.numeric(data2$Sub_metering_2)
data2$Sub_metering_3 <- as.numeric(data2$Sub_metering_3)

## construct the plot
time <- 1:nrow(data2)
plot(time,data2$Global_active_power,type="l",  
     ylab="Global Active Power (kilowatts)",xlab="",axes=FALSE)
axis(1, at=c(0,1440,2880), lab=c("Thu","Fri","Sat"))
axis(2,at=c(0,2,4,6))
box()
## save it to a PNG file
dev.copy(png,file="plot2.png")
dev.off()


## CourseRA--Exploratory Data Analysis--Project 1
## plot3.R
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
with(data2,plot(time,Sub_metering_1, type="l",col="black",
                ylab="Energy sub metering",xlab="",axes=FALSE))

axis(1, at=c(0,1440,2880), lab=c("Thu","Fri","Sat"))
axis(2,at=c(0,10,20,30))
box()
with(data2,lines(time,Sub_metering_2, col="red"))
with(data2,lines(time,Sub_metering_3, col="blue"))

legend("topright",lty=1,col=c("black","red","blue"),cex=0.8,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## save it to a PNG file 
dev.copy(png,file="plot3.png")
dev.off()

## Here is code for plot4.

## Reading project Data into R
  data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
## Subsetting data with Date at 1/2/2007 and 2/2/2007
  data1<-data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
## Change the Date  and time format to character
  data1$Date<-as.character(data1$Date)
  data1$Time<-as.character(data1$Time)
## Total row is 2880, and each date has 1440 row. Formating Date with 1/2/07 and 2/2/07.  
  data1$Date<-rep(c("1/2/07","2/2/07"), each=1440)

## create variable xx for strptime() function to format time variable.
  xx<-paste(data1$Date,data1$Time)
  formaltime<-strptime(xx,"%d/%m/%y %H:%M:%S")
## Create final data set for plot.

  finalData<-data.frame(formaltime,data1)


#plot4
 png(filename="plot4.png",width=480,height=480)
 par(mfrow=c(2,2))
        with(finalData,{plot(formaltime,as.numeric(finalData$Global_active_power)/1000,type="l",ylab="Global active power(kilowatts)")
                           plot(formaltime,as.numeric(finalData$Voltage),type="l",ylab="Voltage")
                           plot(formaltime,as.numeric(finalData$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering")
                           lines(formaltime,as.numeric(finalData$Sub_metering_2),type="l",col="red")
                           lines(formaltime,as.numeric(finalData$Sub_metering_3),type="l",col="blue")
                           legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
                           plot(formaltime,as.numeric(finalData$Global_reactive_power)/1000,type="l",ylab="Global reactive power(kilowatts)")})
 dev.off()

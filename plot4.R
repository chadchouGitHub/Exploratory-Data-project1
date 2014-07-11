## Here is code for plot4.






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

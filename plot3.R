## Here is plot3 code for R program.







#plot3
  png(filename="plot3.png",width=480,height=480)
  plot3<-plot(formaltime,as.numeric(finalData$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering")
  lines(formaltime,as.numeric(finalData$Sub_metering_2),type="l",col="red")
  lines(formaltime,as.numeric(finalData$Sub_metering_3),type="l",col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
  
dev.off()

## Here is plot2 R program code

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

#plot2
png(filename="plot2.png",width=480,height=480)
plot2<-plot(formaltime,as.numeric(finalData$Global_active_power)/1000,type="l",ylab="Global active power(kilowatts)")
dev.off()

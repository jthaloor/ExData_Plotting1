# Use library dplyr
library(dplyr)

# Get the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "power_consumption.zip")
#unzip the file
unzip(zipfile="power_consumption.zip",exdir = "project1")

#open file and read it. Mark "?" as NA
data <- tbl_df(read.table("project1/household_power_consumption.txt",sep=";",na.strings=c("?"),header = TRUE,fill=TRUE))

#filter what you need
data <- filter(data,as.character(Date) %in% c("1/2/2007","2/2/2007"))

# covert time and date to single field
data$DateTime <- strptime(paste(as.character(data$Date),as.character(data$Time)),format="%d/%m/%Y %H:%M:%S")


#Plot three columns on the same plot
png(filename = "plot3.png",width = 480,height = 480)
plot(x=data$DateTime,y=data$Sub_metering_1,type='n',xlab="",ylab="Energy Sub Metering")
lines(data$DateTime,data$Sub_metering_1,col="black")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty='solid',cex=0.5)
dev.off()


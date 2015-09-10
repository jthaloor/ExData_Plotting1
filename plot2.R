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

# Plot2 is a line plot
png(filename = "plot2.png",width = 480,height = 480)
plot(x=data$DateTime,y=data$Global_active_power,type="line",ylab = "Global Active Power (Kilowatts)",xlab="")
dev.off()


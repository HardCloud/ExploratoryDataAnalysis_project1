#Download the entire zipped data set. 
#Since this is the first plot, the code for downloading the data is only in this file. 
#The other files (plot2,plot3,plot4) only include the code for reading the file. 

ZipFileUrl<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(ZipFileUrl,destfile = './household_power_consumption.zip')

#Unzip the downloaded data set
unzip("household_power_consumption.zip")

#Read this data into R and name the columns
Alldata<-read.table("household_power_consumption.txt",col.names= 
                       c("Date", "Time", "Global_active_power", 
                         "Global_reactive_power", "Voltage", "Global_intensity", 
                         "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"
                         ),skip = 1,sep=";")

#Subset the data over the requested two-day period here called twodata
twodata<-subset(Alldata, Alldata$Date=="1/2/2007" | Alldata$Date=="2/2/2007")
#remove the full data set
rm(Alldata)

#plot the histogram into the png file plot1.png
#open png device
png(filename="plot1.png",width = 480, height = 480)

#The histogram
hist(as.numeric(as.character(twodata$Global_active_power)),
     xlab="Global Active Power (kilowatt)", 
     main="Global Active Power",  col="red")
#close png device
dev.off()

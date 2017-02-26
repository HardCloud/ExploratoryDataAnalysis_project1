#Read this data into R and Name the columns
Alldata<-read.table("household_power_consumption.txt",col.names= 
                      c("Date", "Time", "Global_active_power", 
                        "Global_reactive_power", "Voltage", "Global_intensity", 
                        "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"
                      ),skip = 1,sep=";")


#Subset the data over the requested two-day period here called twodata
twodata<-subset(Alldata, Alldata$Date=="1/2/2007" | Alldata$Date=="2/2/2007")
#Remove the full data set
rm(Alldata)

#convert the dates
twodata$Date <- as.Date(twodata$Date, format = '%d/%m/%Y')
#convert the times and make a new column with pasted timesanddates in posixct format 
twodata$DateTime <- as.POSIXct(paste(twodata$Date, twodata$Time))

#Create the plot in the png file plot3.png
#open png device
png(filename="plot3.png",width = 480, height = 480)

#plot3
plot(twodata$DateTime, twodata$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(twodata$DateTime, twodata$Sub_metering_2, col = 'red')
lines(twodata$DateTime, twodata$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)

#close png device
dev.off()

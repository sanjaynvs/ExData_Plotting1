#Exploratory Data Analysis - Assignment 1 - Plot 4

#Importing the dataset, with file.choose
#The subset data (rom the dates 2007-02-01 and 2007-02-02) has been copied to another file. 
#This is the one that will be selected
hhDataSubset <- read.delim(file.choose(),sep = ";", header = TRUE)

#Post import, doing some cursory checks
dim(hhDataSubset)
colnames(hhDataSubset)

#creating new column for plotting the graph versus date and time, by combining the date and time
hhDataSubset$tStr<-strptime(paste(hhDataSubset$Date,hhDataSubset$Time), format = "%d/%m/%Y %H:%M:%S")

#Set par for 2x2 plot
par(mfrow=c(2,2))

#plotting to default device for checking purpse

#1st plot - global Active power
plot(hhDataSubset$tStr, hhDataSubset$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")

#2nd plot - Voltage
plot(hhDataSubset$tStr, hhDataSubset$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

#3rd Plot, plotting for sub_metering_x
#plotting the layout with Sub_metering _1
plot(hhDataSubset$tStr, hhDataSubset$Sub_metering_1, type="l", xlab = "", ylab = "Energy Submetering")

#adding data for sub_metering_2
points(hhDataSubset$tStr, hhDataSubset$Sub_metering_2, type="l", col="blue")

#adding data for sub_metering_3
points(hhDataSubset$tStr, hhDataSubset$Sub_metering_3, type="l", col="red")

#adding legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","blue", "red"), lty=1, cex=0.8,bty = "n")

#plot 4- global Reactive power
plot(hhDataSubset$tStr, hhDataSubset$Global_active_power, type="l", xlab = "datetime", ylab = "Global Reactive Power")

#Looks Ok!
#Initiating procedure to print this to png

#open png and plot the above plots, with the required height and width
png("Plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(hhDataSubset$tStr, hhDataSubset$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
plot(hhDataSubset$tStr, hhDataSubset$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
plot(hhDataSubset$tStr, hhDataSubset$Sub_metering_1, type="l", xlab = "", ylab = "Energy Submetering")
points(hhDataSubset$tStr, hhDataSubset$Sub_metering_2, type="l", col="blue")
points(hhDataSubset$tStr, hhDataSubset$Sub_metering_3, type="l", col="red")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","blue", "red"), lty=1, cex=0.8,bty="n")
plot(hhDataSubset$tStr, hhDataSubset$Global_active_power, type="l", xlab = "datetime", ylab = "Global Reactive Power")

#close the png
dev.off()


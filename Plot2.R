#Exploratory Data Analysis - Assignment 1 - Plot !

#Importing the dataset, with file.choose
#The subset data (rom the dates 2007-02-01 and 2007-02-02) has been copied to another file. 
#This is the one that will be selected
hhDataSubset <- read.delim(file.choose(),sep = ";", header = TRUE)

#Post import, doing some cursory checks
dim(hhDataSubset)
colnames(hhDataSubset)

#creating new column for plotting the graph versus date and time, by combining the date and time
hhDataSubset$tStr<-strptime(paste(hhDataSubset$Date,hhDataSubset$Time), format = "%d/%m/%Y %H:%M:%S")
plot(hhDataSubset$tStr, hhDataSubset$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (Kilowatts)")

#Looks Ok!
#Initiating procedure to print this to png

#open png and plot, with the required height and width
png("Plot2.png", width = 480, height = 480)
plot(hhDataSubset$tStr, hhDataSubset$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (Kilowatts)")

#close the png
dev.off()


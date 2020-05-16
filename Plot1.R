#Exploratory Data Analysis - Assignment 1 - Plot !

#Importing the dataset, with file.choose
#The subset data (rom the dates 2007-02-01 and 2007-02-02) has been copied to another file. 
#This is the one that will be selected
hhDataSubset <- read.delim(file.choose(),sep = ";", header = TRUE)

#Post import, doing some cursory checks
dim(hhDataSubset)
colnames(hhDataSubset)

#Doing a historgram plot on default device for doing a cursory check 
with(hhDataSubset, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red"))

#Looks Ok!
#Initiating procedure to print this to png

#open png, with the required height and width
png("Plot1.png", width = 480, height = 480)

#plot to png
with(hhDataSubset, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red"))

#close the png
dev.off()

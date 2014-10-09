# COURSE PROJECT 1 ######### plot3 #########
# COURSE PROJECT 1 ######### plot3 #########
# COURSE PROJECT 1 ######### plot3 #########
###################################################################################
#NOTE: I SHOULD HAVE OVER-RIDE READING IN AS FACTORS Since I did not, I needed
#to convert factor variables to characters and then to numeric 
################################
# Read in all the data
data <- read.table("household_power_consumption.txt", header = T, sep = ";")

# format Date column as a date.
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Course Project 1 only uses data from the dates 2007-02-01 and 2007-02-02. I
# chose to read all the data and then subset as coded below (instead of only
# reading in the two days).
twodays <- subset(data, Date >="2007-02-01" & Date<="2007-02-02") # dim(twodays) # [1] 2880    9

# Paste together the data and time.
twodays$DateTime <- paste(twodays$Date, twodays$Time, sep = " ", collapse = NULL)
# Make the datatime a POSIX list (POSIXlt)
twodays$DateTime <- as.POSIXlt(twodays$DateTime) 
# class(twodays$DateTime) # [1] "POSIXlt" "POSIXt" 

################## Plot 3 ################## 
# The three lines of code directly below is what you need to do if you
#read in everything as factors; i.e., you need to convert to character and then
#to numberic
twodays$Sub_metering_1 <- as.numeric(as.character(twodays$Sub_metering_1))
twodays$Sub_metering_2 <- as.numeric(as.character(twodays$Sub_metering_2))
twodays$Sub_metering_3 <- as.numeric(as.character(twodays$Sub_metering_3))

plot(twodays$DateTime, twodays$Sub_metering_1, "l", xlab="", ylab="Energy sub metering") # makes plot
lines(twodays$DateTime, twodays$Sub_metering_2, col="red") # adds line to the plot
lines(twodays$DateTime, twodays$Sub_metering_3, col="blue") # adds line to the plot

dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
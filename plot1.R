# COURSE PROJECT 1 ######### plot1 #########
# COURSE PROJECT 1 ######### plot1 #########
# COURSE PROJECT 1 ######### plot1 #########
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

################## Plot 1 ################## 
# Convert factor variable to characters and then to numeric
twodays$Global_active_power<-as.numeric(as.character(twodays$Global_active_power))

hist(twodays$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!

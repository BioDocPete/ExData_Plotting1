# COURSE PROJECT 1 ######### plot4 #########
# COURSE PROJECT 1 ######### plot4 #########
# COURSE PROJECT 1 ######### plot4 #########
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

# Converts factor variables to characters and then to numeric
twodays$Global_active_power<-as.numeric(as.character(twodays$Global_active_power))
twodays$Sub_metering_1 <- as.numeric(as.character(twodays$Sub_metering_1))
twodays$Sub_metering_2 <- as.numeric(as.character(twodays$Sub_metering_2))
twodays$Sub_metering_3 <- as.numeric(as.character(twodays$Sub_metering_3))
twodays$Voltage <- as.numeric(as.character(twodays$Voltage))
twodays$Global_reactive_power <- as.numeric(as.character(twodays$Global_reactive_power))

# Paste together the data and time.
twodays$DateTime <- paste(twodays$Date, twodays$Time, sep = " ", collapse = NULL)
# Make the datatime a POSIX list (POSIXlt)
twodays$DateTime <- as.POSIXlt(twodays$DateTime) 
# class(twodays$DateTime) # [1] "POSIXlt" "POSIXt" 
plot(twodays$DateTime, twodays$Global_active_power, "l", xlab="", ylab="Global Active Power (kilowatts)")

################## Plot 4 ################## 
par(mfcol=c(2,2)) # 4 figures load by columns into 2 columns and 2 rows
# 1st plot
plot(twodays$DateTime, twodays$Global_active_power, "l", xlab="", ylab="Global Active Power")
# 2nd plot
plot(twodays$DateTime, twodays$Sub_metering_1, "l", xlab="", ylab="Energy sub metering")
lines(twodays$DateTime, twodays$Sub_metering_2, col="red")
lines(twodays$DateTime, twodays$Sub_metering_3, col="blue")
legend("topright", # places a legend at the appropriate place 
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), # puts text in the legend 
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       lwd=c(2.5,2.5,2.5), col=c("black", "red","blue"), # gives the legend lines the correct color and width
       bty = "n", # removees the border from the legend
       cex=0.25) # changes the character size
# 3rd plot
plot(twodays$DateTime, twodays$Voltage, "l", xlab="datetime", ylab="Voltage")
# 4th plot
plot(twodays$DateTime, twodays$Global_reactive_power, "l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
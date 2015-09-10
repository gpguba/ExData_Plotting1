#read data from a text fle separated by ";"
#header=TRUE sets the first row as header
#na.string ="?" makes all "?" values as NA so R can process it acordingly
data <- read.table("household_power_consumption.txt",  sep=";", header=TRUE, na.strings = "?")

#convert Data  column to Date class
data[,1] <- as.Date(data[,1], "%d/%m/%Y")


#filter data using dates 2007-02-01 and 2007-02-02 only
datapart <- subset(data,Date >="2007-02-01" & Date <= "2007-02-02")

#create new column combinig date and time and converting to Date/Class object usin strptime
datapart <- data.frame(datapart, datetime =strptime(paste(datapart[,1], datapart[,2]),"%Y-%m-%d %H:%M:%S" ))

#start PNG device driver to save output to plot4.png
png(file="plot4.png", width=480, height=480)

#specify layout of graph into2 rows 2 columns
par(mfrow=c(2,2))

#create plot 1 with axis labels and names smaller by 0.8
plot(datapart$datetime, datapart$Global_active_power, xlab = "",ylab="Global Active Power",
     type="l")

#create plot 2
plot(datapart$datetime, datapart$Voltage, xlab = "datetime",ylab="Voltage",
     type="l")

#create plot 3
# for submetering 1
plot(datapart$datetime, datapart$Sub_metering_1, xlab = "",ylab="Energy sub metering",
     type="l")
#add line for for sub metring 2
lines(datapart$datetime, datapart$Sub_metering_2, col ="red")

#add line for for sub metring 3
lines(datapart$datetime,  datapart$Sub_metering_3, col ="blue")

#create a legend WITHOUT border with text size smaller by 0.8
legend("topright", max(datapart$Sub_metering_1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, bty ="n")

#create plot 4
plot(datapart$datetime, datapart$Global_reactive_power, xlab = "datetime",ylab="Global_reactive_power",
     type="l")

#flush output to png
dev.off()

#reset to default layout
par(mfrow=c(1,1))

#copy current plot to a PNG file
#dev.print(png, file ="plot4.png", width = 480, height = 480)

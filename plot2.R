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
png(file="plot2.png", width=480, height=480)

#create plot of datapart (Plot 2)
plot(datapart$datetime, datapart$Global_active_power, xlab = "",
     ylab="Global Active Power (kilowatts)", type="l")

#copy current plot to a PNG file
#dev.print(png, file ="plot2.png", width = 480, height = 480)


#flush output to png
dev.off()
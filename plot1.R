#read data from a text fle separated by ";"
#header=TRUE sets the first row as header
#na.string ="?" makes all "?" values as NA so R can process it acordingly
data <- read.table("household_power_consumption.txt",  sep=";", header=TRUE, na.strings = "?")

#convert Data  column to Date class
data[,1] <- as.Date(data[,1], "%d/%m/%Y")


#filter data using dates 2007-02-01 and 2007-02-02 only
datapart <- subset(data,Date >="2007-02-01" & Date <= "2007-02-02")

#start PNG device driver to save output to plot4.png
png(file="plot1.png", width=480, height=480)

#create histogram of datapart (Plot 1)
hist(datapart$Global_active_power, col = "red", main ="Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

#copy current plot to a PNG file
#dev.print(png, file ="plot1.png", width = 480, height = 480)

#flush output to png
dev.off()
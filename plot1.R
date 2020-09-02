#Plot 1
power <- read.csv("./household_power_consumption.txt",sep=";")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

# calling the basic hist function
png("Plot1.png", width=480, height=480)
hist(as.numeric(subpower$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off
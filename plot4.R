#Plot 4
power <- read.csv("./household_power_consumption.txt",sep=";")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
#intialize multiple plots
png("Plot4.png", width=480, height=480)

par(mfrow=c(2,2))
#Plot 4.1
plot(subpower$Time,as.numeric(subpower$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)")
#Plot 4.2
plot(subpower$Time,as.numeric(subpower$Voltage),type="l",xlab="datetime",ylab="Voltage")
#Plot 4.3
plot(subpower$Time,subpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subpower,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subpower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subpower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Plot 4.4
plot(subpower$Time,as.numeric(subpower$Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off
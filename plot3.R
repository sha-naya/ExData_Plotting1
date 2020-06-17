epc.data <- read.table("/Users/Ayan/Desktop/R Specialization/ExData_Plotting1/household_power_consumption.txt", sep = ";", header = TRUE)
epc.subset <- subset(epc.data, Date == "1/2/2007" | Date == "2/2/2007", select = c(Date, Time, Global_active_power, Global_reactive_power, Voltage, Global_intensity, Sub_metering_1, Sub_metering_2, Sub_metering_3))

epc.subset <- unite_(epc.subset, "Date_Time", c("Date", "Time"))

epc.subset$Date_Time <- strptime(epc.subset$Date_Time, "%d/%m/%Y_%H:%M:%S")

epc.subset$Global_active_power <- as.numeric(epc.subset$Global_active_power)
epc.subset$Global_reactive_power <- as.numeric(epc.subset$Global_reactive_power)
epc.subset$Voltage <- as.numeric(epc.subset$Voltage)
epc.subset$Global_intensity <- as.numeric(epc.subset$Global_intensity)

plot(epc.subset$Date_Time, epc.subset$Sub_metering_1, type = "l", ylab = "Energy sub metering", cex.lab = 0.5, cex.axis = 0.5, xlab = "", col = "black")
points(epc.subset$Date_Time, epc.subset$Sub_metering_2, type = "l", col = "red")
points(epc.subset$Date_Time, epc.subset$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, cex = 0.5)
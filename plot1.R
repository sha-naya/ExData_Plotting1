epc.data <- read.table("/Users/Ayan/Desktop/R Specialization/ExData_Plotting1/household_power_consumption.txt", sep = ";", header = TRUE)

epc.data$Date <- as.Date(epc.data$Date, format = "%d/%m/%Y")
epc.data$Date <- as.character(epc.data$Date)
#epc.data$Time <- strptime(epc.data$Time, format = "%H:%M:%S")#???

epc.data$Global_active_power <- as.numeric(epc.data$Global_active_power)
epc.data$Global_reactive_power <- as.numeric(epc.data$Global_reactive_power)
epc.data$Voltage <- as.numeric(epc.data$Voltage)
epc.data$Global_intensity <- as.numeric(epc.data$Global_intensity)

epc.subset <- subset(epc.data, Date == "2007-02-01" | Date == "2007-02-02", select = c(Date, Global_active_power, Global_reactive_power, Voltage, Global_intensity, Sub_metering_1, Sub_metering_2, Sub_metering_3))

hist(epc.subset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", xaxt = "n", ylim = c(0,1300), col = "red", cex.axis = 0.5, cex.main = 0.75, cex.lab = 0.75)
axis(side = 1, at = seq(0, 6, 2), cex.axis = 0.55)

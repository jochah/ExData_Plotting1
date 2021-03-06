#Reading Data
data <- read.table("household_power_consumption.txt", skip=1,sep=";")
names(data) <- c("Date", "Time", "Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dias <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007") 

#Transforming type of variables Date and Time in dias
dias$Date <- as.Date(dias$Date, format="%d/%m/%Y")
dias$Time <- strptime(dias$Time, format="%H:%M:%S")
dias[1:1440,"Time"] <- format(dias[1:1440,"Time"],"2007-02-01 %H:%M:%S")
dias[1441:2880,"Time"] <- format(dias[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Plotting
plot(dias$Time,as.numeric(as.character(dias$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)", main = "Global Active Power (KW)") 
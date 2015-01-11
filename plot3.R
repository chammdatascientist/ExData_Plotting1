library(sqldf)
dat <- read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)

dat$DateTime <- paste(dat$Date, dat$Time)
dat$DateTime_plot1 <- as.POSIXct(paste(dat$Date,dat$Time), format="%d/%m/%Y %H:%M:%S")

png(file="plot3.png", height=480, width = 480)


with(dat, plot(DateTime_plot1, Sub_metering_1, col = "black", type = "l", ylab = "Energy sub metering", xlab = ""))

 with(dat, lines(DateTime_plot1, Sub_metering_2, col = "red", type = "l"))

 with(dat, lines(DateTime_plot1, Sub_metering_3, col = "blue", type = "l"))

legend("topright", pch = "---", col = c("black", "blue", "red") , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file = "plot3.png")
dev.off()
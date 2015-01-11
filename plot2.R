library(sqldf)
dat <- read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)

dat$DateTime <- paste(dat$Date, dat$Time)
dat$DateTime_plot1 <- as.POSIXct(paste(dat$Date,dat$Time), format="%d/%m/%Y %H:%M:%S")

png(file="plot2.png", height=480, width = 480)
plot(x=(dat$DateTime_plot1), y=dat$Global_active_power, pch = ".", ylab = "Global Active Power (kilowats)", xlab = "")

lines(x=dat$DateTime_plot1, y=dat$Global_active_power, type="l")

dev.copy(png, file = "plot2.png")
dev.off()
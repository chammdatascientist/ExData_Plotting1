library(sqldf)
dat <- read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)

hist(dat$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowats)")

png(file="plot1.png", height=480, width = 480)

dev.copy(png, file = "plot1.png")
dev.off()
## Read Data
data <- read.table(file = 'household_power_consumption_Project_1.txt',
                   header = TRUE, sep = ';', na.strings = '?')

## Convert to date format
date <- as.Date(data$Date, '%d/%m/%Y')
data$Date <- date

## Subset the data
subdata <- subset(data, Date >= '2007-02-01' & Date <= '2007-02-02')
any(is.na(subdata)) ## Check if there are any missing values
names(subdata)
rm(data)

## Convert data and time to a new character, dt 
dt <- paste(subdata$Date, subdata$Time)
subdata$dt <- as.POSIXct(dt)

## plot 3
metering1 <- subdata$Sub_metering_1
metering2 <- subdata$Sub_metering_2
metering3 <- subdata$Sub_metering_3

plot(subdata$dt, metering1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(subdata$dt, metering2, col = 'red')
lines(subdata$dt, metering3, col = 'blue')
legend('topright', col = 1:3, lty = 1, lwd = 2, legend = names(subdata)[7:9])
## Save to png file
dev.copy(png, file = 'plot3.png', height = 480, width = 480)
dev.off()

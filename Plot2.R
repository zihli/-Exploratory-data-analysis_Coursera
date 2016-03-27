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
gap <- as.numeric(subdata$Global_active_power)

## Plot 2
plot(subdata$dt, gap, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
## Save to png file
dev.copy(png, file = 'plot2.png', height = 480, width = 480)
dev.off()
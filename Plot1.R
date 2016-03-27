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

## Plot 1: 
hist(gap, xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power', col = 'red')
## Save to png file
dev.copy(png, file = 'plot1.png', height = 480, width = 480)
dev.off()
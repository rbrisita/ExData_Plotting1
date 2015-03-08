# Course Project One for Exploratory Data Analysis
# @author Robert Brisita

# Read in data
FILE = 'household_power_consumption.txt'
PNG_FILE = 'plot2.png'

df = read.table(FILE, header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE, nrows = 100)
classes = sapply(df, class)
df = read.table(FILE, header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE, colClasses = classes)

# Get working set
ws = df[as.Date(df$Date, '%d/%m/%Y') > '2007-01-31' & as.Date(df$Date, '%d/%m/%Y') < '2007-02-03',]
ws$Date = as.Date(ws$Date, '%d/%m/%Y')

# Configure plot and display
par(mfrow = c(1,1))
par(mar = c(4,1,1,1))
plot(as.POSIXlt(ws$Date)$wday, ws$Global_active_power, pch='.', type='l')

# Create PNG File
png(PNG_FILE)
plot(as.POSIXlt(ws$Date)$wday, ws$Global_active_power, pch='.', type='l')
dev.off()


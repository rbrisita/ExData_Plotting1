# Course Project One for Exploratory Data Analysis
# @author Robert Brisita

# Read in data
FILE = 'household_power_consumption.txt'
PNG_FILE = 'plot1.png'

df = read.table(FILE, header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE, nrows = 100)
classes = sapply(df, class)
df = read.table(FILE, header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE, colClasses = classes)

# Get working set
ws = df[as.Date(df$Date, '%d/%m/%Y') > '2007-01-31' & as.Date(df$Date, '%d/%m/%Y') < '2007-02-03',]

# Configure plot and display
par(mfrow = c(1,1))
par(mar = c(4,1,1,1))
hist(ws$Global_active_power, freq = TRUE, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')

# Create PNG File
png(PNG_FILE)
hist(ws$Global_active_power, freq = TRUE, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.off()


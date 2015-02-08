# Set the working directory
setwd("~/Coursera/Data Science Specialization/4. Exploratory Data Analysis/ExData_Plotting1")

# Load the entire data from the text file into R
data_file <- "./data/household_power_consumption.txt"
# Declare the variable types to speed up the data load Do not convert the date
# strings to one of R's date classes because we don't need them for any
# analytic work, and this will save us some time while reading the data into R
col_types <- c("character", "character", "numeric", "numeric", "numeric",
               "numeric", "numeric", "numeric", "numeric")
# Use delimited format, modify some of the options to speed up the data load
full_data <- read.csv(data_file, sep = ";", na.strings = "?", colClasses =
                      col_types, nrows = 2.1e6, stringsAsFactors = FALSE,
                      comment.char = "" )

# Select the study period, since we haven't converted the dates into a date
# class, use regex to allow for slight variations in the date string
study_data_select <- grepl("^0?[12]/0?2/2007", full_data$Date)
study_data <- full_data[study_data_select, ]

# Use Lubridate package for easy handling of dates
library(lubridate)
study_data$timestamps <- dmy_hms(paste(study_data$Date, study_data$Time))

# Set the output device to the destination file in PNG format
png(filename = "./plot4.png", width = 480, height = 480, bg = "transparent")

# Set the plot grid to 2 x 2
par(mfcol = c(2, 2))

# First line plot (this is "Plot 2")
plot(
  study_data$timestamps,
  study_data$Global_active_power,
  xlab = "",
  ylab = "Global Active Power",
  type = "l"
)

# Second line plot (this is "Plot 3")
plot(
  study_data$timestamps,
  study_data$Sub_metering_1,
  xlab = "",
  ylab = "Energy sub metering",
  type = "l"
)
lines(study_data$timestamps, study_data$Sub_metering_2, col = "red")
lines(study_data$timestamps, study_data$Sub_metering_3, col = "blue")
legend("topright",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       bty = "n")

# Third plot, no special formatting
plot(
  study_data$timestamps,
  study_data$Voltage,
  xlab = "datetime",
  ylab = "Voltage",
  type = "l"
)

# Fourth plot, no special formatting
# For closest match, add option "lwd  = 0.7"
plot(
  study_data$timestamps,
  study_data$Global_reactive_power,
  xlab = "datetime",
  ylab = "Global_reactive_power",
  type = "l"
)

# Close the output device
dev.off()

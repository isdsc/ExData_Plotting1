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

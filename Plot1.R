#The purpose of this R code is to read a specific subset of data from the UC
#Irvine Machine Learning Repository so I can then work specifically with the dataset
# Electrical power comsumption to look at the Global Active power (kilowatts) freuency

#First I start with a clean slate:
rm(list=ls())

#Second, I read in the data that I need. For this assignment we are only looking
#at data from 2/1/2007-2/2/2007 so I experimented with determining what range of rows
#I needed and determined that I needed to skip 6636 rows and wanted to read in 2880 
#rows.
final_data<-read.table("household_power_consumption.txt", 
                       header = TRUE, sep=";", skip = 66636, nrows = 2880)

#Since I am pulling a subset of the data, I need to go back to the top of the file
# in order to read in the first line of data which has the column names/ header.
headings_data <- read.table("household_power_consumption.txt", 
           header = TRUE, sep=";", nrows = 1)

#I then assign the column names from headings data into my final data data frame.
colnames(final_data)<- colnames(headings_data)

#Next I create a png of the plot output
png("plot1.png", width=480,height=480)

#Finally I create the historgram with Global Active Power (a column in the data frame). 
#I assign the title, labels as described in the instructions on Coursera for project 1.
hist(final_data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()


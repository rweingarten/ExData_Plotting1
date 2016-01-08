#The purpose of this R code is to read a specific subset of data from the UC
#Irvine Machine Learning Repository and we are specifically using the dataset
# Electrical power comsumption to look at the Global Active power (kilowatts) over a 
#particular period of time.

#First I begin with a clean slate:
rm(list=ls())

#Second, I read in the data that I need. For this assignment we are only looking
#at data from 2/1/2007-2/2/2007 so I experimented with determining what range of rows
#I needed and determined that I needed to skip 6636 rows and wanted to read in 2880.
final_data<-read.table("household_power_consumption.txt", 
                       header = TRUE, sep=";", skip = 66636, nrows = 2880)

#Since I am pulling a subset of the data, I need to go back to the top of the file
# in order to read in the first line of data which has the column names.
headings_data <- read.table("household_power_consumption.txt", 
                            header = TRUE, sep=";", nrows = 1)

#I then assign the column names from headings data into my final data data frame.
colnames(final_data)<- colnames(headings_data)

#In order for R not to look at the date and time as a vector I create a new variable
#DateTime.
DateTime<- strptime(paste(final_data$Date,final_data$Time, sep = " "), 
                    "%d/%m/%Y %H:%M:%S")


#create png of the plot output
png("plot2.png", width=480,height=480)

#create the line plot with Global Active Power (a column in the data frame). I 
# assign the title, labels and desribed in the instructions on Coursera for project 1

plot(DateTime, final_data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()
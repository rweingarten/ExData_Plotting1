
#The purpose of this R code is to read a specific subset of data from the UC
#Irvine Machine Learning Repository and we are specifically using the dataset
# Electrical power comsumption to look at the submetering data over the days of data
# I have pulled in.

#First I create a clean slate:
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

#create variables for each of the submetering vaues.
submetering1<- as.numeric(final_data$Sub_metering_1)
submetering2<- as.numeric(final_data$Sub_metering_2)
submetering3<- as.numeric(final_data$Sub_metering_3)


#create png of the plot output
png("plot3.png", width=480,height=480)

#create the line plot with all three submetering values(a column in the data frame). I 
# assign the title, labels and desribed in the instructions on Coursera for project 1
#This plot has three different colors for the different lines so I assign each and
#then construct a legend to define each of these and place the location in the upper
#right corner to mirror the coursera example. 
plot(DateTime, submetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(DateTime,submetering2, type = "l", col="red")
lines(DateTime,submetering3, type = "l", col= "blue")
legend("topright", c("submetering1", "submetering2", "submetering3"), lty = 1, 
       lwd = 2.5, col = c("black","red","blue")
       )
dev.off()
# head(final_data$Date)
# final_data_2<- transform(final_data,Date_Time=paste(Date, Time))
# final_data_2$Date_Time = as.character.Date(final_data_2$Date_Time)
# head(final_data_2)

#The purpose of this R code is to read a specific subset of data from the UC
#Irvine Machine Learning Repository and we are specifically using the dataset
# Electrical power comsumption to lookat the Global Active power (kilowatts) freuency

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

#create png of the plot output
png("plot4.png", width=480,height=480)
#setup the orientation of the four plots next to each other.
par(mfrow=c(2,2))

#create the line plot with Global Active Power (a column in the data frame). I 
# assign the title, labels and desribed in the instructions on Coursera for project 1

#Plot 1 (upper left corner of Global Active power over time)
plot(DateTime, final_data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power")

#Plot 1 (upper right corner of voltage over time)
plot(DateTime, final_data$Voltage, type = "l", xlab = "datetime", 
     ylab = "Voltage")


#create variables for each of the submetering vaues for the third plot bottom left 
#plot.
submetering1<- as.numeric(final_data$Sub_metering_1)
submetering2<- as.numeric(final_data$Sub_metering_2)
submetering3<- as.numeric(final_data$Sub_metering_3)


#create the line plot with all three submetering values(a column in the data frame). I 
# assign the title, labels and desribed in the instructions on Coursera for project 1
#This plot has three different colors for the different lines so I assign each and
#then construct a label to define each of these and place the location in the upper
#right corner to mirror the coursera example. 
plot(DateTime, submetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(DateTime,submetering2, type = "l", col="red")
lines(DateTime,submetering3, type = "l", col= "blue")
legend("topright", c("submetering1", "submetering2", "submetering3"), lty=, 
       lwd = 2.5, col = c("black","red","blue"), bty = "n"
)

#Plot 4, bottom right corner for the global reactive power over time.
plot(DateTime, final_data$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")
dev.off()

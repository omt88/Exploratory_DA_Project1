## Exploratory Data Analysis
## Project 1
## Plot 2

setwd("D:/Users/omartineztr/Desktop/CEMEX/Coursera/Data Science Specialization/04 Exploratory Data Analysis/Projects/Project 1")

Dataset <- data.frame(
  read.table(
    "household_power_consumption.txt",
    header=TRUE,
    sep =";",
    na.strings="?",
  )
)

Dataset$Date2 <- as.Date(Dataset$Date, format = "%d/%m/%Y")
Datasubset <- subset(Dataset, Date2 >= "2007-02-01" & Date2 <= "2007-02-02")

Datasubset$Date_time <- as.POSIXct(paste(as.Date(Datasubset$Date2),Datasubset$Time))  

#plotting
plot(Datasubset$Global_active_power~Datasubset$Date_time, 
     type="l",
     ylab="Global Active Power (kilowatts)", 
     xlab="")

# creating file and closing device
dev.copy(png, file="plot2.png", height = 480, width = 480)
dev.off()

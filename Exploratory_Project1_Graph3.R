## Exploratory Data Analysis
## Project 1
## Plot 3

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

## Creating plot

plot(Datasubset$Sub_metering_1~Datasubset$Date_time, 
     type="l", ylab="Energy sub metering", xlab="", col = "black")
lines(Datasubset$Sub_metering_2~Datasubset$Date_time, col = "red")
lines(Datasubset$Sub_metering_3~Datasubset$Date_time, col = "Blue")
legend("topright", col = c("black", "red", "blue"), lty="solid", 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       y.intersp = 0.5, adj=0.1, cex=0.8)
dev.copy(png, file="plot3.png", height = 480, width = 480)
dev.off()

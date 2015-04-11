## Exploratory Data Analysis
## Project 1
## Plot 4

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

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(Datasubset,{
  plot(Datasubset$Global_active_power~Datasubset$Date_time, 
       type="l",
       ylab="Global Active Power (kilowatts)", 
       xlab="")
  plot(Datasubset$Voltage~Datasubset$Date_time,
       type="l",
       ylab="Global Active Power (kilowatts)", 
       xlab="datetime")
  plot(Datasubset$Sub_metering_1~Datasubset$Date_time, 
       type="l", ylab="Energy sub metering", xlab="", col = "black")
  lines(Datasubset$Sub_metering_2~Datasubset$Date_time, col = "red")
  lines(Datasubset$Sub_metering_3~Datasubset$Date_time, col = "Blue")
  legend("topright", col = c("black", "red", "blue"), lty="solid", 
         legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), cex = 0.6,
         y.intersp = 0.8, bty="n", inset = c(0.04,-0.02) )
  plot(Datasubset$Global_reactive_power~Datasubset$Date_time,
       type="l", ylab="Global_Reactive_power",
       xlab="datetime",
       col="black")
})
dev.copy(png, file="plot4.png", height = 480, width = 480)
dev.off()

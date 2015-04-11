## Exploratory Data Analysis
## Project 1

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

hist(Datasubset$Global_active_power, 
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency"
    )

dev.copy(png, file="plot1.png", height = 480, width = 480)
dev.off()

### get current directory

getwd()  

### set current directory

setwd("C:/Users/BINIT007/Dropbox/My PC (DESKTOP-85QSQ8B)/Documents/R_binitsyamal_work/BASE PLOT")

### read .txt file , the file name is renamed to "HPC.txt" for convenience

E.C <- read.csv("HPC.txt",sep=";")
head(E.C)

# Filter 2 dates in February

filter <- E.C$Date=="1/2/2007" | E.C$Date=="2/2/2007"
jaita <- E.C[filter,]

# Use as.numeric to convert string to numeric
p<- as.numeric(jaita$Global_active_power)


# Histogram
hist(p,col = "red",xlab = "Global Active Power (kilowatts)" ,main = 'Global Active Power')
dev.print(png, file = "plot1.png", width = 480, height = 480)
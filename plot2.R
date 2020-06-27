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

# Paste function to combine DATE/TIME, then we used strptime() function for formatting 

data <- paste(jaita$Date, jaita$Time,sep = ',')
head(data)
data1 <- strptime(data, format="%d/%m/%Y,  %H:%M:%S")

# Plot

plot(data1,as.numeric(jaita$Global_active_power),"l",
     ylab = "Global Active Power (kilowatts)",xlab ="" )
dev.print(png, file = "plot2.png", width = 480, height = 480)


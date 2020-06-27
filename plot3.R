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

# Combine DATE/TIME vector with main dataframe

rr <- data.frame(data1,jaita)


# Plot and then we used lines() for overlapping

plot(rr$data1,rr$Sub_metering_1,type = 'l',xlab = "",ylab = "Energy sub metering")

lines(rr$data1, rr$Sub_metering_2, col="red")

lines(rr$data1, rr$Sub_metering_3, col="blue")

# Legends for 3 plots

b <- c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
legend('topright', b, col=c('black', 'red', 'blue'),lwd=1, bty='o')
dev.print(png, file = "plot3.png", width = 480, height = 480,pointsize=12)


#Set your working directory
setwd ("C:/Users/MatyusI/Documents/R_kodok/C4_Exploratory Data Analisys/C4_W4_PR")
#Load the following packages (should be installed in your library first):
library(plyr) 
install.packages("ggplot2")
library(ggplot2)
# Loading provided datasets - loading from local machine
NEI<-readRDS("summarySCC_PM25.rds")
total<-aggregate(Emissions~year, NEI, sum)
png("plot1.png", width=640, height=480)
gg<-barplot(height=total$Emissions/1000, names.arg=total$year, xlab = "Years", ylab = "Total PM2.5 Emissions in tone", main="Total PM2.5")

head(NEI) 
head(total)
print(gg)
dev.off()
        
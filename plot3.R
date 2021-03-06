#install.packages("ggplot2")
#library(ggplot2)

#install.packages("ggplot2")
#library(ggplot2)

NEI<-readRDS("summarySCC_PM25.rds")
#head(NEI2)
#NEI<-NEI2[sample(nrow(NEI2),size=2000, replace=F)]
mland<-NEI[(NEI$fips =="24510"),]
mlandByYear<-aggregate(Emissions~year+type, mland,sum)
png("plot3.png", width=640, height=480)
gg<-ggplot(marylandByYear, aes(mlandByYear$year, mlandByYear$Emissions, color=type))+ geom_line() + xlab("Year") +
  ylab("Total PM2.5 Emission in tons") +
  ggtitle("Total PM2.5 Emissions in Baltimore City, Maryland from 1999 to 2008")
print(gg)
dev.off()
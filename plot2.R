#Loading provided datasets - loading from local machine
NEI<-readRDS("summarySCC_PM25.rds")
mland<-NEI[(NEI$fips =="24510"),]
mlandByYear<-aggregate(Emissions~year, mland,sum)
#Generate the graph in the same directory as the source code
png("plot2.png", width=640, height=480)
bp<-barplot(height=mlandByYear$Emissions/1000, names.arg=mlandByYear$year, 
            xlab = "Years", ylab = "Total PM2.5 Emissions in tone", main="Total PM2.5 Emission in Baltimore")

print(bp)
dev.off()

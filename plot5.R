#install.packages("ggplot2")
#library(ggplot2)

NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#head(NEI2)
#NEI<-NEI2[sample(nrow(NEI2),size=2000, replace=F)]
#SCC.sub <- SCC[grepl("ON-ROAD" , SCC$, ignore.case=TRUE ), ]



mland<-NEI[(NEI$fips =="24510"),]
mland<-mland[(mland$type =="ON-ROAD"),]
#mland <- mland[maryland$SCC %in% SCC.sub$SCC, ]
mlandByYear<-aggregate(Emissions~year+type, mland,sum)
png("plot5.png", width=640, height=480)
gg<-ggplot(mlandByYear, aes(mlandByYear$year, mlandByYear$Emissions, fill=year))+ 
  geom_bar(stat= "identity")+ #, width = .2) + 
  xlab("Year") +
  ylab("Total PM2.5 Emission in tons") +
  ggtitle("Coal combustion-related sources")
#ggplot(NEI2, aes(x = factor(year), y = Emissions/1000, fill =type)) +
# geom_line() +

print(gg)

dev.off()

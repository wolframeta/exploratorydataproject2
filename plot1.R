NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

k <- aggregate(NEI$Emissions, by = list(NEI$year), FUN = sum)

jpeg('plot1.jpeg')
barplot(k$x,names.arg = c('1999','2002','2005','2008'), xlab = 'Year', ylab = 'PM2.5 Emission', axis.lty = 1, main = 'PM2.5 Emission from all Sources')
dev.off()

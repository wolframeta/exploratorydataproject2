NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltidata <- subset.data.frame(NEI, NEI$fips == '24510')

k <- aggregate(baltidata$Emissions, by = list(baltidata$year), FUN = sum)

jpeg('plot2.jpeg')
barplot(k$x,names.arg = c('1999','2002','2005','2008'), xlab = 'Year', ylab = 'PM2.5 Emission', axis.lty = 1, main = 'PM2.5 Emission from Baltimore Sources')
dev.off()
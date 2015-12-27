NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC2 <- SCC[grep("comb", SCC$EI.Sector, ignore.case = TRUE),]
SCC3 <- SCC2[grep("coal", SCC$EI.Sector, ignore.case = TRUE),]

k <- SCC3$SCC

NEI2 <- NEI[NEI$SCC %in% k,]

m <- aggregate(NEI2$Emissions, by = list(NEI2$year), FUN = sum)

jpeg('plot4.jpeg')
barplot(m$x ,names.arg = c('1999','2002','2005','2008'), xlab = 'Year', ylab = 'PM2.5 Emission', axis.lty = 1, main = 'PM2.5 Emission from Coal based Combustion')
dev.off()
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC2 <- SCC[grep("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE),]
k <- SCC2$SCC

NEI2 <- NEI[NEI$SCC %in% k,]

NEI3 <- NEI2[NEI2$fips==24510,]
m <- aggregate(NEI3$Emissions, by = list(NEI3$year), FUN = sum)

jpeg('plot5.jpeg')
barplot(m$x ,names.arg = c('1999','2002','2005','2008'), xlab = 'Year', ylab = 'PM2.5 Emission', axis.lty = 1, main = 'PM2.5 Emission from Motor Vehicles')
dev.off()

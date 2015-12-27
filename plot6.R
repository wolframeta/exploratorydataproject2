NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC2 <- SCC[grep("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE),]
k <- SCC2$SCC

NEI2 <- NEI[NEI$SCC %in% k,]

NEI3 <- NEI2[NEI2$fips== '24510' | NEI2$fips== '06037',]


jpeg('plot6.jpeg')
ggplot(NEI3, aes(x = factor(year), y = Emissions, fill = fips)) + geom_bar(aes(fill = fips), stat = 'identity') + facet_grid(.~fips) + labs(x="Year", y = 'PM2.5 Emission', title = 'PM2.5 Emission - Baltimore(24510) vs. LA County(06037)')
dev.off()


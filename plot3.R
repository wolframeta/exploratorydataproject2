NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltidata <- subset.data.frame(NEI, NEI$fips == '24510')

install.packages("ggplot2")
library(ggplot2)

jpeg('plot3.jpeg')
ggplot(baltidata, aes(factor(year), Emissions, fill = type))+geom_bar(stat = 'identity')+facet_grid(.~type,scales = "free",space="free")+labs(x="Year", y = 'PM2.5 Emission', title = 'PM2.5 Emission from Baltimore Sources -by Type')
dev.off()
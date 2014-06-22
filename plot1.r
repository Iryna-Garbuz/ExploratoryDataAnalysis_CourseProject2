## 1.  Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##Using the base plotting system, make a plot showing the total PM2.5 emission from all 
##sources for each of the years 1999, 2002, 2005, and 2008.

TotalEmissionByYear <- aggregate(NEI$Emissions, by = list(NEI$year), FUN = sum)

names(TotalEmissionByYear) <- c("Year", "Total Emissions")

## Create a plot
png("plot1.png", 680, 480)
plot(TotalEmissionByYear, main = "Total emissions from PM2.5 in the United States from 1999 to 2008",
     type = "b", col.axis = "black", col = "blue")
dev.off()

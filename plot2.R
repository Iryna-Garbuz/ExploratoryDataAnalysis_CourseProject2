## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

##NEI.Maryland <- NEI[NEI$fips == 24510,]

TotalEmissionByYear.Maryland <- aggregate(Emissions ~ year, NEI.Maryland, FUN = sum)


names(TotalEmissionByYear.Maryland) <- c("Year", "Total Emissions")

## Create a plot
png("plot2.png", 680, 480)
plot(TotalEmissionByYear.Maryland, main = "Total emissions from PM2.5 in the Baltimore City, Maryland from 1999 to 2008",
     type = "b", col.axis = "black", col = "blue")
dev.off()

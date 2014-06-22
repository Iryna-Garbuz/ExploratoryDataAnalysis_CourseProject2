## 6. Compare emissions from motor vehicle sources in Baltimore City with emissions 
## from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?

# Coal-related SCC
motor = SCC[grepl("motor", SCC$Short.Name, ignore.case=TRUE),]

# Merge two data sets
merge <- merge(x=NEI, y=motor, by='SCC')

##for Maryland
merge.Maryland <- merge[merge$fips == "24510", ]
merge.sumMaryland <- aggregate(Emissions ~ year, merge.Maryland, sum)
colnames(merge.sumMaryland) <- c('Year', 'Emissions')
merge.sumMaryland$City <- paste(rep('MD', 4))

##for California
merge.California <- merge[merge$fips == "06037", ]
merge.sumCalifornia <- aggregate(Emissions ~ year, merge.California, sum)
colnames(merge.sumCalifornia) <- c('Year', 'Emissions')
merge.sumCalifornia$City <- paste(rep('CA', 4))

## Merge all data into one dataframe
CityDF<- as.data.frame(rbind(merge.sumCalifornia, merge.sumMaryland))
CityDF$Year <- factor(CityDF$Year, levels=c('1999', '2002', '2005', '2008'))
## Create a plot

g <- ggplot(data=CityDF, aes(x=Year, y=Emissions, fill = City)) 
g + geom_bar(stat="identity", fill= "green", colour="darkgreen", position = "dodge")  + 
  ggtitle("Total Emissions of Motor Vehicle Sources \n in Baltimore City, Maryland and in Los Angeles County, California") +
  facet_grid(.~City, scales = "free") + 
  
  geom_text(aes(label=round(Emissions,3), size=1, hjust=0.5, vjust=2))


ggsave("plot6.png", width = 7, height = 5)
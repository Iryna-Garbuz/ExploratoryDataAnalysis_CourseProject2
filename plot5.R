## 5. How have emissions from motor vehicle sources changed from 1999???2008 in Baltimore City?

# Coal-related SCC
motor = SCC[grepl("motor", SCC$Short.Name, ignore.case=TRUE),]

# Merge two data sets
merge <- merge(x=NEI, y=motor, by='SCC')
merge.Maryland <- merge[merge$fips == 24510, ]

merge.sum <- aggregate(Emissions ~ year, merge.Maryland, sum)
colnames(merge.sum) <- c('Year', 'Emissions')

## Create a plot

g <- ggplot(data=merge.sum, aes(x=Year, y=Emissions)) 
  g + geom_bar(stat="identity", fill="green", colour="darkgreen")  + 
  ggtitle("Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland") +
  geom_text(aes(label=round(Emissions,3), size=1, hjust=0.5, vjust=2))


ggsave("plot5.png", width = 7, height = 5)
## 4. Across the United States, how have emissions from coal combustion-related sources 
## changed from 1999???2008?

# Coal-related SCC
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

# Merge two data sets
merge <- merge(x=NEI, y=SCC.coal, by='SCC')
merge.sum <- aggregate(Emissions ~ year, merge, sum)
colnames(merge.sum) <- c('Year', 'Emissions')


## Create a plot
png("plot4.png", 680, 480)
plot(merge.sum, main = "Total emissions from coal combustion-related sources from 1999 to 2008",
     type = "b", col.axis = "black", col = "blue")
dev.off()
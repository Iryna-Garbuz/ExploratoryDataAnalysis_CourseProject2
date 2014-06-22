## 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
## variable, which of these four sources have seen decreases in emissions from 1999???2008 
## for Baltimore City? Which have seen increases in emissions from 1999???2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

TotalEmissionByYear.MarylandByType <- aggregate(Emissions ~ year + type, NEI.Maryland, FUN = sum)
TotalEmissionByYear.MarylandByType$year <- factor(TotalEmissionByYear.MarylandByType$year, levels=c('1999', '2002', '2005', '2008'))
## Create a plot
library (ggplot2)

g <- ggplot(data = TotalEmissionByYear.MarylandByType, aes(x = year, y = Emissions)) 
  plot3 <- g + facet_grid(.~type) + guides(fill=F) +
  geom_point() +
  ylab('Emissions') + xlab('Year') + 
  ggtitle('Emissions per Type in Baltimore City, Maryland') 

ggsave("plot3.png", width = 10, height = 5)

     
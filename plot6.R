library(tidyverse)
library(dplyr)
library(ggplot2)
library(stringr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)
##Question 6: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle
##sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips == "06037").
##Which city has seen greater changes over time in motor vehicle emissions?

data6 <- NEI %>% filter(SCC %in% SCC_motor & fips %in% c('24510', '06037')) %>% 
      group_by(year, fips) %>% 
      summarize(total=sum(Emissions)) %>%
      mutate(City= ifelse(fips=='06037', 'Los Angeles', 'Baltimore'))

png(filename="plot6.png", width=480, height=480, units="px")
data6 %>% ggplot(aes(year, total, col=City)) +
      geom_point() + 
      geom_line() +
      scale_x_continuous(breaks = seq(1999, 2008, 3)) +
      xlab('year') + ylab('total') + ggtitle('Question 6')
dev.off()

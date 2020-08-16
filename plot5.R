library(tidyverse)
library(dplyr)
library(ggplot2)
library(stringr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)
## Question 5 : How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
SCC$SCC.Level.Three <- as.character(SCC$SCC.Level.Three)
index_motor <- which(str_detect(SCC$SCC.Level.Three, 'Motorcycle'))
SCC_motor <- SCC[index_motor,]$SCC
data5 <- NEI %>% filter(SCC %in% SCC_motor & fips == '24510') %>%
      group_by(year) %>% 
      summarize(total=sum(Emissions))

png(filename="plot5.png", width=480, height=480, units="px")
data5 %>% ggplot(aes(year, total)) +
      geom_point() +
      geom_line(col='blue') +
      scale_x_continuous(breaks = seq(1999, 2008, 3)) +
      xlab('year') + ylab('total') + ggtitle('Question 5')
dev.off()
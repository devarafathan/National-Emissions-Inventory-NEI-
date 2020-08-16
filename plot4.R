library(tidyverse)
library(dplyr)
library(ggplot2)
library(stringr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)
## Question 4: Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
str(SCC)
SCC$EI.Sector <- as.character(SCC$EI.Sector)
png(filename="plot4.png", width=480, height=480, units="px")
index_SCC <- which(str_detect(SCC$EI.Sector, 'Coal'))
SCC_coal<- SCC[index_SCC, ]$SCC
SCC_coal
data4 <- NEI %>% filter(SCC %in% SCC_coal) %>%  
      group_by(year) %>% 
      summarize(sum_each_all= sum(Emissions))

data4 %>% ggplot(aes(year, sum_each_all)) +
      geom_point() +
      geom_line(col='blue') +
      scale_x_continuous(breaks = seq(1999, 2008, 3)) +
      xlab('year') + ylab('sum each year') + ggtitle('Question 4')
dev.off()
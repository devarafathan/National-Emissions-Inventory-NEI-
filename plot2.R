library(tidyverse)
library(dplyr)
library(ggplot2)
library(stringr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)
## Question 2:Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510")
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

png(filename="plot2.png", width=480, height=480, units="px")
data2 <- NEI %>% filter(fips == '24510') %>%
      group_by(year) %>%
      summarize(sum_each_year = sum(Emissions))

data2 %>% ggplot(aes(year, sum_each_year)) +
      geom_line(col='red') + 
      geom_point() +
      scale_x_continuous(breaks = seq(1999, 2008, 3)) +
      xlab('year') + ylab('sum each year') + ggtitle('Question 3')
dev.off()
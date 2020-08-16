library(tidyverse)
library(dplyr)
library(ggplot2)
library(stringr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)
## Question 3: Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable,
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008?
## Use the ggplot2 plotting system to make a plot answer this question.

png(filename="plot3.png", width=480, height=480, units="px")
data3 <- NEI %>% filter(fips == '24510') %>%
      group_by(year, type) %>% 
      summarize(sum= sum(Emissions))

data3 %>% ggplot(aes(year, sum)) +
      geom_point() + geom_line(col='blue') + 
      scale_x_continuous(breaks = seq(1999, 2008, 3)) +
      facet_wrap(.~type) 
dev.off()
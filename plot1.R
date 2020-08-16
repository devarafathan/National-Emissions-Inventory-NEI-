library(tidyverse)
library(dplyr)
library(ggplot2)
library(stringr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)

##Question 1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
##make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

png(filename="plot1.png", width=480, height=480, units="px")
data1 <- NEI %>% group_by(year) %>% summarize(sum_each_year = sum(Emissions))
plot(data1$year, data1$sum_each_year,type='b' , xlim = c(1999,2008), pch=19, xlab = 'Year', ylab='Sum For Each Year', main = 'Question 1')
dev.off()















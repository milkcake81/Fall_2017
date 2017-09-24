setwd("C:\\Users\\soh1\\Box Sync\\CUNY\\Fall_2017\\Data 607\\Week5")
AirlineRaw <- read.csv("AirlineTime.csv")

library(tidyr)
library(dplyr)
library(tidyselect)

AirlineTrans <- AirlineRaw %>%
  gather(City, Frequency, 3:7) %>%
  spread(Time, Frequency)

AirlineSum <- AirlineTrans %>%
  group_by(Airplane) %>%
  summarise(TotalDelay = sum(delayed))

library(ggplot2)

ggplot(AirlineTrans) + aes(City,delayed, fill=Airplane) + geom_bar(stat="identity", position=position_dodge())

ggplot(AirlineSum) + aes(Airplane,TotalDelay) + geom_bar(stat="identity", position=position_dodge())

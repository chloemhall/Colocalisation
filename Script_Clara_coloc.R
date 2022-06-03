#For Clara cellprofiler script
library(tidyverse)
#first load the cellprofiler file
setwd("\\\\fs02/hallchlo$/Dokumente/R")
test.data<- read.table("coloc_test1.txt", header=TRUE)

#eventually will want to split table by image number.. 
#for now though:
#Per parent (TdTomato), is Object Number (VIP) > 0 ? 
test.data$TdTomato_only<- ifelse(test.data$Children_VIP_01_Count>0, "colocalised", "alone")


#calculate proportion 
percentage.colocalisation <- test.data %>%
  group_by(TdTomato_only) %>%
  summarise(cnt = n()) %>%
  mutate(freq = round(cnt / sum(cnt), 3))%>%
  mutate(percent = (freq*100))
#view table
head(percentage.colocalisation)

#Set filepaths
POSGRADanalyticlocation<-here::here("derived_data/POSGRADdata_merge_analytic.csv")

#Read in data
POSGRADanalytic<-read.csv(POSGRADanalyticlocation,header = TRUE)

library(ggplot2)
library(dplyr)
library(knitr)

#Composite (Verbal, Perceptive, Quantitative)
figure_composite<- ggplot(POSGRADanalytic,aes(x=VPC))+
  geom_histogram(bins=50, fill="#69b3a2", color="#69b3a2")+
  ggtitle("Distribution of McCarthy Composite Scores")+
  xlab("McCarthy Composite Score")

saveRDS(figure_composite,here::here("output/figure_composite.rds"))


#Set filepaths
POSGRADanalyticlocation<-here::here("derived_data/POSGRADdata_merge_analytic.csv")

#Read in data
POSGRADanalytic<-read.csv(POSGRADanalyticlocation,header = TRUE)

#Examine Allele Frequencies by SNP
library(ggplot2)
library(knitr)
library(dplyr)

#rs174602
figure_174602<- ggplot(data=POSGRADanalytic,aes(x=rs174602_o_num))+
  geom_bar(aes(factor(rs174602_o_num)))+
  scale_x_discrete(name="SNP rs174602", labels=c("0"="Homozygote Major","1"= "Heterozygote Major","2"="Homozygote Minor"))+
  ggtitle("FADS 2 SNP rs174602 Allele Frequency ")

saveRDS(figure_174602,here::here("output/figure_174602.rds"))

#rs1535
figure_1535<- ggplot(data=POSGRADanalytic,aes(x=rs1535_o_num))+
  geom_bar(aes(factor(rs1535_o_num)))+
  scale_x_discrete(name="SNP rs1535", labels=c("0"="Homozygote Major","1"= "Heterozygote Major","2"="Homozygote Minor"))+
  ggtitle("FADS 2 SNP rs1535 Allele Frequency ")

saveRDS(figure_1535,here::here("output/figure_1535.rds"))

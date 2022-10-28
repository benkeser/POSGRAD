library(dplyr)
library(ggplot2)

#Setting filepaths
offspringfadslocation<-here::here("raw_data/posgrad_offspring_cleaned_genetic_data.csv")
cognitivelocation<-here::here("raw_data/ja.csv")
breastfeedinglocation<-here::here("raw_data/breastfeeding.csv")
SESHomelocation<-here::here("raw_data/Ses_home.csv")

#Reading in data
offspringfadsdata<-read.csv(offspringfadslocation,header = TRUE)
cognitivedata<-read.csv(cognitivelocation,header=TRUE)
breastfeedingdata<-read.csv(breastfeedinglocation, header=TRUE)
SESHOMEdata<-read.csv(SESHomelocation,header=TRUE)

#Checking variable types
class(offspringfadsdata$folio)
class(cognitivedata$folio)
class(breastfeedingdata$foliof)
class(SESHOMEdata$folio_mom)

#Change folio to integer in offspringfadsdata and check
offspringfadsdata$folio<- as.integer(as.character(offspringfadsdata$folio))

class(offspringfadsdata$folio)

#Merge data
builddata1<- merge(cognitivedata,offspringfadsdata,by = "folio", all.x = TRUE)

builddata2<-merge(builddata1,breastfeedingdata, by.x = "folio", by.y = "foliof", all.x = TRUE)

builddata3 <-merge(builddata2,SESHOMEdata, by.x = "folior", by.y = "folio_mom", all.x = TRUE)

POSGRADdata_merge<-builddata3


#Create analytic sample
POSGRADdata_merge$analytic= ifelse(POSGRADdata_merge$VPC>=0 & POSGRADdata_merge$rs174602_o_num>=0,1,0)

#We have genetic data for 621 children
table(POSGRADdata_merge$rs174602_o_num>=0)

#Of those 621, 125 are missing VPC score data (621-496), but I do not know how to cross check this because the 
POSGRADdata_merge$havers174602=ifelse(POSGRADdata_merge$rs174602_o_num>=0,1,0)
POSGRADdata_merge$haveVPC=ifelse(POSGRADdata_merge$VPC>=0,1,0)

#Missing sample has 195, not quite right
missingsample <- subset(POSGRADdata_merge, is.na(POSGRADdata_merge$rs174602_o_num) & is.na(POSGRADdata_merge$VPC))

#Analytic sample is 496. Need to fix the fact that "Analytic" variable is currently coded as 1,NA rather than 1,0.

#Analytic data only
POSGRADdata_merge_analytic<-subset(POSGRADdata_merge, analytic==1)

#Save POSGRAD Merged data as CSV
write.csv(POSGRADdata_merge,file=here::here("derived_data/POSGRADdata_merge.csv"))

#Save POSGRAD Analytic data as CSV
write.csv(POSGRADdata_merge_analytic,file=here::here("derived_data/POSGRADdata_merge_analytic.csv"))


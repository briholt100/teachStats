library(tidyr)
library(dplyr)
#setwd("U:\\Documents\\My Data Sources\\classroom stuff")

data<-read.csv(file= './programReview.csv')
#data<-read.csv(file= './Full Student Demographic Variables By Academic Year And Quart.csv')

#data<-colnames(c("group", 'variable',))

data<-data[,1:14] #drops percentages columns
data[2:7,]
str(data)
colnames(data)<-c("type","factor",c(rep(paste0("x1415",seq(1:4)))),c(rep(paste0("x1516",seq(1:4)))),c(rep(paste0("x1617",seq(1:4)))))

ignore<-c("year","Gender","Ethnicity","Disability","Full/Part Time","Family Status",
"Work Status","Student Intent","Prior Education","International Contract","Running Start","Veteran Benefit")
df<-data %>%filter(!(factor %in% ignore)) %>%  
  gather(key=year,value=count,-type,-factor) 

df[,4]<-sub(',','',df[,4])

df[,4]<-as.numeric(df[,4])

df<-df%>% 
  extract(year, c('year','quarter'),"(x1.1.)([1-4])")#gender

head(df)
df$quarter<-as.numeric(df$quarter)

gender<-df %>% filter(factor=="Female" | factor=="Male"| factor=="(blank)")
gender %>% group_by(year,type,factor) %>% summarize(total=sum(count,na.rm=T)) %>% mutate(freq=total/sum(total))
gender %>% na.omit() %>% unite(year,year,quarter) %>% group_by(year,type,factor) %>% spread(year,count)

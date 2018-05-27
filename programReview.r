library(tidyr)
library(dplyr)
#setwd("U:\\Documents\\My Data Sources\\classroom stuff")

data<-read.csv(file= './programReview.csv')
#data<-read.csv(file= './Full Student Demographic Variables By Academic Year And Quart.csv')

#data<-colnames(c("group", 'variable',))

data<-data[,1:14] #drops percentages columns

ratio<-tail(data,11)
colnames(ratio)<-c("type","class",c(rep(paste0("x1415",seq(1:4)))),c(rep(paste0("x1516",seq(1:4)))),c(rep(paste0("x1617",seq(1:4)))))
ratio[,3:length(ratio)]<-  apply(ratio[,3:length(ratio)],2,function(x) as.numeric(x))
ratio[ratio==0.0]<-NA
apply(ratio[,3:length(ratio)],1,mean,na.rm=T)
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
mytable<-gender %>% na.omit() %>% unite(year,year,quarter) %>% mutate(i=row_number()) %>% spread(year,count)

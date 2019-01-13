count<-c(50,300,250,400,550,450,250,350,100)
length(sample(0:1e4,50))

cats<-c("0-10
11-21
22-32
33-43
44-54
55-65
66-76
77-87
88+")
cats<-unlist(strsplit(cats,"\n"))
df<-data.frame(cbind(cats,count),stringsAsFactors=F)
df[,2]<-as.numeric(df[,2])
sum(df[,2])

l<-(strsplit(df[,1],"-"))
(l[-9])
data<-data.frame(from=numeric(),to=numeric())
for(i in 1:8){
  from<-as.numeric(l[[i]][1])*1000
  to<-as.numeric(l[[i]][2])*1000
  print(cbind(from,to))
  data[i,]<-cbind(from,to)
}
data[9,]<-cbind(88000,1e8)

data
salary<-vector("list",length(count))
for(i in 1:length(count)){
  salary[[i]]<-sample(data[i,1]:data[i,2],count[i])
  }
salary

salaryBag<-as.numeric(unlist(salary))
sb<-salaryBag/1000
b<-seq(0,99000,1e4)
hist(salaryBag[salaryBag<1e5],breaks = b)
range(sb[sb<1e5])

library(ggplot2)
library(dplyr)
dfSal<- as.data.frame(salaryBag)
dfSal %>% 
  filter(salaryBag<1e5) %>% 
  ggplot(aes(salaryBag))+
  geom_histogram(binwidth = 1e4,col = "black", fill = "lightgoldenrod2")

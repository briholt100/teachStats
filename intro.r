library(ggplot2)
library(dplyr)

#### code 1.1 reproduce google doc histogram with sampling 
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

## code 1.2  clean from categories '-'
l<-(strsplit(df[,1],"-"))
(l[-9])
##code 1.3 make data frame
data<-data.frame(from=numeric(),to=numeric())
for(i in 1:8){
  from<-as.numeric(l[[i]][1])*1000
  to<-as.numeric(l[[i]][2])*1000
  print(cbind(from,to))
  data[i,]<-cbind(from,to)
}
data[9,]<-cbind(88000,1e8)

data

## code 1.4 create a vector of salaries
salary<-vector("list",length(count))
for(i in 1:length(count)){
  salary[[i]]<-sample(data[i,1]:data[i,2],count[i])
  }
salary

salaryBag<-as.numeric(unlist(salary))
sb<-salaryBag/1000
## code 1.5 make histogram of salary

b<-seq(0,99000,1e4)
hist(salaryBag[salaryBag<1e5],breaks = b,freq=F)

lines(density(salaryBag[salaryBag<1e5]))
quantile(salaryBag[salaryBag<1e5])

## code 1.5a make histogram using ggplot and dpylr
dfSal<- as.data.frame(salaryBag)
dfSal %>% 
  filter(salaryBag<1e5) %>% 
  ggplot(aes(salaryBag))+
  geom_histogram(binwidth = 1e4,col = "black", fill = "lightgoldenrod2")


######Understanding mean and median and mode
##code 1.6
#generate small set of data
make_sample<-function(n=5,range=1:10,mean,st.dev){
  small.sample<-sample(range,n,replace = T)
  return(small.sample)
}
set.seed(1)
small.sample<-make_sample()  #make a sample of 5 between 1:10
n<-length(small.sample)  #confirm n
small.sum<-sum(small.sample) #calc sum
small.sum/n   #calc mean
mean(small.sample) #confirm mean
sort(small.sample) #rank the items
median(small.sample) # confirm median



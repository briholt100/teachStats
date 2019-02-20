library(dplyr)
exp<-list(5,5)
obs<-list(2,8)
dbinom(2,10,.5)  #this analytically calculates the probability
mean(rbinom(1000,10,.3)==2)
out<-as.integer()
for (i in 1:length(obs)){
  
  out[i]<-(as.numeric(obs[i])-as.numeric(exp[i]))^2  #squaring the differences
  #print(out[i])
}
thresh<-sum(out)  #sum of squares


simulations<-10000
trial_length<-10
tally<-matrix(ncol=3,nrow=2)
tally<-as.data.frame(tally)
names(tally)<-c('heads','tails','average')
for(i in 1:simulations){
  trial<-rbinom(trial_length,1,.5)
  #print(trial)
  average<-mean(trial)
  h<-sum(trial)
  t<-trial_length-h
  #print(i)
  #print(h)
  #print(t)
  tally[i,]<-(cbind(h,t,average))
  
}

tail(tally)
pvalue<-length(tally$heads[tally$heads<=3])/nrow(tally)




hist(tally$average)
abline(v=pvalue,col='blue')

#must count how many breech threshold

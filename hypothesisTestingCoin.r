library(dplyr)
exp<-list(5,5)
obs<-list(3,7)
out<-as.integer()
for (i in 1:length(obs)){
  
  out[i]<-(as.numeric(obs[i])-as.numeric(exp[i]))^2
  
}
thresh<-sum(out)


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




plot(density(tally$average))
abline(v=pvalue,col='blue')



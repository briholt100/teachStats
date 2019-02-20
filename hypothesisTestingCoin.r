exp<-list(5,5)
obs<-list(3,7)
out<-as.integer()
for (i in 1:length(obs)){
  
  out[i]<-(as.numeric(obs[i])-as.numeric(exp[i]))^2
  
}
thresh<-sum(out)


simulations<-1000
trial_length<-10
tally<-matrix(ncol=2,nrow=2)
tally<-as.data.frame(tally)
names(tally)<-c('heads','tails')
for(i in 1:simulations){
  trial<-rbinom(trial_length,1,.5)
  #print(trial)
  h<-sum(trial)
  t<-trial_length-h
  #print(i)
  #print(h)
  #print(t)
  tally[i,]<-(cbind(h,t))
  
}

tail(tally)


#must count how many breech threshold

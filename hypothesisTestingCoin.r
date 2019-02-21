#the following function creates a df of coin tosses of various trials
coin_toss<-function(sample_size=3,trial_length=10){
  
  tally_df<-matrix(ncol=3,nrow=sample_size)
  tally_df<-as.data.frame(tally_df)
  names(tally_df)<-c('heads','tails','average')
  
    for(i in 1:sample_size){
      trial<-rbinom(trial_length,1,.5)
      #print(trial)
      average<-mean(trial)
      h<-sum(trial)
      t<-trial_length-h
      #print(i)
      #print(h)
      #print(t)
      tally_df[i,]<-(cbind(h,t,average))
    }
  return(tally_df)  
}

coin_toss()

#using coin_toss(), simulate many samples and create a vector of probabilities of 'heads'=3
simulate_coin_toss<-function(sims=5,sample_size=3,trial_length=10,heads=3){
  
  pvalue_df<-vector(length=sims)
  
  for (j in 1:sims){ 
    tally_df<-coin_toss(sample_size = sample_size,trial_length = trial_length)
      pvalue_df[j]<-length(tally_df$heads[tally_df$heads<=heads])/nrow(tally_df)

  }
  return(pvalue_df)
}

pvalue_vec<-simulate_coin_toss(sims=1000,sample_size=100,trial_length=10,heads=5)
mean(pvalue_vec) #calculates average cumulative probablity of a given number of heads/trials
hist(pvalue_vec)
abline(v=mean(pvalue_vec),col='blue')
abline(v=pbinom(5,10,.5),col='red',lty=3) #plots verticle line of exact cumulative  prob of heads/trials



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

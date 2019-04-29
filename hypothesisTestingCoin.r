#the following function creates a df of coin tosses of various trials
coin_toss<-function(sample_size=3,trial_length=10, p=.5){
  
  tally_df<-matrix(ncol=4,nrow=sample_size)
  tally_df<-as.data.frame(tally_df)
  names(tally_df)<-c('heads','tails','difference','average')
  
    for(i in 1:sample_size){
      #trial<-rbinom(trial_length,1,p)
      trial<-sample(0:1,10,.5)
      #print(trial)
      average<-mean(trial)
      h<-sum(trial)
      t<-trial_length-h
      diff<-(h-t)
      #print(i)
      #print(h)
      #print(t)
      tally_df[i,]<-(cbind(h,t,diff,average))
    }
  return(tally_df)  
}

tally_df<-coin_toss(100,100,.5)
tally_df
head(tally_df)
##assuming a probability that the coin is fair, (.5), here is the average difference of all those coin differences from that average.
mean(tally_df[,3])
plot(density(tally_df[,3]))
lines(density(tally_df[,3]),col='blue')
#using coin_toss(), simulate many samples and create a vector of probabilities of 'heads'=3
simulate_coin_toss<-function(sims=5,
                             sample_size=3,
                             trial_length=10,
                             heads=3,
                             p=.5){
  
  #pvalue_df<-vector(length=sims)
  pvalue_df<-as.data.frame(matrix(nrow=sims,ncol=2))
  names(pvalue_df)<-c('pvalue','success_count')
  for (j in 1:sims){ 
    tally_df<-coin_toss(sample_size = sample_size,trial_length = trial_length, p)
    print(tally_df[j,])
    cat(paste('\r\nnum of rows in tally_df: ',nrow(tally_df)," \r\n"))
    cat(paste('\r\nnum of times we found ',
              tally_df$heads[tally_df$heads<=heads],
              " heads or fewer \r\n\r\n"))
    pvalue_df[j,1]<-length(tally_df$heads[tally_df$heads<=heads])/nrow(tally_df)
    pvalue_df[j,2]<-length(tally_df$heads[tally_df$heads<=heads])

    print(pvalue_df[j,1:2])
  }
  return(pvalue_df)
}
heads=3
simulate_coin_toss(sims=2,sample_size=1,trial_length=10,heads=heads)
pvalue_df<-simulate_coin_toss(sims=100,sample_size=100,trial_length=10,heads=heads)
mean(pvalue_df$pvalue) #calculates average cumulative probablity of a given number of heads/trials
hist(pvalue_df$pvalue,freq=F)
abline(v=mean(pvalue_df$pvalue),col='blue')
abline(v=pbinom(heads,10,.5),col='red',lty=3) #plots verticle line of exact cumulative  prob of heads/trials

1*(1-pbinom(17,25,.5)) #this computes one tailed test
binom.test(x=c(18,7),p=.5,alternative = ("l")) #here c(18,7) refelct success and failures, 'l' is less for one tailed
binom.test(x=3,n=10,p=.5,alternative = c("l")) #here x=3,n=10 reflect success and trials, 'l' is less for one tailed


# You can run coin_toss with 1000 sim to get a normal distribution of flips.  Plot abline with .05 or .025 for two tailed to see where 
#1-pbinom(heads-1,10,.5) falls in terms of significance.

#so, my simulation of simulate_coint_toss will estimate how often 3/10 heads shows up
# and then you count the ways heads was 3 or less divide by total number of coin tosses.
#that is the p-value for a one tailed test. 

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

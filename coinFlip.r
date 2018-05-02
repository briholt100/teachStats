
rbinom(10,10,.5) # 10 is the number of observations while '1' is the number of trials. So, if this were 10 as well, there would a sum of 'successes' that were less than 10
dbinom(3,10,.5)  # this determines the density,  aka probability of exact outcome, so x= 3 heads out of 10, is not the cumulative 0-3 but exactly 3 for example. for cumulative, use pbinom, or sum dbinom:
sum(dbinom(3,10,.5),dbinom(2,10,.5),dbinom(1,10,.5),dbinom(0,10,.5))
pbinom(3,10,.5)




#coin_flip() does the flipping, two styles, by thumb is standard

coin_flip<-function(type = .5, bias = .1){
  rbinom(1,1,type+bias)
}
mean(replicate(100,coin_flip()))

#coin will be either unbiased or biased.  

Bag_of_coins<- c(rep(.5,9),.6) #lists 9 fair coins, one biased coin at .6
sample<-sample(Bag_of_coins,5,replace = F) #picks 5 coins randomly from bag
coin_flip(type=sample,bias=0)


#expected value
x<-c(1,2,3,4,5,6) # single dice
probability<-(c(rep(1/7,5),.2857143)) #probabilty that the dice is loaded for 6
  hist(replicate(1000,sample(x,1,replace = T,prob=probability)))
  

  x<-c(0,1) # single coin, 0=Tails
  probability<-c(.5,.5) #probabilty that the coin is fair = .5
  mean(replicate(1000,sample(x,1,replace = T,prob=probability)))
  

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
  

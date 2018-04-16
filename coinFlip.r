#coin_flip() does the flipping, two styles, by thumb is standard

coin_flip<-function(type = .5, bias = .1){
  rbinom(1,1,type+bias) #may need an apply function to apply this to a vector
}
mean(replicate(100,coin_flip()))

#coin will be either unbiased or biased.  

Bag_of_coins<- c(rep(.5,9),.6) #lists 9 fair coins, one biased coin at .6
sample<-sample(Bag_of_coins,5,replace = F) #picks 5 coins randomly from bag
coin_flip(type=sample,bias=0)





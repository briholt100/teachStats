#coin will be either unbiased or biased.  
Bag_of_coins<- c(rep(.5,30),rep(.6,70)) #lists fair coins, and  biased coins at .6

#coin_flip() does the flipping, two styles, by thumb is standard
coin_flip<-function(type = .5, bias = .1){
    rbinom(type,1,type+bias) #may need an apply function to apply this to a vector
  
}

coin_flip()


sample<-sample(Bag_of_coins,5,replace = T) #picks 5 coins randomly from bag_of_coins

mean(replicate(100,mean(coin_flip(type=sample,bias=0))))





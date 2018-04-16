#coin_flip() does the flipping, two styles, by thumb is standard

coin_flip<-function(type = .5, bias = .1){
  rbinom(1,1,type+bias)
}
mean(replicate(10,coin_flip()))

#coin will be either unbiased or biased.  







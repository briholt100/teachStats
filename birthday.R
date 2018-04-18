B<-100
n<-5
B<-10^seq(1,5,len=100)
comp<-function(B,n=22){#22 is the number of people in group..how may have same?  
  results<-replicate(B,{
    bdays<-sample(1:365,n,replace = T)
    any(duplicated(bdays))
    })
    mean(results)
        }
out<-(sapply(B,comp))
plot(log10(B),out,type="l")

n<-seq(1,60)
plot(n,sapply(n,comp))

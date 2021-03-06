A<-c(32,20,36,75,58)
B<-c(63,28,23,49,62)
C<-c(55,54,35,37,28)
trait<-as.data.frame(rbind(A,B,C))

colnames(trait)<-c("Open","Consc","Extr","Agre","Neuro")
yrng<-c(min(trait),max(trait))

par(mfrow=c(1,5))

for (i in 1:5){boxplot(trait[,i],ylim=yrng,main=dimnames(trait)[[2]][i],xlab=paste(round(mean(trait[,i]),2), "is avg"))
               for (j in 1:nrow(trait)){
                points(trait[j,i],col=j,pch=19)
                text(.65,trait[j,i],dimnames(trait)[[1]][j],cex=3,col=j)
                abline(h=mean(trait[,i]),col="blue")
              }
}

summary(trait)
table(trait[1,])
aggregate(trait,by=list(trait[,1]),FUN=mean)
colMeans(trait)
apply(trait,2,mean)

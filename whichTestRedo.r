library(ggplot2,tidyverse)
library(googlesheets)


















clip<-readClipboard()
student<-readClipboard()
str(clip)
#split on tab character
clip<-(strsplit(clip,'\t'))
#convert list into matrix and transform character to num
df<-as.data.frame(t(sapply(clip,as.numeric)))
name.vec<-unlist(clip[1:1])
colnames(df)<-name.vec
colnames(df)<-(c('e1.40.37','e1q','e1MadeUp','60e1', 'e2.33.24','e2q','e2MadeUp','e2SA8','e2saMadeUp','e2Combo','60e2', 'e3.44.38','e3q','e3MadeUp','60e3'))
df<-df[2:37,]
str(df)
head(df)
cbind(apply(df[,c('e1MadeUp','e2Combo','e3MadeUp')],1,max))
df<-cbind(student,df)
rownames(df)<-student

head(df[,c('e1MadeUp','e2Combo','e3MadeUp','60e1','60e2','60e3')])
grid<-df[,c('e1MadeUp','e2Combo','e3MadeUp','60e1','60e2','60e3')]

for(i in 1:nrow(grid)){
    print(rownames(grid[i,]))
  print((sum(grid[i,1],grid[i,5],grid[i,6])-min(grid[i,1],grid[i,5],grid[i,6]))/2)
  print((sum(grid[i,2],grid[i,4],grid[i,6])-min(grid[i,2],grid[i,4],grid[i,6]))/2)
  print((sum(grid[i,3],grid[i,4],grid[i,5])-min(grid[i,3],grid[i,4],grid[i,5]))/2)
  print ('means follow')
  print(mean(c(grid[i,1],grid[i,5],grid[i,6])))
    print(mean(c(grid[i,2],grid[i,4],grid[i,6])))
    print(mean(c(grid[i,3],grid[i,4],grid[i,5])))
}



tail(grid)
which.test<-list()


for(i in 1:nrow(grid)){
  
  ll<-list(drop1 = (sum(grid[i,1],grid[i,5],grid[i,6])-min(grid[i,1],grid[i,5],grid[i,6]))/2, 
           drop2 =(sum(grid[i,2],grid[i,4],grid[i,6])-min(grid[i,2],grid[i,4],grid[i,6]))/2,
           drop3 =(sum(grid[i,3],grid[i,4],grid[i,5])-min(grid[i,3],grid[i,4],grid[i,5]))/2,
           mean1 = (mean(c(grid[i,1],grid[i,5],grid[i,6]))),
           mean2 = (mean(c(grid[i,2],grid[i,4],grid[i,6]))),
           mean3 = (mean(c(grid[i,3],grid[i,4],grid[i,5]))))
  print(i)
  which.test[[i]]<-ll
}
names(which.test)<-rownames(grid)
which.test["JAMES IESHA L"]

do.call(rbind.data.frame,which.test)


#https://stackoverflow.com/questions/26508519/how-to-add-elements-to-a-list-in-r-loop
#https://stackoverflow.com/questions/16602173/building-nested-lists-in-r

apply(grid,1,function(x) mean(c(x[1],x[1+4],x[1+5])))


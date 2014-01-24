#Test whether a clean exam (no erasures) predicts exam performance

df<-read.csv(file="cleanExamPredict.csv")
summary(df)
str(df)

table(df$group)

subset(df,group=="1c" | group=="2c", select = c(MC,SA))

df<-df[,1:4]
grouping<-0
df<-cbind(df, grouping)
df
df$grouping[grep("c",df$group)]<-1

tapply(df$MC,df$grouping,hist)
#hypothesis: that being coded as "1" will lead to a higher MC score
#Hypothesis: that being coded as "1" will lead to a higher SA score


t.test(df$MC~df$grouping,alternative = "less")
t.test(df$SA~df$grouping,alternative = "greater")

t.test(df$MC[df$grouping==1],df$MC[df$grouping==0],var.equal=T,mu=0)
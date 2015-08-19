library('ggplot2')
getwd()
df<-read.csv("./Final.txt",sep=",",na.strings="")
df<-data.frame(na.omit(df,row.names=NULL))
df$name<-factor(df$name)
df$quarter<-factor(df$quarter)
df$prenup<-factor(df$prenup)

plot (x=df$version, y = as.factor(df$prenup)
      , main = "proportion of responses\n y = yes to prenup, \nn = no"
      ,xlab ="A = Male asks for prenup,\nB = Female asks for prenup")

plot (x=as.factor(df$prenup), main = "count  of responses\n y = yes to prenup, \nn = no")

str(df)

summary(df)

gender<-table(df$prenup)
prenupGender<-table(df$prenup,df$gender)
genPrenupVer<-table(df$prenup,df$gender,df$version)


t.test(as.numeric(as.factor(df$prenup))~df$version)

plot1<-ggplot(data=df, aes(x=gender,fill=..x..>1))
plot1+coord_cartesian(ylim = c(0.9, 12))+geom_bar()+facet_wrap(~version,ncol=2)+labs(title='count of male and female',x="Gender",y = "Count")

plot2<-ggplot(data=df, aes(x=prenup,fill=c(1)))
plot2+stat_bin()+facet_wrap(~gender+version,ncol=4)+labs(title='count of male and female',x="Sign Prenup?",y = "Count")+guides(fill=FALSE)



##########3
#Below is for just the recent group.

summerdf<-read.csv("./Final.txt",sep=",",row.names=NULL,na.strings="")
summerdf<-data.frame(na.omit(summerdf,row.names=NULL))
summerdf$name<-factor(summerdf$name)
summerdf$quarter<-factor(summerdf$quarter)
summerdf$prenup<-as.character(summerdf$prenup)

plot (x=summerdf$version, y = as.factor(summerdf$prenup), main = "proportion of responses\n y = yes to prenup, \nn = no",xlab ="A = Male asks for prenup,\nB = Female asks for prenup")

plot (x=as.factor(summerdf$prenup), main = "count  of responses\n y = yes to prenup, \nn = no")

str(summerdf)

summary(summerdf)

gender<-table(summerdf$prenup)
prenupGender<-table(summerdf$prenup,summerdf$gender)
genPrenupVer<-table(summerdf$prenup,summerdf$gender,summerdf$version)


t.test(as.numeric(as.factor(summerdf$prenup))~summerdf$version)

plot1<-ggplot(data=summerdf, aes(x=gender,fill=..x..>1))
plot1+coord_cartesian(ylim = c(0.9, 12))+geom_bar()+facet_wrap(~version,ncol=2)+labs(title='count of male and female',x="Gender",y = "Count")

plot2<-ggplot(data=summerdf, aes(x=prenup,fill=c(1)))
plot2+stat_bin()+facet_wrap(~gender+version,ncol=4)+labs(title='count of male and female',x="Sign Prenup?",y = "Count")+guides(fill=FALSE)

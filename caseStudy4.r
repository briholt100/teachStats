library('ggplot2')
library('lubridate')
library('dplyr')
library('reshape2')

#campus
#df<-read.csv("I:\\My Data Sources\\classroom stuff\\Final.txt",sep=",",row.names = NULL,na.strings="")


getwd()
df<-read.csv("./teachstats/Final.txt",sep=",",row.names = NULL,na.strings="")
df<-data.frame(na.omit(df,row.names=NULL))
df$name<-factor(df$name)
#df$quarter<-factor(df$quarter)
df$prenup<-factor(df$prenup)

plot (x=as.factor(df$prenup), main = "count  of responses\n y = yes to prenup, \nn = no")

plot (x=df$version, y = as.factor(df$prenup)
      , main = "proportion of responses\n y = yes to prenup, \nn = no"
      ,xlab ="A = Male asks for prenup,\nB = Female asks for prenup")

str(df)

summary(df)

prenupVersiondf<-table(df$version,df$prenup)
genPrenupVerdf<-table(df$version,df$prenup,df$gender)
chisq.test(prenupVersiondf)
chisq.test(table(df$gender,df$prenup))
t.test(as.numeric(as.factor(df$prenup))~df$version)

plot1<-ggplot(data=df, aes(x=gender,fill=..x..>1))
plot1+coord_cartesian()+geom_bar()+facet_wrap(~version,ncol=2)+labs(title='count of male and female',x="Gender",y = "Count")+guides(fill=FALSE)

plot2<-ggplot(data=df, aes(x=prenup,fill=gender))
plot2+stat_count()+facet_wrap(~gender+version,ncol=4)+labs(title='count of male and female',x="Sign Prenup?",y = "Count")+guides(fill=FALSE)


#the following pulls the 3rd number from code in quarter to create month of start
for (i in 1:nrow(df)) {
  if (substr(df$quarter[i],3,3) == '1') {df$term[i]<-6}
  else if (substr(df$quarter[i],3,3) == '2') {df$term[i]<-9}
  else if (substr(df$quarter[i],3,3) == '3') {df$term[i]<-1}
  else if (substr(df$quarter[i],3,3) == '4') {df$term[i]<-4}
}
df$term<-as.integer(df$term)
##Below, this tests the course's actualy year, eg, 673 means 3rd term (winter) of 2006-7 year, which is actually in 2007.
for (i in 1:nrow(df)) {
  if (substr(df$quarter[i],1,1) == '5') {df$year[i]<-"1/1/2015"}
  else if(substr(df$quarter[i],3,3) <3) {df$year[i]<-paste0("1/1/200",substr(df$quarter[i],1,1))}
  else if(substr(df$quarter[i],3,3) > 2) {df$year[i]<-paste0("1/1/200",substr(df$quarter[i],2,2))}
}

df
###lubridate
#change term to month, year to year
df$term<-month(df$term,label = T)
df$year<-dmy(df$year)
df$year<-year(df$year)
df$Start_date<-mdy(paste0(df$term,"/1/",df$year))

qt<-df%>%select( Start_date,gender,version,prenup)%>%group_by(Start_date,version,gender,prenup)%>%summarise(count =n())

ts<-ggplot(data=qt,aes(x=Start_date,y=count,color=gender))
#ts+ geom_line()+facet_grid(~version+prenup)+geom_smooth()


qtDiff<-df%>%select(Start_date,gender,version,prenup)%>%group_by(Start_date,version,gender,prenup)%>%summarise(count=sum(prenup))

qtrCount<-df%>%select(Start_date)%>%group_by(Start_date)%>%summarise(count = n())

finaldf<-dcast(df,Start_date+version+gender~prenup)
finaldf<-mutate(finaldf,Diff=Yes-No)

finalPlot<-ggplot(data=finaldf,aes(x=Start_date,y=Diff,color=gender))
finalPlot+ geom_point()+ facet_wrap(~version+gender,nrow=1)+geom_smooth()

print(tbl_df(temp),n=44)

##########3
#Below is for just the recent group.

summerdf<-df[df$quarter == 561,]


plot (x=summerdf$version, y = as.factor(summerdf$prenup), main = "proportion of responses\n y = yes to prenup, \nn = no",xlab ="A = Male asks for prenup,\nB = Female asks for prenup")

plot (x=as.factor(summerdf$prenup), main = "count  of responses\n y = yes to prenup, \nn = no")

str(summerdf)

summary(summerdf)

gender<-table(summerdf$prenup)
prenupGender<-table(summerdf$version,summerdf$prenup)
genPrenupVer<-table(summerdf$version,summerdf$prenup,summerdf$gender)


t.test(as.numeric(as.factor(summerdf$prenup))~summerdf$version)

plot1<-ggplot(data=summerdf, aes(x=gender,fill=..x..>1))
plot1+coord_cartesian(ylim = c(0.9, 12))+geom_bar()+facet_wrap(~version,ncol=2)+labs(title='count of male and female',x="Gender",y = "Count")

plot2<-ggplot(data=summerdf, aes(x=prenup,fill=c(1)))
plot2+stat_count()+facet_wrap(~gender+version,ncol=4)+labs(title='count of male and female',x="Sign Prenup?",y = "Count")+guides(fill=FALSE)

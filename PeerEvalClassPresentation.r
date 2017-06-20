###classs presentation peer review feedback.

library(tidyr)
library(dplyr)
library(ggplot2)

getwd()
#on Dater
setwd("/home/brian/Projects/teachstats")
#on campus
#setwd("I:\\My Data Sources\\classroom stuff")
#on Latitude
#setwd("/home/brian/Projects/teachstats")
peerPresent<-read.csv(
  "./Peer_Eval_Class_Present.csv"
  , encoding = "UTF-8")
colnames(peerPresent)<-c("Timestamp", "first.last.name", "Student",
                "Quality" , "Timeliness", "Task_Support", "Interaction", "Attendance",

                "Responsibility", "Involvement", "Leadership", "Overall", "Tasks_completed",

                "General_Comments")

str(peerPresent)

#who did the ratings?

peerPresent %>% group_by(first.last.name) %>% select(first.last.name,Student) %>% filter(grepl('mary',first.last.name,ignore.case=T))


PeerPresentEvalsComments<-peerPresent %>% arrange(-desc(Student)) %>% group_by(Student) %>% select(Student,Tasks_completed,General_Comments)
write.csv(PeerPresentEvalsComments,file="./PeerPresentComments.csv")

PeerPresentationEvals<-peerPresent %>% arrange(-desc(Student)) %>% group_by(Student) %>% summarise(
  Average.Qual = mean(Quality,na.rm=T),
  Average.Timeliness = mean(Timeliness,na.rm=T),
  Average.TaskSupport = mean(Task_Support,na.rm=T),
  Average.Interaction = mean(Interaction,na.rm=T),
  Average.Attendance = mean(Attendance,na.rm=T),
  Average.Responsibility = mean(Responsibility,na.rm=T),
  Average.Involvement = mean(Involvement,na.rm=T),
  Average.Leadership = mean(Leadership,na.rm=T),
  Average.Overall = mean(Overall,na.rm=T),
  Std.Dev.Qual = sd(Quality,na.rm=T),
  Std.Dev.Timeliness = sd(Timeliness,na.rm=T),
  Std.Dev.TaskSupport = sd(Task_Support,na.rm=T),
  Std.Dev.Interaction = sd(Interaction,na.rm=T),
  Std.Dev.Attendance = sd(Attendance,na.rm=T),
  Std.Dev.Responsibility = sd(Responsibility,na.rm=T),
  Std.Dev.Involvement = sd(Involvement,na.rm=T),
  Std.Dev.Leadership= sd(Leadership,na.rm=T),
  Std.Dev.Overall= sd(Overall,na.rm=T),
  Num.of.Raters=n())
write.csv(PeerPresentationEvals,file="./PeerPresentationEvals.csv")

t(PeerPresentationEvals %>% filter(grepl('alena',Student,ignore.case=T)))

#what follows is an attempt to see how the scores of differ from overall score.
#PeerPresentationEvals %>% group_by(Student) %>% summarize(mean(c(Average.Qual:Average.Leadership)))

MeanDifferential<-apply(PeerPresentationEvals[,2:9],1,mean)-PeerPresentationEvals[,10]

#below,  if average.overall is negative, it means that students overall rating was higher than the average of their other ratings.
cbind(data.frame(PeerPresentationEvals %>% group_by(Student) %>%  select(Student)),MeanDifferential)

sort(mapply(PeerPresentationEvals[,11:19],1,range))
data.frame(PeerPresentationEvals[PeerPresentationEvals[,11:19] >=1.5,c(1,11:19)])

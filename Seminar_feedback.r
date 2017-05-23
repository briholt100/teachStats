###
#organizing student survey feedback
####
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
sf<-read.csv(
  "./MMP_seminar_feedback.csv"
  , encoding = "UTF-8")

colnames(sf)<-c("Timestamp", "first.last.name", "student_self_reflect",
                "first.student" , "first.clear", "first.depth", "first.breadth", "first.text",

                "second.student", "second.clear", "second.depth", "second.breadth", "second.text",

                "third.student" , "third.clear", "third.depth", "third.breadth", "third.text",

                "fourth.student", "fourth.clear", "fourth.depth", "fourth.breadth", "fourth.text",

                "fifth.student", "fifth.clear", "fifth.depth", "fifth.breadth", "fifth.text",

                "sixth.student", "sixth.clear", "sixth.depth", "sixth.breadth", "sixth.text",

                "seventh.student", "seventh.clear", "seventh.depth", "seventh.breadth", "seventh.text")



#This just selects and groups
df<-sf %>% select(first.last.name,first.student,second.student,third.student,fourth.student,fifth.student) %>% group_by(desc(first.last.name))


##tidy to make columns meaningful
#to see who graded whom
df<-sf %>% select(first.last.name,first.student,second.student,third.student,fourth.student,fifth.student) %>% gather(subj,student,first.student:fifth.student)

head(df)


##must remove shihao Mei and Emily and tests

removeCases<-grep("shihao|stehr|holt|''|test",sf$first.last.name,ignore.case =T)
sf<-(sf[-removeCases,])
sf<-droplevels(sf)

str(sf)

#to see first student raters
df1<-sf %>% select(first.student:first.text,first.last.name)   %>%
  rename(Rated = first.student
         ,Rater=first.last.name
         ,Clarity=first.clear
         ,Depth=first.depth
         ,Breadth=first.breadth
         ,Comments = first.text)

#head(df1[order(df1$Rated),])
df1 %>% arrange(-desc(Rated))

#to see second student raters
df2<-sf %>% select(second.student:second.text,first.last.name) %>% rename(Rated = second.student, Rater=first.last.name,Clarity=second.clear,Depth=second.depth,Breadth=second.breadth,Comments = second.text)

#to see third student raters
df3<-sf %>% select(third.student:third.text,first.last.name) %>% rename(Rated = third.student,Rater=first.last.name
                                                             ,Clarity=third.clear
                                                             ,Depth=third.depth
                                                             ,Breadth=third.breadth
                                                             ,Comments = third.text)

#to see fourth student raters
df4<-sf %>% select(fourth.student:fourth.text,first.last.name) %>% rename(Rated = fourth.student,Rater=first.last.name
                                                              ,Clarity=fourth.clear
                                                              ,Depth=fourth.depth
                                                              ,Breadth=fourth.breadth
                                                              ,Comments = fourth.text)

#to see fifth student raters
df5<-sf %>% select(fifth.student:fifth.text,first.last.name) %>% rename(Rated = fifth.student,Rater=first.last.name
                                                             ,Clarity=fifth.clear
                                                             ,Depth=fifth.depth
                                                             ,Breadth=fifth.breadth
                                                             ,Comments = fifth.text)


WhoRatedWhom<-rbind(df1,df2,df3,df4,df5)
#remove brian holt from rated
WhoRatedWhom<-WhoRatedWhom[-grep("holt",WhoRatedWhom$Rated,ignore.case =T),]
#####
##should remove those who rated themselves, including song mei, sharon, and he yao
###############

Rated_scores<-WhoRatedWhom %>% arrange(-desc(Rated)) %>% group_by(Rated) %>% summarise(
  Average.Clarity = mean(Clarity,na.rm=T),Std.Dev.Clarity = sd(Clarity,na.rm=T),
  Average.Depth = mean(Depth,na.rm=T),Std.Dev.Depth = sd(Depth,na.rm=T),
  Average.Breadth = mean(Breadth,na.rm=T),Std.Dev.Breadth = sd(Breadth,na.rm=T),
  Num.of.Raters=n())

write.csv(Rated_scores,file="./RatedSeminarScores.csv")



Rated_Comments<-WhoRatedWhom %>% arrange(-desc(Rated)) %>% group_by(Rated) %>% select(Rated,Comments)
write.csv(Rated_Comments,file="./SeminarComments.csv")


#This pulls finds sharon and her self-rating

WhoRatedWhom %>%  filter(grepl("Sharon",Rater,ignore.case=T) & grepl("Sharon",Rated,ignore.case=T)) %>% arrange(-desc(Rated))


#makes a histogram
ggplot(Rated_scores,aes(x=Average.Breadth))+geom_histogram()

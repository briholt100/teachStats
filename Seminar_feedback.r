###
#organizing student survey feedback
####
library(tidyr)
library(dplyr)

getwd()
#on Dater
setwd("/home/brian/Projects/teachstats")
#on campus
#setwd("I:\\My Data Sources\\aljd;j")
#on Latitude
#setwd("/home/brian/Projects/teachstats")
sf<-read.csv(
  "./MMP_seminar_feedback.csv"
  , encoding = "UTF-8")

colnames(sf)<-c("Timestamp", "first.last.name", "student_self_reflect",
                "first.student" , "first.clear", "first.deep", "first.depth", "first.text",

                "second.student", "second.clear", "second.deep", "second.depth", "second.text",

                "third.student" , "third.clear", "third.deep", "third.depth", "third.text",

                "fourth.student", "fourth.clear", "fourth.deep", "fourth.depth", "fourth.text",

                "fifth.student", "fifth.clear", "fifth.deep", "fifth.depth", "fifth.text",

                "sixth.student", "sixth.clear", "sixth.deep", "sixth.depth", "sixth.text",

                "seventh.student", "seventh.clear", "seventh.deep", "seventh.depth", "seventh.text")

#This just selects and groups
df<-sf %>% select(first.last.name,first.student,second.student,third.student,fourth.student,fifth.student) %>% group_by(desc(first.last.name))


##tidy to make columns meaningful

df<-sf %>% select(first.last.name,first.student,second.student,third.student,fourth.student,fifth.student) %>% gather(subj,student,first.student:fifth.student)

head(df)

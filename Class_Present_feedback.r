
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
  "./MMP_Group_Presentation_feedback.csv"
  , encoding = "UTF-8")

colnames(sf)<-c("Timestamp", "first.last.name", "Group",
                "More_than_13" , "Less_than_15", "Two_Visuals", "Two_Interactions", "Summarized_Poster",

                "Explained_Poster", "Expanded_MLV_Content", "Thesis_Clarity", "Thesis_Depth", "Thesis_Paraphrase",

                "Presentation_Demonstrated" , "Each_Member_Spoke", "Thoughtful_Comments")



sf %>% group_by(Group) %>% select(Two_Visuals) %>% summarize(n())

sf$Media_definitions<-ifelse(grepl("Media definitions",sf$Presentation_Demonstrated) , 1 , 0)
sf$Movement_Definitions<-ifelse(grepl("Movement definitions",sf$Presentation_Demonstrated) , 1 , 0)
sf$Attitude_Persuasion_Tech<-ifelse(grepl("Attitude and persuasion techniques",sf$Presentation_Demonstrated) , 1 , 0)
sf$Group_Processes<-ifelse(grepl("Group processes",sf$Presentation_Demonstrated) , 1 , 0)
sf$Prejudice_Stereotypes<-ifelse(grepl("stereotypes",sf$Presentation_Demonstrated) , 1 , 0)
sf$Authority_Obedience<-ifelse(grepl("obedience",sf$Presentation_Demonstrated) , 1 , 0)
sf$Self_Identity<-ifelse(grepl("identity",sf$Presentation_Demonstrated) , 1 , 0)
sf$How_Media_Create_Narratives<-ifelse(grepl("narratives about movements",sf$Presentation_Demonstrated) , 1 , 0)


sf %>% select(Group,Media_definitions:How_Media_Create_Narratives) %>% group_by(Group) %>% summarize((n()))

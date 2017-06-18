
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

#what follows are the checkbox content options
''' "Media definitions","Movement definitions","Attitude and persuasion techniques, both via psychology and rhetoric","Group processes","Prejudice/stereotypes","Authority/obedience, conformity","Self/identity – how media narratives influence individuals","How media create narratives about movements" '''
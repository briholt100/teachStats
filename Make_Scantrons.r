##
# to do this, make a markdown file with question and solution.  Here you can get very fancy with using random generated data, which will make unique question/answer content for your students
# This file below, will then read that markdown document and crate a pDF.

  #install.packages("exams", dependencies = TRUE)
library(exams)
setwd('/home/brian/Projects/teachStats')
#setwd('U:\\Documents\\My Data Sources\\classroom stuff')
myexam <- list('psychosexual.Rmd') #list of quesions.  Here, just 1 question is added

  ex1 <- exams2nops(myexam, n = 1, #selects how many questions will be pulled from "myexam"
                    dir = "nops_pdf", name = "demo", date = "2018-02-27", #where to store
                    points = c(3), showpoints = TRUE) #how many points the question is worth, here it's worth '3'


myexam <- list(
  "tstat2.Rnw",
  "ttest.Rnw",
  "relfreq.Rnw",
  "anova.Rnw",
  c("boxplots.Rnw", "scatterplot.Rnw"),
  "cholesky.Rnw"
)

exams2html("ttest.Rnw")


set.seed(403)
ex1 <- exams2nops(myexam, n = 2,
                  dir = "nops_pdf", name = "demo", date = "2018-02-23",
                  points = c(1, 1, 1, 2, 2, 3), showpoints = TRUE)


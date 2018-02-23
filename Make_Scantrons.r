#install.packages("exams", dependencies = TRUE)
library(exams)
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

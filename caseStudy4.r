getwd()
summerdf<-read.csv("./Final.txt",sep=",")

summerdf$quarter<-factor(summerdf$quarter)
summerdf$gender<-factor(summerdf$gender)
summerdf$version<-factor(summerdf$version)
apply(summerdf,2,class)

plot(sumdf$prenup~sumdf$version)
??ttest
t.test(prenup~version,data = sumdf)


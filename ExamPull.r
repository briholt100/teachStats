e1<-readClipboard()
e1[1:6]
str(e1)
e1<-e1[grep('(^$)',e1,invert=T)] #looks for full lines
e1<-e1[grep("^\\?",e1,invert=T)]

#remove apa standard
grep("APA Standard:.*$",e1,value=T)
e1<-gsub("APA Standard:.*$","",e1)


#see list of difficulty
table(grep('Difficulty',e1,ignore.case=F,value=T))
grep("^Difficul",e1)
e1<-gsub("^Difficul.*$","",e1)

#change categories into gift format  $CATEGORY: mycategory
#e1<-gsub('Difficulty','\\$CATEGORY',e1,ignore.case=F)
#table(grep('CATEGORY',e1,ignore.case=F,value=T))

# only pull answers for in class test. to find answer 'a', change range in brackets
e1[grep('^[a-e]',e1,ignore.case = T)]
#removes asterick from correct answer
gsub('\\*','',e1,ignore.case=F)

#converts asterick to '=' for GIFT format, and adds answer '~' to non correct
e1<-gsub('^\\*','=',e1,ignore.case=F)
#grep("^=",e1,value=T)
grep("^=|^[a-e]\\. ",e1,ignore.case=T,value=T) #this pulls answers and =, which denotes correct answer
e1<-gsub("(^[a-e]\\. )","~\\1",e1,ignore.case=T) #



##adding curly brack {} around ques,ans,cat
  ##must come before first answer but after qeustino punctuation
 e1<-gsub("(^~a\\.|^=a\\.)",'\\{\\1',e1,ignore.case=T)
 e1<-gsub("(D\\. .*$)",'\\1\\}',e1,ignore.case=T)
 
 ##delete question numbers and answer letters 
 e1<-gsub("[0-9]{1,3}\\. ","",e1)
 e1<-gsub("[A-D]\\. ","",e1)
 head(e1,24)
 

##this pulls out just questinos when invert ==T
q<-e1[grep('\\$|=|^~[a-e]',e1,ignore.case=T,invert=T)]
writeClipboard(e1)
grouping<-1:6



answer<-readClipboard()
answer<-gsub("\tANS:\t","",answer)
answer<-gsub("\\.","\t",answer)
answer<-gsub("\t{2}","\t",answer)
answers<-sub('^.*\\*([A-E]).*$','\\1',answer)

writeClipboard(answers)



for (i in 1:length(e1)){
  if(grepl('^\\{',e1[i])==T)
  {print(paste0(i,e1[i]))
    print(e1[i+4])}
  
}   

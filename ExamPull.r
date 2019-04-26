######For Moodle

## 
e1<-readClipboard()
#e1<-readLines(con=file("/home/brian/ch5Openstax.txt"))
e1[1:6]
str(e1)
e1<-e1[grep('(^$)',e1,invert=T)] #looks for full lines
e1<-e1[grep("^\\?",e1,invert=T)]

#remove apa standard
grep("APA Standard:.*$",e1,value=T)
e1<-gsub("APA Standard:.*$","",e1)


#see list of difficulty
table(grep('Difficulty',e1,ignore.case=F,value=T))
grep("Difficult ",e1)
#e1<-gsub("^Difficul.*$","",e1)

#change categories into gift format  $CATEGORY: mycategory

e1<-gsub('Difficulty','\\$CATEGORY',e1,ignore.case=F)
table(grep('CATEGORY',e1,ignore.case=F,value=T))
#e1<-gsub('\\$CAT.*$','',e1) #removes this category line completely.

#changes category to include sub cat

e1<-gsub('(CATEGORY: )(.*$)','\\1\\2/Chapter 15',e1)  

#converts asterick to '=' for GIFT format, and adds answer '~' to non correct

e1<-gsub('^\\*','=',e1,ignore.case=F)
#grep("^=",e1,value=T)
grep("^=|^[a-e]\\. ",e1,ignore.case=T,value=T) #this pulls answers and =, which denotes correct answer
e1<-gsub("(^[a-e]\\. )","~\\1",e1,ignore.case=T) # This adds ~ to wrong answer choices


##adding curly brack {} around ques,ans,cat
  ##must come before first answer but after qeustino punctuation
 e1<-gsub("(^~a\\.|^=a\\.)",'\\{\\1',e1,ignore.case=T)
 e1<-gsub("(D\\. .*$)",'\\1\\}',e1,ignore.case=T)
 
 ##delete question numbers and answer letters 
 e1<-gsub("[0-9]{1,3}\\. ","",e1)
 e1<-gsub("[A-D]\\. ","",e1)
 e1<-e1[grep('(^$)',e1,invert=T)] #looks for full lines
 e1<-e1[grep("^\\?",e1,invert=T)]
 
  head(e1,24)
 grep("\\}",e1,value=T)
##the following takes processed e1 and makes backup e2

e2<-paste(e1,sep = ';; ',collapse = ';; ') #this takes each line of e1 and pastes together with a separator and a divider "collpase"

e2<-gsub("(Chapter 15;; )","\\1;9;",e2)  #this adds a unique ;9; identifier to split question and answers from each other question

e2<-strsplit(e2,";9;") #this makes makes the split into 80 question/asnwer sets

e2<-unlist(e2)  #puts each question into a line

e2<-gsub(";;",'',e2) #removes paste identifier from above

#So, now we move "$categor..." to front of line.    

e2<-gsub("(^.*\\} )(\\$CATEGORY.*$)","\\2;;9;;\\1",e2)

#the following adds new lines before and after

e2 <- (gsub(';;9;;','\r\n\r\n',e2))
e2 <- gsub('(^.*$)','\r\n\\1',e2)

head(e2)

writeClipboard(e2)



#For in person class test



######For Moodle

## 
e1<-readClipboard()
#e1<-readLines(con=file("/home/brian/ch5Openstax.txt"))
e1[1:6]
str(e1)
e1<-e1[grep('(^$)',e1,invert=T)] #looks for full lines
e1<-e1[grep("^\\?",e1,invert=T)]

#remove apa standard
grep("APA Standard:.*$",e1,value=T)
e1<-gsub("APA Standard:.*$","",e1)


#see list of difficulty
table(grep('Difficulty',e1,ignore.case=F,value=T))
grep("Difficult ",e1)
e1<-gsub("^Difficul.*$","",e1) #removes difficulty line


# only pull answers for in class test. to find answer 'a', change range in brackets
e1[grep('^[a-e]',e1,ignore.case = T)]
#removes asterick from correct answer
gsub('\\*','',e1,ignore.case=F)


##delete question numbers
e1<-gsub("[0-9]{1,3}\\. ","",e1)
head(e1,24)


##this pulls out just questinos when invert ==T
q<-e1[grepe2<-paste(e1,sep = ';; ',collapse = ';; ')
      ('\\$|=|^~[a-e]',e1,ignore.case=T,invert=T)]
writeClipboard(e1)


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


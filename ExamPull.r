e1<-readClipboard()
e1[1:6]
e1<-e1[grep('(^$)',e1,invert=T)]
e1<-e1[grep("^\\?",e1,invert=T)]
e1[grep('^[a-e]',e1)]  # only pull answers.  ironically. 
e1[grep('^[a-e]',e1,invert=T)]
writeClipboard(e1[grep('^[e]',e1)])
grouping<-1:6




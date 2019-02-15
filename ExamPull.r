e1<-readClipboard()
e1[1:6]
e1<-e1[grep('(^$)',e1,invert=T)] #looks for full lines
e1<-e1[grep("^\\?",e1,invert=T)]

# only pull answers. to find answer 'a', change range in brackets
e1[grep('^[a-e]',e1,ignore.case = T)]

e1[grep('^[a-e]',e1,ignore.case=T,invert=T)]
writeClipboard(e1[grep('^[a-e]',e1,ignore.case=T,invert=T)])
grouping<-1:6



answer<-readClipboard()
answers<-sub('^.*\\*([A-E]).*$','\\1',answer)

writeClipboard(answers)

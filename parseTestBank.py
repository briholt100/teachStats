# -*- coding: utf-8 -*-
"""
Created on Wed Jan 03 13:24:00 2018

@author: bholt
"""
#example = "1) test question. \n A) choice 1\nB) choice 2\nAnswer B\n2) test question2. \n A) choice 1.2\nB) choice 2.2\nAnswer A\n"
 #   lines = [example.strip() for  line in example]
#with open ('/home/brian/Projects/teachstats/Chapter 2.txt','r') as f:
with open ('I:\\current quarter\\personality\\Zonal\\Chapter 2.txt','r') as f:
    lines = [line.strip() for  line in f]
print(lines)
    #the following will make an answer key
    #####
#   Assumes answer line is 9 characters
    ######

import re
from collections import defaultdict
Choices=defaultdict(list)
# When doing this, keep two counters, 1 counter that updates if and only if the line begins with a number, and then teh 2nd counter is pegged to A-D
i=0
for l in lines:
    print (l)
    if re.search('[0-9]{1,2}\)',l):#searches for item number '1)-99)'
        i+=1
        Choices[i].append(l)
    elif re.search('A\)',l):
        Choices[i].append(l)
    elif re.search('B\)',l):
        Choices[i].append(l)
    elif re.search('C\)',l):
        Choices[i].append(l)
    elif re.search('D\)',l):
        Choices[i].append(l)
    elif 'Answer' in l:
        Choices[i].append(l)
    
for x in Choices:   
    print (x,Choices[x])
    
    
for k, v in Choices.items():
    print(k, v[5]) #prints answer


for k, v in Choices.items():
    for i in range(1,5):
        if v[i][0] == v[5][8]:
            #print ('{}'.format(v[i]))
            print('{}...\n={}...Answer: {}'.format(v[0],v[i],v[5]))
        else:
            print('~{}'.format(v[i]))            
 
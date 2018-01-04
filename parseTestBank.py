# -*- coding: utf-8 -*-
"""
Created on Wed Jan 03 13:24:00 2018

@author: bholt
"""

with open ('I:\\current quarter\\personality\\Zonal\\Chapter 2.txt','r') as f:
    lines = [line.strip() for  line in f]
    
    #the following will make an answer key
    #####
#   Assumes answer line is 9 characters
    ######

for l in lines:
    print (l)

answers={}
i=0
for l in lines:
    if 'Answer' in l:
        print l[8:9]
        i+=1        
        answers[i]=l[8]
        
print answers; i

#the following will make a question dict
    #####
#   But no choices
    ######

import re
Questions={}
i=0
for l in lines:
    if re.search('[0-9]{1,2}\)',l):#searches for item number '1)-99)'
        i+=1        
        #Must strip out Q item number
        Questions[i]=l
print Questions


Choices={}
# When doing this, keep two counters, 1 counter that updates if and only if the line begins with a number, and then teh 2nd counter is pegged to A-D
i=0
for l in lines[0:20]:
    print l
    if re.search('A\)',l):
        print l
        Choices[i]=[l]
    elif re.search('B\)',l):
        Choices[i].append(l)
    elif re.search('C\)',l):
        Choices[i].append(l)
    elif re.search('D\)',l):
        Choices[i].append(l)
    i+=1    
print Choices

print lines[0:20]

i=0
for l in lines:
    if re.search('[A-E]\)',l):
        i+=1   
        #print l
        #Must strip out A-D numeral
        Choices[i]=l
print Choices


finley = {'a':0, 'b':2, 'c':[41,51,61]}
crazy_sauce = {'d':3}

finley['c'].append(crazy_sauce['d'])
finley['c'].append(4)

print finley


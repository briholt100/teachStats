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

for l in lines:
    print (l)

answers={}
i=0
for l in lines:
    if 'Answer' in l:
        print (l[8:9])
        i+=1        
        answers[i]=l[8]
        
print (answers,i)

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
print (Questions)

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
    print(k, v[4]) #prints answer


#now I need to evaluate the answer which in a key:value pair would be value[5] and to use the last character in that element to then mark a correct answer in values[1-4]


for k, v in Choices.items():
    print('{}-- {} \n\n {}\n{}\n\n'.format(k,v[0],v[1:4], v[5][-1]))
    #prints letter answer


print("{}. {} appears {} times.".format(i, key, wordBank[key]))
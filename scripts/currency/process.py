#!/usr/bin/python
from string import split
lines = open("iso4217.txt", "r").readlines()
del lines[0]
for i in range(len(lines)):
	lines[i] = lines[i][:-2]
	lines[i] = split(lines[i], '\t')
	lines[i] = lines[i][1:]

tmplist = [(x[1],x) for x in lines]
tmplist.sort()
lines = [x for (key,x) in tmplist]	
for i in range(len(lines)):
	if len(lines[i]) > 5 and lines[i][5] != '':
		print lines[i]
#	if lines[i][1] != '' and (i == 0 or lines[i][1] != lines[i-1][1]):
#		print lines[i][1]+':'+lines[i][2]+':'+lines[i][4]

#!/usr/bin/python3
from sys import argv

b62_charset="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
b62_string=argv[1]
p=0
n=0
for i in b62_string[::-1]:
	n += b62_charset.index(i) * 62 ** p
	p += 1
print(f'{n:x}')
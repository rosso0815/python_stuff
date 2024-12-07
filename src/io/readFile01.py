#!/usr/local/bin/python3

import re

print("start")

file = open('./readText.txt', 'r')

for line in file:
    print(line.rstrip('\n'))

print("done")

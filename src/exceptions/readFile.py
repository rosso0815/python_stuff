#! /usr/bin/env python3

import os


def readFile(file):
    print("@@@ readFile = "+file)
    try:
        statinfo = os.stat(file)
        print(statinfo)

    except Exception as e:
        print("An exception occurred +> "+str(e))
    else:
        print("all the best")

    finally:
        print("the final counddown")

    # with os.stat(file) as f:
    #    print(f)

file = 'test.txt'
# statinfo = os.stat(file)
# print(statinfo)

readFile(file)
readFile(file+"1")

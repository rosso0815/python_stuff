#! /usr/bin/env python3

# import traceback_with_variables
# from traceback_with_variables import activate_by_import

def add(x,y):
    return x+y

def divide(x,y):
    return x / y
if __name__ == '__main__':
    print ("add 1 + 1 =",add(1,1))
    print("divide 10 / 2 =",divide(10,2))
    print("divide 10 / 0 =",divide(10,0))
import my_sum
import traceback
import sys

def hello1():
    print("hello1")
    return hello2()


def hello2():
    my_sum.my_sum(2,2)
    print("hello2")
    return hello3()


def hello3():
    print("hello3")
    traceback.print_stack()
    return "done"


print(sys.path)
print(my_sum.my_sum(2,3))
hello1()

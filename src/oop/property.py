#! /usr/bin/env python3

# https://www.python-course.eu/python3_properties.php

class P:

    def __init__(self, x):
        self.__x = x

    @property
    def x(self):
        print("property")
        return self.__x

    @x.setter
    def x(self, x):
        print("p2")
        if x < 0:
            self.__x = 0
        elif x > 1000:
            self.__x = 1000
        else:

            self.__x = x


p1 = P(42)
p2 = P(4711)
print(p1.x)
p1.x = 43
print(p1.x)

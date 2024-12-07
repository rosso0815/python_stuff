"""Tbd"""


from abc import ABC, abstractmethod


class AbstractClassExample(ABC):

    @abstractmethod
    def do_something(self):
        print("Some implementation!")


class AnotherSubclass1(AbstractClassExample):

    def do_something(self):
        super().do_something()
        print("The enrichment from AnotherSubclass1")


class AnotherSubclass2(AbstractClassExample):

    def do_something(self):
        super().do_something()
        print("The enrichment from AnotherSubclass2 again")


class User:
    def __init__(self, name, abClass):
        self.name = name
        self.abClass = abClass

    def play(self):
        print("play name=", self.name)
        self.abClass.do_something()


# y = AbstractClassExample()
#  x = AnotherSubclass1()
#  x.do_something()
#
#  x = AnotherSubclass2()
#  x.do_something()

#  user = User(name="Gusti", abClass=x)
#  user.play()

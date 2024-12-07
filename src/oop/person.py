"""
    Person
"""

from dataclasses import dataclass
import logging


@dataclass
class User:
    """User as Interface to UI"""
    FirstName: str
    LastName: str


def checkUser(user: User) -> User:
    logging.info("user: %s", user)
    return user


class Person:
    """
    Person
    """

    category = "human"

    def __init__(self, name):
        self.name = name

    def __del__(self):
        print("destruktor Person", self.name)

    def say_hello(self):
        """
        lets say hi
        """
        return "Guten Tag " + self.name


class Worker(Person):
    def __init__(self, name, job='undefined'):
        self._job = job
        self._name = name

    def __str__(self):
        return 'Worker( name:' + self._name + ', job:' + self._job + ')'

    def printSomething(self, printerFunction, text):
        print("@@@ printerFunction starts")
        if text == 'undefined':
            raise WorkerException("undefined job")
        printerFunction(text)
        print("@@@ printerFunction finished")


# workers1 = [
#    Worker(name='andreas', job='toolmaker'),
#    Worker(name='peter', job='mechanic'),
#    Worker(name='heinz')
# ]
##
# workers2 = [
#    Worker(name='andreas', job='toolmaker'),
#    Worker(name='peter', job='mechanic'),
# ]
#
#
# x = Person("rosso0815")
# y = Worker(job="toolmaker", name="meier")
#
# x.SayHello()
# x.name = "tutu"
# y.SayHello()
#
# workers = [
#    {"printerFunction": "print", "text": "text"},
#    {"printerFunction": "print", "text": "exception"}
# ]
#
# for worker in workers1:
#    try:
#        print("worker = "+str(worker))
#        worker.printSomething(printerFunction=print, text=worker._job)
#
#    except WorkerException as e:
#        print("a WorkerException raised => "+str(e))
#        exit(1)
#    except Exception as e:
#        print("An exception occurred +> "+str(e))
#
#    else:
#        print('no exception raised')
#    finally:
#        print('finally reached')
#
# try:
#    y.printSomething(printerFunction=print, text="text")
#    y.printSomething(printerFunction=print, text="exception")
# except Exception as e:
#    print("An exception occurred +> "+str(e))
# print("x.name="+x.name)
# print(x)
# del(x)


class MyClass:
    """A simple example class"""




    i = 12345

    def f(self):
        return 'hello world'


def say_hello() -> None:
    print("sayHello")


x = MyClass()

print("x=",x," x.f()=",x.f()," x.i=",x.i)

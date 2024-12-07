"""Letsv do some stuff with class static"""


class MyClass:
    """Tbd"""

    count = 0

    def __init__(self, value_x):
        self.value_x = value_x

    def show_values(self):
        """Show all values"""
        return f'value_x: {self.value_x}'

    @staticmethod
    def call_static():
        """Tbd"""
        return "i am a static method"

    @classmethod
    def class_method(cls):
        """Tbd"""
        cls.count += 1


my_class = MyClass(2)

print(f'my_class.values: {my_class.show_values()}')

print(f'static: {MyClass.call_static()}')

print(f'static.count: {MyClass.count}')
MyClass.count = 2
print(f'static.count: {MyClass.count}')

print(f'class_method: {MyClass.class_method()}')
print(f'static.count: {MyClass.count}')

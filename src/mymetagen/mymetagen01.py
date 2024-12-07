#! /usr/bin/env python3


class app:
    def __init__(self, name):
        self.name = name

    def __str__(self):
        return f'{{ "name": "{self.name}" }}'

    def __repl__(self):
        return {'name': self.name}


class MyGenerator:
    def generate_code_app(self, apps):
        for app in myapps:
            print(f'app: {app}')
        #  generate_code_app(app)
        #  print("generate_code_app")
        #  print(type(app))
        #  print(f'generate_code app.name {app.name}')
        #  print(f'app.__dict__: {app.__dict__}')
        #  if "type" in app.__dict__:
        #      print(f'app.type: {app.type}')


myapps = []

app1 = app("test01")
app1.type = "kukuk"

app2 = app("test02")

print(f'app1: {app1}')

myapps.append(app1)
myapps.append(app2)
print(f'myapps: {myapps}')

my_generate = MyGenerator()
my_generate.generate_code_app(myapps)

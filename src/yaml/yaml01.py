#! /usr/bin/env python3

import yaml


class Person(yaml.YAMLObject):
    yaml_tag = u'!Person'

    def __init__(self, name, age):
        self.name = name
        self.age = age


objects = []

objects.append(Person("John", 1))
objects.append(Person("John", 2))
objects.append(Person("John", 3))

print("@@@--- dump")
print(yaml.dump_all(objects, explicit_start=True))
print("@@@--- done")

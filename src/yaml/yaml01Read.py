#! /usr/bin/env python3
import yaml

myYaml = """
---
space:
    name: 1111
name: 111
applications:
- name: app1
  network: 23
- name: app2
  network: 24
"""


class Application:
    identifier = 'applications'
    tags = ["name", "network"]

    def __init__(self, name):
        self.name = name

    # def has_identifier(self, ident):
    #     if ident == self.indentifier:
    #         return True
    #     else:
    #         return False

    def validate(self):
        print("validate ", self.name)


def defineYaml(tYaml: str):
    loaded = yaml.safe_load(tYaml)
    return loaded


def analyzeYaml(tYaml: str):
    print('@@@ analyze ', tYaml)
    # passed = True
    # error_msg = []
    for key in tYaml:
        print("key ", key, "value=", tYaml[key])
        print

    # if 'space' in tYaml:
    #     print("found space")
    # else:
    #     passed = False
    #     error_msg.append('space not defined')

    # if Application.identifier in tYaml:
    #     print("found application")
    # else:
    #     passed = False
    #     error_msg.append('application not defined')

    # if passed == False:
    #     print('found error', str(error_msg))


def main():
    tYaml = defineYaml(myYaml)
    analyzeYaml(tYaml)


if __name__ == "__main__":
    main()

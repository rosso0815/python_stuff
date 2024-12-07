#! /usr/bin/env python3

#####################################################################
# author : PfisterA
#####################################################################

# pylint: disable=invalid-name

import pprint
import yaml

class Application(yaml.YAMLObject):

    def __init__(self, name, path):
        self.name = name
        self.path = path

    def __repr__(self):
        return '{name:'+self.name+', path:'+str(self.path)+ '}'

    def __str__(self):
        return 'Application(name='+self.name+', path='+str(self.path)+ ')'

def noop(self, *args, **kw):
    pass

yaml.emitter.Emitter.process_tag = noop
pp = pprint.PrettyPrinter(indent=4)

applications = []
applications.append(Application("appl01", "/appl01"))
applications.append(Application("appl02", "/appl02"))

page = []
page.append({'applications':applications})
print("@@@ structure")
pp.pprint(page)

buffer = yaml.dump_all(page, explicit_start=True)
print("@@@ yaml")
print(buffer)

input = yaml.load(buffer, Loader=yaml.FullLoader)
print("@@@--- input\n")
pp.pprint(input)
print("\n@@@---")

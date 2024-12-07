
from jinja2 import Template

# import yaml
from yaml import load, dump
try:
    from yaml import CLoader as Loader, CDumper as Dumper
except ImportError:
    from yaml import Loader, Dumper

myyaml = """
a: "{{ firstname }} {{ lastname }}"
b:
    c: 3
    d: 4
"""

print(dump(load(myyaml, Loader=Loader)))

data = {}
data['firstname'] = 'Andreas'
data['lastname'] = 'Pfister'
tm = Template(myyaml)
print(tm.render(data))

#! /usr/bin/env python3

import sys
from ruamel.yaml import YAML

inp = """\
- &CENTER {x: 1, y: 2}
- &LEFT {x: 0, y: 2}
- &BIG {r: 10}
- &SMALL {r: 1}
# All the following maps are equal:
# Explicit keys
- x: 1
  y: 2
  r: 10
  label: center/big
# Merge one map
- <<: *CENTER
  r: 10
  label: center/big
# Merge multiple maps
- <<: [*CENTER, *BIG]
  label: center/big
# Override
- <<: [*BIG, *LEFT, *SMALL]
  x: 1
  label: center/big
"""

yaml = YAML()
yaml.indent(mapping=4, sequence=6, offset=3)
data = yaml.load(inp)
assert data[7]['y'] == 2
yaml.dump(data, sys.stdout)

for i in data:
    print(f'i: {i}')

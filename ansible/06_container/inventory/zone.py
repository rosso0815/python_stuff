#!/usr/bin/env python

import sys
import json

result = {}
result['all'] = {}
result['all']['hosts'] = ['centos8']
result['all']['vars'] = {}
result['all']['vars']['ansible_connection'] = 'zone'

if len(sys.argv) == 2 and sys.argv[1] == '--list':
    print(json.dumps(result))
elif len(sys.argv) == 3 and sys.argv[1] == '--host':
    print(json.dumps({'ansible_connection': 'host'}))
else:
    sys.stderr.write("Need an argument, either --list or --host <host>\n")

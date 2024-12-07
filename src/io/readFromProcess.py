#! /usr/bin/env python3

import subprocess
import json

spooky_path = 'cat'
cmd = [spooky_path, 'test.json']
process = subprocess.Popen(cmd, stdout=subprocess.PIPE)
output = process.communicate()[0]
print("Output:" + str(output))
process.wait()
result = json.loads(output)  # default encoding is utf-8
print("name:"+result["NAME"])
print('Done')

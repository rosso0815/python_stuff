#!/usr/bin/env python2

import urllib2
import json

url = 'http://localhost:1080/rosso0815/cgi/mojo/start02.cgi/list'

response = urllib2.urlopen(url).read()

print json.dumps(response)

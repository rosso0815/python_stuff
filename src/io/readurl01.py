#!/usr/bin/env python2

import urllib2

f = urllib2.urlopen('http://www.python.org/')

print f.read(1000)

#! /usr/bin/env python3

import stomp
import sys

conn = stomp.Connection()
conn.connect('admin', 'admin', wait=True)
conn.send(body=' '.join(sys.argv[1:]), destination='/queue/test')
conn.disconnect()

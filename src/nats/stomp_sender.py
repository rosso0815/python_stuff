#!/usr/bin/env python

import time
import sys
import datetime
import stomp

conn = stomp.Connection([('192.168.1.100', 61613), ('192.168.1.101', 62613)])

conn.connect()

while True:
    conn.send( body=datetime.datetime.now().strftime("%H:%M:%S"), destination='/queue/POSTFACH.01')
    time.sleep(2)

conn.disconnect()



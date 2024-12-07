#!/usr/bin/env python2

# -*- coding: utf-8 -*-

import MySQLdb as db
import sys

try:
    con = db.connect( host='127.0.0.1', port=3306, user='reader', password='reader', db='employees')

    cur = con.cursor()
    cur.execute("SELECT VERSION()")

    ver = cur.fetchone()

    print "Database version : %s " % ver

except db.Error, e:
    print "Error %d: %s" % (e.args[0],e.args[1])
    sys.exit(1)

finally:
    if con:
        con.close()





#! /usr/bin/env python3

import sqlite3

con = sqlite3.connect("all.db")

new_cur = con.cursor()

res = new_cur.execute("SELECT count(*) FROM picture")

count = res.fetchone()

print(f'count: x{count}x')

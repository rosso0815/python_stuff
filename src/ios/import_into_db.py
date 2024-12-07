#! /usr/bin/env python3

import csv
import psycopg2

print("@@@ START")


conn = None
params = {"database": "dvdrental", "host": "localhost", "user": "postgres"}

create_table = """

    DROP TABLE IF EXISTS picture;

    create table picture (
        id SERIAL,
        path VARCHAR(255),
        date TIMESTAMP,
        size INT
        )
"""

try:
    conn = psycopg2.connect(**params)
    print(conn)
    cur = conn.cursor()
    print(cur)
    cur.execute(create_table)
    with open('ios_photos.csv', newline='') as csvfile:
        reader = csv.DictReader(csvfile, delimiter=',')
        for row in reader:
            print(row["filename"])
            cur.execute("INSERT INTO PICTURe (path,size,date) VALUES (%s, %s,%s)", (row["filename"], row["size"], row["created"]))

    cur.close()
    conn.commit()
except (Exception, psycopg2.DatabaseError) as error:
    print(error)
finally:
    if conn is not None:
        print("FINALLY")
        conn.close()

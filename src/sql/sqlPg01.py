import logging
import os

import psycopg2
from dotenv import load_dotenv


def query_db():
    try:
        connection = psycopg2.connect(
            user="pfistera",
            password="pfistera",
            port="5432",
            host="master",
            database="pfistera",
        )

        cursor = connection.cursor()
        cursor.execute("SELECT version();")
        record = cursor.fetchone()
        print("You are connected to - ", record, "\n")
        sql = "select * from employees where emp_no = 10052"
        cursor.execute(sql)
        print("select * from employees where emp_no = 10052")
        mobile_records = cursor.fetchall()
        for row in mobile_records:
            print("[0] = ", row[0])
            print("[1] = ", row[1])
            print("[2] = ", row[2])
            print()
    except (Exception, psycopg2.Error) as error:
        print("Error while connecting to PostgreSQL", error)
    finally:
        if connection:
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")


def main():
    logging.basicConfig(
        format="%(asctime)s %(filename)s %(levelname)s->%(message)s",
        level=logging.INFO)
    logging.info("Started")
    load_dotenv()
    logging.info(f'DB_USER {os.getenv("DB_USER")}')
    query_db()
    logging.info("Finished")


if __name__ == "__main__":
    main()

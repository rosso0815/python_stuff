#! /usr/bin/env python3

"""Tbd"""

import os

import click
from flask import Flask, render_template
import psycopg2


def get_db_connection():
    """Tbd"""
    conn = psycopg2.connect(os.environ["DB_URL"])
    return conn


def create_app():
    """Tbd"""

    app = Flask(__name__)

    @app.route("/")
    def get_root():
        return "hello world of k8s"

    @app.route('/hello')
    @app.route('/hello/<name>')
    def hello(name=None):
        return render_template('hello.html', name=name)

    @app.route('/contact/1/edit')
    def contact_edit():
        return render_template('contact_edit.html')

    @app.route("/square/<number>")
    def square(number: int):
        print(f'number: {number}')
        return str(number)

    @app.route("/check_db")
    def get_check_db():
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("SELECT current_date")
        current_date = cur.fetchone()
        cur.close()
        conn.close()
        return {"date": current_date}

    @app.cli.command("create-user")
    @click.argument("name")
    def create_user(name):
        print(f'@@@ create user name: {name}')

    return app

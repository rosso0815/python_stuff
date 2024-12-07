"""Tbd"""

from flask import Flask


app = Flask(__name__)


@app.route('/')
def hello_world():
    """Lets give a Feedback"""
    return 'Hello World!'

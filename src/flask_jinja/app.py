
"""Initialize Flask Application."""

from flask import Flask
from flask import render_template

app = Flask(__name__, template_folder="templates")






@app.route("/")
def home():
    """Landing page route."""
    nav = [
        {"name": "Home", "url": "https://example.com/1"},
        {"name": "About", "url": "https://example.com/2"},
        {"name": "Pics", "url": "https://example.com/3"},
    ]
    return render_template(
        "home.html",
        nav=nav,
        title="Jinja Demo Site",
        description="Smarter page templates with Flask & Jinja.",
    )
from flask import Blueprint, abort, render_template
from jinja2 import TemplateNotFound

user_page = Blueprint("user_page", __name__, template_folder="templates")


@user_page.route("/", defaults={"page": "index"})
@user_page.route("/<page>")
def show(page):
    print(f"users_page: {page}")
    try:
        return render_template(f"{page}.html", username="pfistera", time="now")
    except TemplateNotFound:
        abort(404)

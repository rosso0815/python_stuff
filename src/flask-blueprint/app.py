#! /usr/bin/env python3

from flask_bootstrap import Bootstrap
from flask import Flask, render_template, abort
from jinja2 import TemplateNotFound

from flask_nav import Nav
# from flask_nav.elements import Navbar, View

from users.user_page import user_page


# nav = Nav()

# app = Flask(__name__)
# app.register_blueprint(user_page, url_prefix='/users')

# bootstrap = Bootstrap(app)

# nav.init_app(app)

# print(app.url_map)


# @nav.navigation()
# def mynavbar():
    # return Navbar(
        # 'mysite',
        # View('Home', 'index'),
    # )


@app.route('/', defaults={'page': 'index'})
@app.route('/<page>')
def show(page):
    print(f'users_page: {page}')
    try:
        return render_template(f'{page}.html', username="pfistera", time="now", bootstrap=bootstrap)
    except TemplateNotFound:
        abort(404)


if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8080, debug=True)

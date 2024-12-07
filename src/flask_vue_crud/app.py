#! /usr/bin/env python3

from flask import Flask, jsonify

app = Flask(
    __name__, static_url_path="", static_folder="static", template_folder="templates"
)


@app.route("/api/table1_definition")
def api_def_table1():
    definition = {"tablename": "pfister"}
    return jsonify(definition)


@app.route("/")
def root():
    return app.send_static_file("html/index.html")


@app.route("/admin")
def admin():
    return app.send_static_file("html/admin.html")


if __name__ == "__main__":  # pragma: no cover
    app.run(port=8080, debug=True)

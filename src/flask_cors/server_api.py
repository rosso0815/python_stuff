# import os

from flask import Flask, jsonify
from flask_cors import CORS  # This is the magic


app = Flask(__name__)
CORS(app, resources={r"/api/*": {"origins": "http://localhost:8020"}})


@app.route("/api/call1", methods=["GET"])
def get_api_call1():
    """Tbd."""
    return jsonify({"some": "data"})


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8010, debug=True)

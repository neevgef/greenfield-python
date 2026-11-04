import os
from flask import Flask, jsonify

app = Flask(__name__)

VERSION = os.getenv("APP_VERSION", "Version variable not set!")


@app.route("/")
def hello():
    return jsonify({
        "message": "Hello World!",
        "version": VERSION
    })


@app.route("/health")
def health():
    return jsonify({"status": "healthy"})


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
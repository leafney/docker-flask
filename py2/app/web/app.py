#!/usr/bin/env python
# encoding:utf-8

from flask import Flask
app = Flask(__name__)


@app.route('/')
def index():
    return "Hello World for Docker-flask with Python2.7 !"

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')

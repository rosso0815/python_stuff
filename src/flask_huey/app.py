#! /usr/bin/env python3
"""Tbd."""

from dataclasses import dataclass

from typing import Dict

from flask import Flask, jsonify
from flask_apscheduler import APScheduler

import add


class Config:
    SCHEDULER_API_ENABLED = True


app = Flask(__name__)
app.config.from_object(Config())
scheduler = APScheduler()
scheduler.init_app(app)
scheduler.start()


@dataclass
class Task:

    """Tbd."""

    ident: int
    command: str


tasks: Dict = {}


# @scheduler.task('interval', id='do_job_1', seconds=10, misfire_grace_time=900)
# def my_scheduled_job():
# print('@@@ start scheduled')
# for key in tasks.keys():
# print(f'key: {key} {tasks[key]} {tasks[key]["task"]}')
# r = tasks[key]["task"]
# print("r=" + str(r()))
# # print(f'task["name"]: {tasks["name"]}')
# print('@@@ done scheduled')


@app.route("/")
def get_root():
    print("@@@ get_root")
    return f"tasks: {tasks}"


@app.route("/<name>")
def get_base(name=None):

    print(f"get_base name: {name}")
    print(f"taks {tasks}")

    if name in tasks:
        print("already started")
        r = tasks[name]["task"]
        print("r=" + str(r()))
    else:
        print("define tasks")
        tasks[name] = {}
        # tasks[name]["started"] = True
        t = add.add(name, name)
        tasks[name]["task"] = t
        print("taks " + str(tasks[name]["task"]))
    return jsonify(base="base", name=name)


# huey_consumer demo.huey
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5002, use_reloader=True)

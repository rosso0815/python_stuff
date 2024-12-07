from huey import SqliteHuey, crontab


import time

huey = SqliteHuey(filename="huey.db")


@huey.periodic_task(crontab(minute="*"))
def nightly_backup():
    print("scheduled by huey periodic")
    time.sleep(2)
    print("done")

@huey.pre_execute()
def pre_execute(task):
    print("pre_execute", task)

@huey.post_execute()
def post_execute(task, task_value, exc):
    print("post_execute", task, task_value, exc)


@huey.task()
def add(a, b):
    print(f"start huey task add a: {a} b: {b}")
    time.sleep(10)
    print("done huey task add")
    return a + b

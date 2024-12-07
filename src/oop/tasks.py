
import logging

log = logging.getLogger(__file__)

class TaskSayHi:
    def __init__(self):
        print("TaskSayHi")
        log.info("TaskSayHi init")

    def __str__(self):
        return "TaskSayHi"

    def validate(self, text):
        if "hi" in text:
            return True
        return False


class TaskSayBye:
    def __init__(self):
        log.info("TaskSayBye init")

    def __str__(self):
        return "TaskSayBye"

    def validate(self, text):
        if "bye" in text:
            return True
        return False


class TaskRegistry:
    def __init__(self):
        log.info("TaskRegistry Init")
        self.tasks = []

    def __del__(self):
        log.info("TaskRegistry delete")

    def add(self, task):
        log.info("TaskRegistryAdd")
        self.tasks.append(task)

    def list_tasks(self):
        for task in self.tasks:
            log.info("task = %s", task)

    def validate(self, text):
        log.info("validate %s", text)
        for task in self.tasks:
            log.info("task = %s", task)
            log.error("task = %s", task)

"""
FunctionObjects/CommandPattern.py
"""


class Loony():
    def execute(self):
        print("You're a loony.")


class NewBrain():
    def execute(self):
        print("You might even need a new brain.")


class Afford():
    def execute(self):
        print("I couldn't afford a whole new brain.")


class Macro:
    """
    An object that holds commands:
    """
    def __init__(self):
        self.commands = []

    def add(self, command):
        self.commands.append(command)

    def run(self):
        for c in self.commands:
            c.execute()


macro = Macro()
macro.add(Loony())
macro.add(NewBrain())
macro.add(Afford())
macro.run()

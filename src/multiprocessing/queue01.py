#! /usr/bin/env python3
"""Tbd"""

import multiprocessing as mp


class MyFancyClass:
    """Tbd"""

    def __init__(self, name):
        self.name = name

    def do_something(self):
        """Tbd"""
        proc_name = mp.current_process().name
        print(f'Doing something fancy in proc_name for self.name')


def worker(q):
    """Tbd"""
    while q.empty() is not True:
        print("@@@ worker does something")
        obj = q.get()
        obj.do_something()


if __name__ == "__main__":

    queue = mp.Queue()

    p = mp.Process(target=worker, args=(queue, ))

    p.start()

    queue.put(MyFancyClass("Tuggen"))
    queue.put(MyFancyClass("Andreas"))
    queue.put(MyFancyClass("Pfister"))

    # Wait for the worker to finish
    queue.close()
    queue.join_thread()
    p.join()

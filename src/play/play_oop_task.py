#! /usr/bin/env python3
"""Tbd"""

import logging
import sys


import oop as o

logging.basicConfig(stream=sys.stdout, level=logging.INFO)
log = logging.getLogger(__file__)

log.setLevel(logging.DEBUG)
handler = logging.StreamHandler(sys.stdout)
handler.setLevel(logging.DEBUG)
S_FORMAT = "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
formatter = logging.Formatter(S_FORMAT)
handler.setFormatter(formatter)
log.addHandler(handler)


def main():
    """Tbd"""
    log.info("start")
    o.a.t_bar()
    o.b.foo()
    t_bar = o.a.Bar()
    logging.info("a: %s", t_bar)
    # registry = o.tasks.TaskRegistry()
    # del registry
    # print('subtask end')
    # registry.add(t.TaskSayHi())
    # registry.add(t.TaskSayBye())
    # registry.list_tasks()
    # registry.validate("hi rosso")


if __name__ == "__main__":
    main()
    print('end reached')

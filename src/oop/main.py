#! /usr/bin/env python3

import logging
import sys

import tasks as t

logging.basicConfig(stream=sys.stdout, level=logging.INFO)
log = logging.getLogger(__file__)

# log.setLevel(logging.DEBUG)
# handler = logging.StreamHandler(sys.stdout)
# handler.setLevel(logging.DEBUG)
# formatter = logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s")
# handler.setFormatter(formatter)
# log.addHandler(handler)


def main():
    log.info("start")

    registry = t.TaskRegistry()
    del registry
    print('subtask end')
    # registry.add(t.TaskSayHi())
    # registry.add(t.TaskSayBye())
    # registry.list_tasks()
    # registry.validate("hi rosso")


if __name__ == "__main__":
    main()
    print('end reached')

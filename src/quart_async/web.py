"""Initialize Flask Application."""

import asyncio
import logging
# import random
# import time
import os
from queue import Queue

from quart import Quart, jsonify

app = Quart(__name__)

# logging.basicConfig(filename="logger.log", level=logging.DEBUG)
logging.basicConfig(level=logging.DEBUG)

tasks = {}


# async def getTasks():
#     print("getTasks")
#     return tm["tasks"]
async def sleepy(id):
    app.logger.info(f"sleepy id: {id}")
    # tasks[id]["status"] = "started"
    await asyncio.sleep(1)
    app.logger.info("sleepy done")


# os.sleep(1)
# print("sleepy done")
# tasks[id]["status"]="done"
# app.logger.info("finished sleepy")


@app.route("/task/<id>/<text>", methods=["GET"])
async def task_add(id, text):
    app.logger.info(f"task_add id: {id} text: {text}")
    app.add_background_task(sleepy, 1)
    # tasks["queue"].put_nowait(6)
    # if id in tasks:
    #     app.logger.info("found id in tasks")
    # app.logger.info("tasks[id]:",tasks[id])
    #     if tasks[id]["task"].done():
    #         return jsonify(msg=f'taskid {id} done')
    #     return jsonify(msg=f'taskid {id} found')
    # else:
    # tasks[id]={}
    # tasks[id]["task"]= asyncio.create_task(sleepy(id))
    # tasks["queue"].put_nowait(id)
    return jsonify(msg=f"taskid {id} added")
    # tasks = await getTasks()


async def worker(name, queue):
    app.logger.info("@@@ worker")
    while True:
        # Get a "work item" out of the queue.
        sleep_for = await queue.get()
        # Sleep for the "sleep_for" seconds.
        app.logger.info("sleep for %s", sleep_for)
        await asyncio.sleep(sleep_for)
        # Notify the queue that the "work item" has been processed.
        queue.task_done()
        # print(f"{name} has slept for {sleep_for:.2f} seconds")


def init_queue():
    app.logger.info("init_queue")
    # tasks["queue"] = asyncio.Queue()
    # tasks["queue"].put_nowait(2)
    # Create three worker tasks to process the queue concurrently.
    # tasks["worker"] = []
    # for i in range(3):
    #     tasks["worker"].append(
    #         asyncio.create_task(worker(f"worker-{i}", tasks["queue"])))
    # tasks["queue"].put_nowait(4)


@app.before_first_request
def main():
    app.logger.info("main")

    # asyncio.run(init_queue())
    # tasks["queue"] = asyncio.Queue()
    # tasks["queue"].put_nowait(2)
    # Create three worker tasks to process the queue concurrently.
    # tasks["worker"] = []
    # for i in range(3):
    # print(f"create worker {i}")
    # tasks["worker"].append(
    # asyncio.create_task(worker(f"worker-{i}", tasks["queue"])))
    # tasks["queue"].put_nowait(4)

    # Wait until the queue is fully processed.
    # started_at = time.monotonic()
    # await tasks["queue"].join()
    # total_slept_for = time.monotonic() - started_at

    # Cancel our worker tasks.
    # for task in tasks:
    #     task.cancel()
    # Wait until all worker tasks are cancelled.
    # await asyncio.gather(*tasks, return_exceptions=True)

    # print('====')
    # print(f'3 workers slept in parallel for {total_slept_for:.2f} seconds')
    # print(f'total expected sleep time: {total_sleep_time:.2f} seconds')


if __name__ == "__main__":
    app.logger.error("@@@ start")
    # asyncio.run(main())
    app.run(host="0.0.0.0", port=5002, debug=False)

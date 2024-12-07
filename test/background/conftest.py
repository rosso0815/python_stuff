"""Tbd"""

import asyncio
import pytest

import flasksimplerest as f

HOST = "127.0.0.1"

PORT = 8080


async def start():
    loop = asyncio.get_event_loop()
    try:
        f.app.run(host='0.0.0.0', port=PORT, debug=False)
    except:
        print("stop")
    finally:
        loop.close()


@ pytest.fixture(scope="session")
def event_loop():
    return asyncio.get_event_loop()


@ pytest.fixture(autouse=True, scope="session")
def server(event_loop):
    task = asyncio.ensure_future(start(), loop=event_loop)

    # Sleeps to allow the server boot-up.
    event_loop.run_until_complete(asyncio.sleep(1))

    try:
        yield
    finally:
        task.cancel()


# WS client example

import asyncio
import websockets


async def hello(name):
    uri = "ws://localhost:8080/myhandler"
    #uri = "ws://localhost:8765/hello"
    async with websockets.connect(uri) as websocket:

        await websocket.send(name)
        print(f"> {name}")

        #greeting = await websocket.recv()
        #print(f"< {greeting}")

asyncio.get_event_loop().run_until_complete(hello("peter"))
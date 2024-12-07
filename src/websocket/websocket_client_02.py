#! /usr/bin/env python

# see https://pypi.org/project/websocket_client/

import websocket
# import stomper

# try:
#     import thread
# except ImportError:
#     import _thread as thread
# import time


def on_message(ws, message):
    print("@@@ on_message =",message)


def on_error(ws, error):
    print("@@@ on_error =",error)


def on_close(ws):
    print("@@@ on_close")


def on_open(ws):
    print("@@@ on_open")
    # The magic happens here!
    #ws.send("CONNECT\naccept-version:1.0,1.1,2.0\n\n\x00\n")
    #sub = stomper.subscribe("/topic/greetings", "MyuniqueId", ack="auto")
    #ws.send(sub)

    # def run(*args):
    #     for i in range(3):
    #         time.sleep(1)
    #         ws.send("Hello %d" % i)
    #     time.sleep(1)
    #     ws.close()
    #     print("thread terminating...")
    # thread.start_new_thread(run, ())


if __name__ == "__main__":
    # url = "ws://localhost:8080/gs-guide-websocket"
    # url = "ws://localhost:8080/myhandler"
    # url = "ws://echo.websocket.org"
    url = "ws://localhost:8765"

    #websocket.enableTrace(True)
    ws = websocket.WebSocketApp(url=url,
                                on_message = on_message,
                                on_error = on_error,
                                on_close = on_close,
                                on_open = on_open)
    ws.run_forever()

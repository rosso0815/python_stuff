#! /usr/bin/env python3
"""
simple stomp server
"""

import time
import stomp


class MyListener(stomp.ConnectionListener):
    """
    listener
    """
    msg_list = []

    def __init__(self, conn):
        print("@@@ listener init")
        self.__conn = conn

    def on_error(self, headers, message):
        self.msg_list.append('(ERROR) ' + message)

    def on_message(self, headers, message):
        self.msg_list.append(message)


conn = stomp.Connection([('localhost', 61613)], heartbeats=(4000, 4000))
my_lst = MyListener(conn)
conn.set_listener('my_lst', my_lst)
conn.connect(wait=True)
conn.subscribe(destination='/queue/test', id='my_lst', ack='auto')

while True:
    time.sleep(10)
    messages = my_lst.msg_list
    print("@@@", messages)
    my_lst.msg_list = []


conn.disconnect()

from easymq.connect_mq import Connection
from easymq.listener import MQListener

# if you want send message
c = Connection(mq_username="admin", mq_password="admin", host_and_ports=[
               ("localhost", 61613)], dest="/queue/test", use_ssl=False, listener=None)
c.send("test_message")

# if you want receive message


class CustomListener(MQListener):
    def on_message(self, headers, body):
        print(body)


c = Connection(mq_username="admin", mq_password="admin", host_and_ports=[
               ("localhost", 61613)], dest="/queue/test", use_ssl=False, listener=CustomListener)
c.receive()

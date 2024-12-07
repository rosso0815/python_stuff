
import json
import stomp

print("@@@ send message")

x =  '{ "name":"John", "age":30, "city":"New York"}'
y = json.loads(x)

conn = stomp.Connection()

conn.connect(wait=True)

conn.send(body=str(y), destination='/queue/test')

conn.disconnect()

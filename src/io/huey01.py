import time
from huey import MemoryHuey,SqliteHuey

# huey = MemoryHuey(immediate=True)
huey = SqliteHuey(filename='huey.db')
# huey.start()

huey.immediate = True

@huey.task()
def add(a, b):
    # time.sleep(2)
    return a + b

print('start')

result = add.schedule((2,3),delay=2)

# result = add(2,2)
# # # print('r = %s' % r(blocking=True, timeout=5))
i=0
while i < 10:
    print('scheduled = %s' % huey.scheduled())
    print(f'i {i}')
    print(f'r = {result()}')
    # if r is not None:
    #     print(f'r.get {r}')
    #     i+10
    i=i+1
    time.sleep(1)
"""Tbd"""

from multiprocessing import Pool, Queue
import time


def f(x):
    return x * x


def task_sleep():
    """Tbd"""
    time.sleep(1)


if __name__ == '__main__':
    with Pool(5) as pool:
        print(pool.map(f, range(10)))
        result = pool.apply_async(task_sleep)
        print(f'result: {result}')
        result_fq = pool.apply_async(task_fill_queue, t_queue)

    print("Now the pool is closed and no longer available")

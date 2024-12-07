# content of test_sample.py

import logging


def inc(x):
    return x + 1


def test_answer():
    logging.info("test_answer")
    logging.error("test_answer")
    assert inc(3) == 4

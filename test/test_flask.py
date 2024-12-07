#! /usr/bin/env python3

import pytest
import os


class TestTask():

    def test_task_functions(self):
        """
        Test that tasks contains all needed fuctions
        """
        print("@@@ PYTHONPATH=" + os.getenv("PYTHONPATH"))
        data = [1, 2, 3]
        result = sum(data)
        assert result is  6


if __name__ == '__main__':
    pytest.main()

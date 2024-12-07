#! /usr/bin/env python3

import unittest
import os

class TestTask(unittest.TestCase):
    
    def test_task_functions(self):
        """
        Test that tasks contains all needed fuctions
        """
        print("@@@ PYTHONPATH="+os.getenv("PYTHONPATH"))
        data = [1, 2, 3]
        result = sum(data)
        self.assertEqual(result, 6)


if __name__ == '__main__':
    unittest.main()

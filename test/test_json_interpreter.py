#! /usr/bin/env python3

import json
import unittest

text = """
    [
        {
            "org_name": "org_1",
            "spaces": [
                {
                    "space_name": "space_1"
                }

            ]
        }
    ,
        {
            "org_name": "org_2",
            "spaces": []
        }
    ]
"""


class TestJsonInterpreter(unittest.TestCase):

    def test_task_functions(self):
        """
        Test that tasks contains all needed fuctions
        """

        orgs = json.loads(text)
        print("orgs %s", orgs)
        for org in orgs:
            print("org: %s", org)
            for space in org["spaces"]:
                print("space: %s", space["space_name"])


if __name__ == "__main__":
    unittest.main()

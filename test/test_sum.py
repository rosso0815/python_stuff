#! /usr/bin/env python3
"""
test of sum
"""
import unittest

import my_sum


def standart_sum() -> int:
    return 2


def standart_sum2():
    return 2, 2


class TestSum(unittest.TestCase):
    """
    test of sum
    """

    def test_list_int(self):
        """
        Test that it can sum a list of integers
        """
        result = my_sum.my_sum(1, 2)
        self.assertEqual(result, 3)

        result = my_sum.my_sum(2, standart_sum())
        self.assertEqual(result, 4)

        print(f"sum2: {standart_sum2()}")

        (sum1, sum2) = standart_sum2()
        result = my_sum.my_sum(sum1, sum2)
        self.assertEqual(result, 4)


if __name__ == "__main__":
    unittest.main()

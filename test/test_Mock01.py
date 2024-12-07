import unittest
from unittest.mock import MagicMock


class ProductionClass:
    def method(self):
        self.something(1, 2, 3)

    def something(self, a, b, c):
        pass


class TestMock(unittest.TestCase):
    def test_Mock01(self):
        """
        Test that it can sum a list of integers
        """
        real = ProductionClass()
        real.something = MagicMock()
        real.method()
        real.something.assert_called_once_with(1, 2, 3)


if __name__ == '__main__':
    unittest.main()

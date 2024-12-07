"""Tbd"""

import pytest


class Fruit:
    """Tbd"""

    def __init__(self, name):
        print("Fruit -> init")
        self.name = name

    def __del__(self):
        print("Fruit -> del")

    def __eq__(self, other):
        return self.name == other.name


class Shop:
    """Tbd"""

    def instance(self):
        print("instance")


@pytest.fixture
def seller(tmpdir):
    print(f"seller->sell:{tmpdir}")
    return Shop().instance()


@pytest.fixture
def shopping():
    """Tbd"""
    print("shop has open")
    s = Shop()
    yield s
    print("shop has closed")


@pytest.fixture
def my_fruit():
    """Tbd"""
    return Fruit("apple")


@pytest.fixture
def fruit_basket(my_fruit):
    """Tbd"""
    return [Fruit("banana"), my_fruit]


def test_my_fruit_in_basket(my_fruit, fruit_basket, shopping, seller):
    """Tbd"""
    # seller()
    # assert my_fruit in fruit_basket

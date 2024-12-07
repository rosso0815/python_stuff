"""Tbd"""

import logging

from oop.person import Person


class Car:
    """a base class for Cars"""

    def __init__(self, brand: str, speed: int, driver: Person) -> None:
        self.__brand = brand
        self.__speed = speed
        self.__driver = driver
        logging.info("self.__brand: %s", self.__brand)

    def __del__(self):
        print("destuctor of Car")

    def get_half_drive(self) -> float:
        """Tbd"""
        return self.__speed / 2

    def driver_say_hello(self):
        """Tbd"""
        return self.__driver.say_hello()

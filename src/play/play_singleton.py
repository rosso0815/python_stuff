#! /usr/bin/env python3.10
"""Tbd"""

# https://www.geeksforgeeks.org/singleton-pattern-in-python-a-complete-guide/

#  print("start")
#
#
#  class SingletonClass(object):
#      """Tbd"""
#
#      def __init__(self, name):
#          self.name = name
#
#      def __new__(cls, name):
#          if not hasattr(cls, 'instance'):
#              cls.instance = super(SingletonClass, cls).__new__(cls)
#          return cls.instance
#
#
#  singleton = SingletonClass(name="andreas")
#  new_singleton = SingletonClass(name="peter")
#
#  print(singleton is new_singleton)
#
#  #  singleton.singl_variable = "Singleton Variable"
#  print(new_singleton.name)
#  print(singleton.name)


class BorgSingleton(object):
    """Tbd"""
    _shared_borg_state = {}

    def __new__(cls, *args, **kwargs):
        obj = super(BorgSingleton, cls).__new__(cls, *args, **kwargs)
        obj.__dict__ = cls._shared_borg_state
        return obj


borg = BorgSingleton()
borg.shared_variable = "Shared Variable"
print(borg.shared_variable)


class NewChildBorg(BorgSingleton):
    _shared_borg_state = {}


newChildBorg = NewChildBorg()
print(newChildBorg.shared_variable)

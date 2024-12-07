#! /usr/bin/env python3
"""
test of json
"""
import json
from dataclasses import dataclass


@dataclass
class User:
    """Tbd"""
    firstname: str
    lastname: str


class UserEncoder(json.JSONEncoder):
    """Tbd"""

    def default(self, obj):
        if isinstance(obj, User):
            return obj.__dict__
        # Base class default() raises TypeError:
        return json.JSONEncoder.default(self, obj)

# def capital_case(x):
    # return x.capitalize()


def test_write_json():
    """Tbd"""
    json_user = User(firstname="andreas", lastname="pfister")
    print(f'ju: {json_user}')
    js = json.dumps(json_user, cls=UserEncoder, indent=2)
    print(f'js: {js}')
    jl = json.loads(js)
    print(f'jl: {js}')
    jb = User(**jl)
    print(f'jb: {jb}')

    # assert capital_case('semaphore') == 'Semaphore'

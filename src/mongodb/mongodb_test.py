#! /usr/bin/env python3

import os
from pymongo import MongoClient

from pprint import pprint

print("@@@ start")

client = MongoClient("mongodb://localhost:27017")
db = client.admin




# Issue the serverStatus command and print the results
serverStatusResult = db.command("serverStatus")
pprint(serverStatusResult)

print("@@@ finished")

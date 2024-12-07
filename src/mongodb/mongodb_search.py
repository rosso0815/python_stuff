#! /usr/bin/env python3

from pymongo import MongoClient
# from random import randint

client = MongoClient(port=27017)
db=client.business

fivestar = db.reviews.find_one({'rating': 5})
print(fivestar)

item_details = db.reviews.find({'rating': 4})
for item in item_details:
    print(item)
#! /usr/bin/env python3
import pprint
import openbrewerydb

pp = pprint.PrettyPrinter(indent=4)
data = openbrewerydb.load(state='wisconsin', brewery_type='micro')






pp.pprint(data)

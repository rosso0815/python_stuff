#! /usr/bin/env python3

import zeep

wsdl = 'http://localhost:9090/codenotfound/ws/helloworld?wsdl'

client = zeep.Client(wsdl=wsdl)

print(client.service.sayHello('andreas', 'rosso0815'))

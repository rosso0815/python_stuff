#! /usr/bin/env python3






import sys
import swagger_client
from swagger_client.rest import ApiException

print('sys.path %s' % sys.path)
configuration = swagger_client.Configuration()
# configuration.host = 'https://petstore3.swagger.io/api/v3'
configuration.debug = True

# api = swagger_client.PetApi(swagger_client.ApiClient(configuration))
api = swagger_client.ApiClient(configuration)

try:
    response = api.find_pets_by_status(status='available')
    print(response)
except ApiException as e:
    print("Exception %s", e)

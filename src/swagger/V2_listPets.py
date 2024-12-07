#! /usr/bin/env python3




import swagger_client
from swagger_client.rest import ApiException

configuration = swagger_client.Configuration()
configuration.host = "https://petstore.swagger.io/v2"
configuration.debug = True

api = swagger_client.PetApi(swagger_client.ApiClient(configuration))

try:
    status = "available"
    response = api.find_pets_by_status(status=['available'])
    print(response)
except ApiException as e:
    print("Exception %s", e)

# coding: utf-8

"""
    OpenAPI Petstore

    This is a sample server Petstore server. For this sample, you can use the api key `special-key` to test the authorization filters. For OAuth2 flow, you may use `user` as both username and password when asked to login.

    The version of the OpenAPI document: 1.0.0
    Generated by OpenAPI Generator (https://openapi-generator.tech)

    Do not edit the class manually.
"""  # noqa: E501


import unittest
import datetime

from openapi_client.models.pet import Pet  # noqa: E501

class TestPet(unittest.TestCase):
    """Pet unit test stubs"""

    def setUp(self):
        pass

    def tearDown(self):
        pass

    def make_instance(self, include_optional) -> Pet:
        """Test Pet
            include_option is a boolean, when False only required
            params are included, when True both required and
            optional params are included """
        # uncomment below to create an instance of `Pet`
        """
        model = Pet()  # noqa: E501
        if include_optional:
            return Pet(
                id = 56,
                category = {"name":"name","id":6},
                name = 'doggie',
                photo_urls = [
                    ''
                    ],
                tags = [
                    {"name":"name","id":1}
                    ],
                status = 'available'
            )
        else:
            return Pet(
                name = 'doggie',
                photo_urls = [
                    ''
                    ],
        )
        """

    def testPet(self):
        """Test Pet"""
        # inst_req_only = self.make_instance(include_optional=False)
        # inst_req_and_optional = self.make_instance(include_optional=True)

if __name__ == '__main__':
    unittest.main()

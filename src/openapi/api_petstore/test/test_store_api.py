# coding: utf-8

"""
    OpenAPI Petstore

    This is a sample server Petstore server. For this sample, you can use the api key `special-key` to test the authorization filters. For OAuth2 flow, you may use `user` as both username and password when asked to login.

    The version of the OpenAPI document: 1.0.0
    Generated by OpenAPI Generator (https://openapi-generator.tech)

    Do not edit the class manually.
"""  # noqa: E501


import unittest

from openapi_client.api.store_api import StoreApi  # noqa: E501


class TestStoreApi(unittest.TestCase):
    """StoreApi unit test stubs"""

    def setUp(self) -> None:
        self.api = StoreApi()  # noqa: E501

    def tearDown(self) -> None:
        pass

    def test_delete_order(self) -> None:
        """Test case for delete_order

        Delete purchase order by ID  # noqa: E501
        """
        pass

    def test_get_inventory(self) -> None:
        """Test case for get_inventory

        Returns pet inventories by status  # noqa: E501
        """
        pass

    def test_get_order_by_id(self) -> None:
        """Test case for get_order_by_id

        Find purchase order by ID  # noqa: E501
        """
        pass

    def test_place_order(self) -> None:
        """Test case for place_order

        Place an order for a pet  # noqa: E501
        """
        pass


if __name__ == '__main__':
    unittest.main()

# coding: utf-8

"""
    Swagger Petstore - OpenAPI 3.0

    This is a sample Pet Store Server based on the OpenAPI 3.0 specification.  You can find out more about Swagger at [http://swagger.io](http://swagger.io). In the third iteration of the pet store, we've switched to the design first approach! You can now help us improve the API whether it's by making changes to the definition itself or to the code. That way, with time, we can improve the API in general, and expose some of the new features in OAS3.  Some useful links: - [The Pet Store repository](https://github.com/swagger-api/swagger-petstore) - [The source API definition for the Pet Store](https://github.com/swagger-api/swagger-petstore/blob/master/src/main/resources/openapi.yaml)  # noqa: E501

    OpenAPI spec version: 1.0.9
    Contact: apiteam@swagger.io
    Generated by: https://github.com/swagger-api/swagger-codegen.git
"""

from __future__ import absolute_import

import re  # noqa: F401

# python 2 and python 3 compatibility library
import six

from swagger_client.api_client import ApiClient


class UserApi(object):
    """NOTE: This class is auto generated by the swagger code generator program.

    Do not edit the class manually.
    Ref: https://github.com/swagger-api/swagger-codegen
    """

    def __init__(self, api_client=None):
        if api_client is None:
            api_client = ApiClient()
        self.api_client = api_client

    def create_user(self, **kwargs):  # noqa: E501
        """Create user  # noqa: E501

        This can only be done by the logged in user.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.create_user(async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param User body: Created user object
        :return: User
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.create_user_with_http_info(**kwargs)  # noqa: E501
        else:
            (data) = self.create_user_with_http_info(**kwargs)  # noqa: E501
            return data

    def create_user_with_http_info(self, **kwargs):  # noqa: E501
        """Create user  # noqa: E501

        This can only be done by the logged in user.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.create_user_with_http_info(async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param User body: Created user object
        :return: User
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = ['body']  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method create_user" % key
                )
            params[key] = val
        del params['kwargs']

        collection_formats = {}

        path_params = {}

        query_params = []

        header_params = {}

        form_params = []
        local_var_files = {}
        if 'id' in params:
            form_params.append(('id', params['id']))  # noqa: E501
        if 'username' in params:
            form_params.append(('username', params['username']))  # noqa: E501
        if 'first_name' in params:
            form_params.append(('firstName', params['first_name']))  # noqa: E501
        if 'last_name' in params:
            form_params.append(('lastName', params['last_name']))  # noqa: E501
        if 'email' in params:
            form_params.append(('email', params['email']))  # noqa: E501
        if 'password' in params:
            form_params.append(('password', params['password']))  # noqa: E501
        if 'phone' in params:
            form_params.append(('phone', params['phone']))  # noqa: E501
        if 'user_status' in params:
            form_params.append(('userStatus', params['user_status']))  # noqa: E501

        body_params = None
        if 'body' in params:
            body_params = params['body']
        # HTTP header `Accept`
        header_params['Accept'] = self.api_client.select_header_accept(
            ['application/json', 'application/xml'])  # noqa: E501

        # HTTP header `Content-Type`
        header_params['Content-Type'] = self.api_client.select_header_content_type(  # noqa: E501
            ['application/json', 'application/xml', 'application/x-www-form-urlencoded'])  # noqa: E501

        # Authentication setting
        auth_settings = []  # noqa: E501

        return self.api_client.call_api(
            '/user', 'POST',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type='User',  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)

    def create_user(self, **kwargs):  # noqa: E501
        """Create user  # noqa: E501

        This can only be done by the logged in user.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.create_user(async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param int id:
        :param str username:
        :param str first_name:
        :param str last_name:
        :param str email:
        :param str password:
        :param str phone:
        :param int user_status:
        :return: User
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.create_user_with_http_info(**kwargs)  # noqa: E501
        else:
            (data) = self.create_user_with_http_info(**kwargs)  # noqa: E501
            return data

    def create_user_with_http_info(self, **kwargs):  # noqa: E501
        """Create user  # noqa: E501

        This can only be done by the logged in user.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.create_user_with_http_info(async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param int id:
        :param str username:
        :param str first_name:
        :param str last_name:
        :param str email:
        :param str password:
        :param str phone:
        :param int user_status:
        :return: User
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = ['id', 'username', 'first_name', 'last_name', 'email', 'password', 'phone', 'user_status']  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method create_user" % key
                )
            params[key] = val
        del params['kwargs']

        collection_formats = {}

        path_params = {}

        query_params = []

        header_params = {}

        form_params = []
        local_var_files = {}
        if 'id' in params:
            form_params.append(('id', params['id']))  # noqa: E501
        if 'username' in params:
            form_params.append(('username', params['username']))  # noqa: E501
        if 'first_name' in params:
            form_params.append(('firstName', params['first_name']))  # noqa: E501
        if 'last_name' in params:
            form_params.append(('lastName', params['last_name']))  # noqa: E501
        if 'email' in params:
            form_params.append(('email', params['email']))  # noqa: E501
        if 'password' in params:
            form_params.append(('password', params['password']))  # noqa: E501
        if 'phone' in params:
            form_params.append(('phone', params['phone']))  # noqa: E501
        if 'user_status' in params:
            form_params.append(('userStatus', params['user_status']))  # noqa: E501

        body_params = None
        if 'body' in params:
            body_params = params['body']
        # HTTP header `Accept`
        header_params['Accept'] = self.api_client.select_header_accept(
            ['application/json', 'application/xml'])  # noqa: E501

        # HTTP header `Content-Type`
        header_params['Content-Type'] = self.api_client.select_header_content_type(  # noqa: E501
            ['application/json', 'application/xml', 'application/x-www-form-urlencoded'])  # noqa: E501

        # Authentication setting
        auth_settings = []  # noqa: E501

        return self.api_client.call_api(
            '/user', 'POST',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type='User',  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)

    def create_users_with_list_input(self, **kwargs):  # noqa: E501
        """Creates list of users with given input array  # noqa: E501

        Creates list of users with given input array  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.create_users_with_list_input(async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param list[User] body:
        :return: User
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.create_users_with_list_input_with_http_info(**kwargs)  # noqa: E501
        else:
            (data) = self.create_users_with_list_input_with_http_info(**kwargs)  # noqa: E501
            return data

    def create_users_with_list_input_with_http_info(self, **kwargs):  # noqa: E501
        """Creates list of users with given input array  # noqa: E501

        Creates list of users with given input array  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.create_users_with_list_input_with_http_info(async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param list[User] body:
        :return: User
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = ['body']  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method create_users_with_list_input" % key
                )
            params[key] = val
        del params['kwargs']

        collection_formats = {}

        path_params = {}

        query_params = []

        header_params = {}

        form_params = []
        local_var_files = {}

        body_params = None
        if 'body' in params:
            body_params = params['body']
        # HTTP header `Accept`
        header_params['Accept'] = self.api_client.select_header_accept(
            ['application/xml', 'application/json'])  # noqa: E501

        # HTTP header `Content-Type`
        header_params['Content-Type'] = self.api_client.select_header_content_type(  # noqa: E501
            ['application/json'])  # noqa: E501

        # Authentication setting
        auth_settings = []  # noqa: E501

        return self.api_client.call_api(
            '/user/createWithList', 'POST',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type='User',  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)

    def delete_user(self, username, **kwargs):  # noqa: E501
        """Delete user  # noqa: E501

        This can only be done by the logged in user.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.delete_user(username, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str username: The name that needs to be deleted (required)
        :return: None
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.delete_user_with_http_info(username, **kwargs)  # noqa: E501
        else:
            (data) = self.delete_user_with_http_info(username, **kwargs)  # noqa: E501
            return data

    def delete_user_with_http_info(self, username, **kwargs):  # noqa: E501
        """Delete user  # noqa: E501

        This can only be done by the logged in user.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.delete_user_with_http_info(username, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str username: The name that needs to be deleted (required)
        :return: None
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = ['username']  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method delete_user" % key
                )
            params[key] = val
        del params['kwargs']
        # verify the required parameter 'username' is set
        if ('username' not in params or
                params['username'] is None):
            raise ValueError("Missing the required parameter `username` when calling `delete_user`")  # noqa: E501

        collection_formats = {}

        path_params = {}
        if 'username' in params:
            path_params['username'] = params['username']  # noqa: E501

        query_params = []

        header_params = {}

        form_params = []
        local_var_files = {}

        body_params = None
        # Authentication setting
        auth_settings = []  # noqa: E501

        return self.api_client.call_api(
            '/user/{username}', 'DELETE',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type=None,  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)

    def get_user_by_name(self, username, **kwargs):  # noqa: E501
        """Get user by user name  # noqa: E501

        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.get_user_by_name(username, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str username: The name that needs to be fetched. Use user1 for testing.  (required)
        :return: User
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.get_user_by_name_with_http_info(username, **kwargs)  # noqa: E501
        else:
            (data) = self.get_user_by_name_with_http_info(username, **kwargs)  # noqa: E501
            return data

    def get_user_by_name_with_http_info(self, username, **kwargs):  # noqa: E501
        """Get user by user name  # noqa: E501

        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.get_user_by_name_with_http_info(username, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str username: The name that needs to be fetched. Use user1 for testing.  (required)
        :return: User
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = ['username']  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method get_user_by_name" % key
                )
            params[key] = val
        del params['kwargs']
        # verify the required parameter 'username' is set
        if ('username' not in params or
                params['username'] is None):
            raise ValueError("Missing the required parameter `username` when calling `get_user_by_name`")  # noqa: E501

        collection_formats = {}

        path_params = {}
        if 'username' in params:
            path_params['username'] = params['username']  # noqa: E501

        query_params = []

        header_params = {}

        form_params = []
        local_var_files = {}

        body_params = None
        # HTTP header `Accept`
        header_params['Accept'] = self.api_client.select_header_accept(
            ['application/xml', 'application/json'])  # noqa: E501

        # Authentication setting
        auth_settings = []  # noqa: E501

        return self.api_client.call_api(
            '/user/{username}', 'GET',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type='User',  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)

    def login_user(self, **kwargs):  # noqa: E501
        """Logs user into the system  # noqa: E501

        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.login_user(async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str username: The user name for login
        :param str password: The password for login in clear text
        :return: str
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.login_user_with_http_info(**kwargs)  # noqa: E501
        else:
            (data) = self.login_user_with_http_info(**kwargs)  # noqa: E501
            return data

    def login_user_with_http_info(self, **kwargs):  # noqa: E501
        """Logs user into the system  # noqa: E501

        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.login_user_with_http_info(async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str username: The user name for login
        :param str password: The password for login in clear text
        :return: str
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = ['username', 'password']  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method login_user" % key
                )
            params[key] = val
        del params['kwargs']

        collection_formats = {}

        path_params = {}

        query_params = []
        if 'username' in params:
            query_params.append(('username', params['username']))  # noqa: E501
        if 'password' in params:
            query_params.append(('password', params['password']))  # noqa: E501

        header_params = {}

        form_params = []
        local_var_files = {}

        body_params = None
        # HTTP header `Accept`
        header_params['Accept'] = self.api_client.select_header_accept(
            ['application/xml', 'application/json'])  # noqa: E501

        # Authentication setting
        auth_settings = []  # noqa: E501

        return self.api_client.call_api(
            '/user/login', 'GET',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type='str',  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)

    def logout_user(self, **kwargs):  # noqa: E501
        """Logs out current logged in user session  # noqa: E501

        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.logout_user(async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :return: None
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.logout_user_with_http_info(**kwargs)  # noqa: E501
        else:
            (data) = self.logout_user_with_http_info(**kwargs)  # noqa: E501
            return data

    def logout_user_with_http_info(self, **kwargs):  # noqa: E501
        """Logs out current logged in user session  # noqa: E501

        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.logout_user_with_http_info(async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :return: None
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = []  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method logout_user" % key
                )
            params[key] = val
        del params['kwargs']

        collection_formats = {}

        path_params = {}

        query_params = []

        header_params = {}

        form_params = []
        local_var_files = {}

        body_params = None
        # Authentication setting
        auth_settings = []  # noqa: E501

        return self.api_client.call_api(
            '/user/logout', 'GET',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type=None,  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)

    def update_user(self, username, **kwargs):  # noqa: E501
        """Update user  # noqa: E501

        This can only be done by the logged in user.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.update_user(username, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str username: name that need to be deleted (required)
        :param User body: Update an existent user in the store
        :return: None
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.update_user_with_http_info(username, **kwargs)  # noqa: E501
        else:
            (data) = self.update_user_with_http_info(username, **kwargs)  # noqa: E501
            return data

    def update_user_with_http_info(self, username, **kwargs):  # noqa: E501
        """Update user  # noqa: E501

        This can only be done by the logged in user.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.update_user_with_http_info(username, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str username: name that need to be deleted (required)
        :param User body: Update an existent user in the store
        :return: None
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = ['username', 'body']  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method update_user" % key
                )
            params[key] = val
        del params['kwargs']
        # verify the required parameter 'username' is set
        if ('username' not in params or
                params['username'] is None):
            raise ValueError("Missing the required parameter `username` when calling `update_user`")  # noqa: E501

        collection_formats = {}

        path_params = {}
        if 'username' in params:
            path_params['username'] = params['username']  # noqa: E501

        query_params = []

        header_params = {}

        form_params = []
        local_var_files = {}
        if 'id' in params:
            form_params.append(('id', params['id']))  # noqa: E501
        if 'username' in params:
            form_params.append(('username', params['username']))  # noqa: E501
        if 'first_name' in params:
            form_params.append(('firstName', params['first_name']))  # noqa: E501
        if 'last_name' in params:
            form_params.append(('lastName', params['last_name']))  # noqa: E501
        if 'email' in params:
            form_params.append(('email', params['email']))  # noqa: E501
        if 'password' in params:
            form_params.append(('password', params['password']))  # noqa: E501
        if 'phone' in params:
            form_params.append(('phone', params['phone']))  # noqa: E501
        if 'user_status' in params:
            form_params.append(('userStatus', params['user_status']))  # noqa: E501

        body_params = None
        if 'body' in params:
            body_params = params['body']
        # HTTP header `Content-Type`
        header_params['Content-Type'] = self.api_client.select_header_content_type(  # noqa: E501
            ['application/json', 'application/xml', 'application/x-www-form-urlencoded'])  # noqa: E501

        # Authentication setting
        auth_settings = []  # noqa: E501

        return self.api_client.call_api(
            '/user/{username}', 'PUT',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type=None,  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)

    def update_user(self, username, **kwargs):  # noqa: E501
        """Update user  # noqa: E501

        This can only be done by the logged in user.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.update_user(username, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str username: name that need to be deleted (required)
        :param int id:
        :param str username2:
        :param str first_name:
        :param str last_name:
        :param str email:
        :param str password:
        :param str phone:
        :param int user_status:
        :return: None
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.update_user_with_http_info(username, **kwargs)  # noqa: E501
        else:
            (data) = self.update_user_with_http_info(username, **kwargs)  # noqa: E501
            return data

    def update_user_with_http_info(self, username, **kwargs):  # noqa: E501
        """Update user  # noqa: E501

        This can only be done by the logged in user.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.update_user_with_http_info(username, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str username: name that need to be deleted (required)
        :param int id:
        :param str username2:
        :param str first_name:
        :param str last_name:
        :param str email:
        :param str password:
        :param str phone:
        :param int user_status:
        :return: None
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = ['username', 'id', 'username2', 'first_name', 'last_name', 'email', 'password', 'phone', 'user_status']  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method update_user" % key
                )
            params[key] = val
        del params['kwargs']
        # verify the required parameter 'username' is set
        if ('username' not in params or
                params['username'] is None):
            raise ValueError("Missing the required parameter `username` when calling `update_user`")  # noqa: E501

        collection_formats = {}

        path_params = {}
        if 'username' in params:
            path_params['username'] = params['username']  # noqa: E501

        query_params = []

        header_params = {}

        form_params = []
        local_var_files = {}
        if 'id' in params:
            form_params.append(('id', params['id']))  # noqa: E501
        if 'username' in params:
            form_params.append(('username', params['username']))  # noqa: E501
        if 'first_name' in params:
            form_params.append(('firstName', params['first_name']))  # noqa: E501
        if 'last_name' in params:
            form_params.append(('lastName', params['last_name']))  # noqa: E501
        if 'email' in params:
            form_params.append(('email', params['email']))  # noqa: E501
        if 'password' in params:
            form_params.append(('password', params['password']))  # noqa: E501
        if 'phone' in params:
            form_params.append(('phone', params['phone']))  # noqa: E501
        if 'user_status' in params:
            form_params.append(('userStatus', params['user_status']))  # noqa: E501

        body_params = None
        if 'body' in params:
            body_params = params['body']
        # HTTP header `Content-Type`
        header_params['Content-Type'] = self.api_client.select_header_content_type(  # noqa: E501
            ['application/json', 'application/xml', 'application/x-www-form-urlencoded'])  # noqa: E501

        # Authentication setting
        auth_settings = []  # noqa: E501

        return self.api_client.call_api(
            '/user/{username}', 'PUT',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type=None,  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)
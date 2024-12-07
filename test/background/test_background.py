"""Tbd"""

import logging
import asyncio
import pytest

from .conftest import HOST, PORT


# @pytest.mark.asyncio
# async def test_http_request():
#     """Tbd"""
#     # You can use anything to query the server - httpx, aiohttp, etc.
#     # Using native code for the sake of example.
#     reader, writer = await asyncio.open_connection(HOST, PORT)
#     writer.write(b"GET / HTTP/1.1\r\nHost: example.com\r\n\r\n")
#     data = await reader.read(1024)
#     logging.info("data: %s", data)
#     assert data.startswith(b"HTTP/1.1 200 OK\r\n")
#     writer.close()
#     await writer.wait_closed()

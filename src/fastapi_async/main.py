from typing import Union

from fastapi import FastAPI
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware
# from supertokens_fastapi import get_cors_allowed_headers

import logging
import asyncio
import time

app = FastAPI()

origins = ["http://localhost:8020"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


class Item(BaseModel):
    name: str
    price: float
    is_offer: Union[bool, None] = None


async def sleepy():
    logging.error('@@@ sleepy start')
    await asyncio.sleep(10)
    logging.error('@@@ sleepy done')


@app.get("/")
async def read_root():
    logging.error('@@@ read_root')
    # await asyncio.sleep(5)
    # time.sleep(5)
    # time.sleep(5)
    # asyncio.create_task(sleepy())
    return {"Hello": "World"}


@app.get("/api/call1")
async def get_api_call1():
    return {"item_id": 1}


@app.get("/items/{item_id}")
async def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}


@app.put("/items/{item_id}")
async def update_item(item_id: int, item: Item):
    return {"item_name": item.name, "item_id": item_id}

# uvicorn main:app --reload --port 8020

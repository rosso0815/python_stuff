# copyright 2019-2021 peter mooring all rights reserved peterpm@xs4all.nl peter@petermooring.com
# model.py

from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, ForeignKey, Integer, String, Table
from sqlalchemy.orm import relationship

Base = declarative_base()

# many-to-many link table
friend_mtm_hobby_table = Table(
    'friend_mtm_hobby',
    Base.metadata,
    Column('friend_id', Integer, ForeignKey('friend.id')),
    Column('hobby_id', Integer, ForeignKey('hobby.id'))
)

class Friend(Base):
    __tablename__ = 'friend'

    id = Column(Integer, primary_key=True)
    name = Column(String(100), server_default='')

    city_id = Column(Integer, ForeignKey('city.id'))
    city = relationship(
        'City',
        back_populates='friends',
    )

    hobbies = relationship(
        'Hobby',
        secondary=friend_mtm_hobby_table,
        back_populates='friends',
        order_by=lambda: Hobby.name,
    )

class City(Base):
    __tablename__ = 'city'

    id = Column(Integer, primary_key=True)
    name = Column(String(100), server_default='')

    friends = relationship(
        'Friend',
        back_populates='city',
        order_by=Friend.name,
    )

class Hobby(Base):
    __tablename__ = 'hobby'

    id = Column(Integer, primary_key=True)
    name = Column(String(100), server_default='')

    friends = relationship(
        'Friend',
        secondary=friend_mtm_hobby_table,
        back_populates='hobbies',
        order_by=Friend.name,
    )



from flask_mongoengine import MongoEngine



class User(MongoEngine.__init__.Document):
    name = db.StringField()
    email = db.StringField()
    def to_json(self):
        return {"name": self.name,
                "email": self.email}

#! /usr/bin/env python3


from mongoengine import connect, Document, StringField, ReferenceField


class User(Document):
    email = StringField(required=True)
    first_name = StringField(max_length=50)
    last_name = StringField(max_length=50)


class Post(Document):
    title = StringField(max_length=120, required=True)
    author = ReferenceField(User)

    meta = {"allow_inheritance": True}


class TextPost(Post):
    content = StringField()


class ImagePost(Post):
    image_path = StringField()


class LinkPost(Post):
    link_url = StringField()


print("start")
connect("tumblelog")
ross = User(email="ross@example.com", first_name="Ross", last_name="Lawley").save()

post1 = TextPost(title="Fun with MongoEngine", author=ross)
post1.content = "Took a look at MongoEngine today, looks pretty cool."
post1.tags = ["mongodb", "mongoengine"]
post1.save()

post2 = LinkPost(title="MongoEngine Documentation", author=ross)
post2.link_url = "http://docs.mongoengine.com/"
post2.tags = ["mongoengine"]
post2.save()


print("finish")

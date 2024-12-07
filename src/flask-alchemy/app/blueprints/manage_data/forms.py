# copyright 2019-2021 peter mooring all rights reserved peterpm@xs4all.nl peter@petermooring.com
# forms.py

from flask_wtf import FlaskForm
from wtforms import IntegerField, StringField, SubmitField
from wtforms_sqlalchemy.fields import QuerySelectField, QuerySelectMultipleField
from wtforms.validators import InputRequired, Length

from app.services import app_db
from app.model import Friend, City, Hobby

# friend
class FriendNewEditFormMixin():

    name = StringField('Name',
        validators=[ InputRequired(), Length(min=2) ])

    city = QuerySelectField('City',
        get_label='name',
        allow_blank=False,
        render_kw={'size': 1},
        )

    hobbies = QuerySelectMultipleField('Hobbies',
        get_label='name',
        allow_blank=False,
        render_kw={'size': 10},
        )

class FriendNewForm(FlaskForm, FriendNewEditFormMixin):

    submit = SubmitField('Add')

class FriendEditForm(FlaskForm, FriendNewEditFormMixin):

    submit = SubmitField('Update')

class FriendDeleteForm(FlaskForm):

    submit = SubmitField('Confirm delete')

# city
class CityNewEditFormMixin():

    name = StringField('Name',
        validators=[ InputRequired(), Length(min=2) ])

class CityNewForm(FlaskForm, CityNewEditFormMixin):

    submit = SubmitField('Add')

class CityEditForm(FlaskForm, CityNewEditFormMixin):

    submit = SubmitField('Update')

class CityDeleteForm(FlaskForm):

    submit = SubmitField('Confirm delete')

# hobby
class HobbyNewEditFormMixin():

    name = StringField('Name',
        validators=[ InputRequired(), Length(min=2) ])

class HobbyNewForm(FlaskForm, HobbyNewEditFormMixin):

    submit = SubmitField('Add')

class HobbyEditForm(FlaskForm, HobbyNewEditFormMixin):

    submit = SubmitField('Update')

class HobbyDeleteForm(FlaskForm):

    submit = SubmitField('Confirm delete')


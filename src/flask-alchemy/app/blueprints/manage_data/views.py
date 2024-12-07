# copyright 2019-2021 peter mooring all rights reserved peterpm@xs4all.nl peter@petermooring.com
# views.py

from flask import Flask, Blueprint, current_app, g, session, request, url_for, redirect, \
    render_template, flash, abort

from app.services import app_db
from app.model import Friend, City, Hobby
from .forms import (
    FriendNewForm, FriendEditForm, FriendDeleteForm,
    CityNewForm, CityEditForm, CityDeleteForm,
    HobbyNewForm, HobbyEditForm, HobbyDeleteForm,
)


manage_data_blueprint = Blueprint('manage_data', __name__)


@manage_data_blueprint.route('/friends/list', methods=['GET', 'POST'])
def friends_list():

    friends = app_db.session.query(Friend).order_by(Friend.name).all()

    thead_th_items = [
        {
            'col_title': '#',
        },
        {
            'col_title': 'Name',
        },
        {
            'col_title': 'City',
        },
        {
            'col_title': 'Hobbies',
        },
        {
            'col_title': 'Delete',
        },
    ]

    tbody_tr_items = []
    for friend in friends:
        city_name = '-'
        if friend.city:
            city_name = friend.city.name
        hobby_names = '-'
        if friend.hobbies:
            hobby_names = ', '.join([x.name for x in friend.hobbies])

        tbody_tr_items.append([
            {
                'col_value': friend.id,
            },
            {
                'col_value': friend.name,
                'url': url_for('manage_data.friend_edit', friend_id=friend.id),
            },
            {
                'col_value': city_name,
            },
            {
                'col_value': hobby_names,
            },
            {
                'col_value': 'delete',
                'url': url_for('manage_data.friend_delete', friend_id=friend.id),
            }
        ])

    return render_template(
        'items_list.html',
        title='Friends',
        thead_th_items=thead_th_items,
        tbody_tr_items=tbody_tr_items,
        item_new_url=url_for('manage_data.friend_new'),
        item_new_text='New friend',
    )

@manage_data_blueprint.route('/cities/list', methods=['GET', 'POST'])
def cities_list():

    cities = app_db.session.query(City).order_by(City.name).all()

    thead_th_items = [
        {
            'col_title': '#',
        },
        {
            'col_title': 'City',
        },
        {
            'col_title': 'Friends',
        },
        {
            'col_title': 'Delete',
        },
    ]

    tbody_tr_items = []
    for city in cities:
        friend_names = ''
        if city.friends:
            friend_names = ', '.join([x.name for x in city.friends])

        tbody_tr_items.append([
            {
                'col_value': city.id,
            },
            {
                'col_value': city.name,
                'url': url_for('manage_data.city_edit', city_id=city.id),
            },
            {
                'col_value': friend_names,
            },
            {
                'col_value': 'delete',
                'url': url_for('manage_data.city_delete', city_id=city.id),
            }
        ])
    
    return render_template(
        'items_list.html',
        title='Cities',
        thead_th_items=thead_th_items,
        tbody_tr_items=tbody_tr_items,
        item_new_url=url_for('manage_data.city_new'),
        item_new_text='New city',
    )

@manage_data_blueprint.route('/hobbies/list', methods=['GET', 'POST'])
def hobbies_list():

    hobbies = app_db.session.query(Hobby).order_by(Hobby.name).all()

    thead_th_items = [
        {
            'col_title': '#',
        },
        {
            'col_title': 'Name',
        },
        {
            'col_title': 'Friends',
        },
        {
            'col_title': 'Delete',
        },
    ]

    tbody_tr_items = []
    for hobby in hobbies:
        friend_names = ''
        if hobby.friends:
            friend_names = ', '.join([x.name for x in hobby.friends])
        tbody_tr_items.append([
            {
                'col_value': hobby.id,
            },
            {
                'col_value': hobby.name,
                'url': url_for('manage_data.hobby_edit', hobby_id=hobby.id),
            },
            {
                'col_value': friend_names,
            },
            {
                'col_value': 'delete',
                'url': url_for('manage_data.hobby_delete', hobby_id=hobby.id),
            }
        ])

    return render_template(
        'items_list.html',
        title='Hobbies',
        thead_th_items=thead_th_items,
        tbody_tr_items=tbody_tr_items,
        item_new_url=url_for('manage_data.hobby_new'),
        item_new_text='New hobby',
    )

@manage_data_blueprint.route('/friend/new', methods=['GET', 'POST'])
def friend_new():

    item = Friend()
    form = FriendNewForm()
    form.city.query = app_db.session.query(City).order_by(City.name)
    form.hobbies.query = app_db.session.query(Hobby).order_by(Hobby.name)

    if form.validate_on_submit():
        form.populate_obj(item)
        app_db.session.add(item)
        app_db.session.commit()
        flash('Friend added: ' + item.name, 'info')
        return redirect(url_for('manage_data.friends_list'))

    return render_template('item_new_edit.html', title='New friend', form=form)

@manage_data_blueprint.route('/friend/edit/<int:friend_id>', methods=['GET', 'POST'])
def friend_edit(friend_id):

    item = app_db.session.query(Friend).filter(Friend.id == friend_id).first()
    if item is None:
        abort(403)

    form = FriendEditForm(obj=item)
    form.city.query = app_db.session.query(City).order_by(City.name)
    form.hobbies.query = app_db.session.query(Hobby).order_by(Hobby.name)

    if form.validate_on_submit():
        form.populate_obj(item)
        app_db.session.commit()
        flash('Friend updated: ' + item.name, 'info')
        return redirect(url_for('manage_data.friends_list'))

    return render_template('item_new_edit.html', title='Edit friend', form=form)

@manage_data_blueprint.route('/friend/delete/<int:friend_id>', methods=['GET', 'POST'])
def friend_delete(friend_id):

    item = app_db.session.query(Friend).filter(Friend.id == friend_id).first()
    if item is None:
        abort(403)

    form = FriendDeleteForm(obj=item)

    item_name = item.name
    if form.validate_on_submit():
        app_db.session.delete(item)
        app_db.session.commit()
        flash('Deleted friend: ' + item_name, 'info')
        return redirect(url_for('manage_data.friends_list'))

    return render_template('item_delete.html', title='Delete friend', item_name=item_name, form=form)

@manage_data_blueprint.route('/city/new', methods=['GET', 'POST'])
def city_new():

    item = City()
    form = CityNewForm()

    if form.validate_on_submit():
        form.populate_obj(item)
        app_db.session.add(item)
        app_db.session.commit()
        flash('City added: ' + item.name, 'info')
        return redirect(url_for('manage_data.cities_list'))

    return render_template('item_new_edit.html', title='New city', form=form)

@manage_data_blueprint.route('/city/edit/<int:city_id>', methods=['GET', 'POST'])
def city_edit(city_id):

    item = app_db.session.query(City).filter(City.id == city_id).first()
    if item is None:
        abort(403)

    form = CityEditForm(obj=item)

    if form.validate_on_submit():
        form.populate_obj(item)
        app_db.session.commit()
        flash('City updated: ' + item.name, 'info')
        return redirect(url_for('manage_data.cities_list'))

    return render_template('item_new_edit.html', title='Edit city', form=form)

@manage_data_blueprint.route('/city/delete/<int:city_id>', methods=['GET', 'POST'])
def city_delete(city_id):

    item = app_db.session.query(City).filter(City.id == city_id).first()
    if item is None:
        abort(403)

    form = CityDeleteForm(obj=item)

    item_name = item.name
    if form.validate_on_submit():
        app_db.session.delete(item)
        app_db.session.commit()
        flash('Deleted city: ' + item_name, 'info')
        return redirect(url_for('manage_data.cities_list'))

    return render_template('item_delete.html', title='Delete city', item_name=item_name, form=form)

@manage_data_blueprint.route('/hobby/new', methods=['GET', 'POST'])
def hobby_new():

    item = Hobby()
    form = HobbyNewForm()

    if form.validate_on_submit():
        form.populate_obj(item)
        app_db.session.add(item)
        app_db.session.commit()
        flash('Hobby added: ' + item.name, 'info')
        return redirect(url_for('manage_data.hobbies_list'))

    return render_template('item_new_edit.html', title='New hobby', form=form)

@manage_data_blueprint.route('/hobby/edit/<int:hobby_id>', methods=['GET', 'POST'])
def hobby_edit(hobby_id):

    item = app_db.session.query(Hobby).filter(Hobby.id == hobby_id).first()
    if item is None:
        abort(403)

    form = HobbyEditForm(obj=item)

    if form.validate_on_submit():
        form.populate_obj(item)
        app_db.session.commit()
        flash('Hobby updated: ' + item.name, 'info')
        return redirect(url_for('manage_data.hobbies_list'))

    return render_template('item_new_edit.html', title='Edit hobby', form=form)

@manage_data_blueprint.route('/hobby/delete/<int:hobby_id>', methods=['GET', 'POST'])
def hobby_delete(hobby_id):

    item = app_db.session.query(Hobby).filter(Hobby.id == hobby_id).first()
    if item is None:
        abort(403)

    form = HobbyDeleteForm(obj=item)

    item_name = item.name
    if form.validate_on_submit():
        app_db.session.delete(item)
        app_db.session.commit()
        flash('Deleted hobby: ' + item_name, 'info')
        return redirect(url_for('manage_data.hobbies_list'))

    return render_template('item_delete.html', title='Delete hobby', item_name=item_name, form=form)

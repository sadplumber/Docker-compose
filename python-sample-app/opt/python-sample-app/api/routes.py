from flask import request, jsonify, abort
import json
from api import api, db
from api.models import User

@api.route('/')
def hello():
    return "Hello World!"


@api.route('/api/user', methods=['GET'])
def get_users():
    users = User.query.all()
    res = []

    for record in users:
        obj = {
            'id': record.id,
            'username': record.username,
            'email': record.email,
            'password_hash': record.password_hash
        }
        res.append(obj)

    response = jsonify(res)
    return response, 200


@api.route('/api/user', methods=['POST'])
def create_user():
    if (not request.json or not 'username' in request.json or
            not 'email' in request.json or not  'password_hash' in request.json):
        abort(400, "Validation error")

    user = User(username=request.json['username'],
        email=request.json['email'],
        password_hash=request.json['password_hash'])
    db.session.add(user)
    db.session.commit()

    response = jsonify({
        'id': user.id,
        'username': user.username,
        'email': user.email,
        'password_hash': user.password_hash
    })

    return response, 200

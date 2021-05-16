import os
basedir = os.path.abspath(os.path.dirname(__file__))


class Config(object):
    DEVELOPMENT = True
    DEBUG = True

    SECRET_KEY = os.environ.get('SECRET_KEY') or '123456789'
    SQLALCHEMY_DATABASE_URI = os.environ.get('POSTGRESQL_URL') or 'postgresql://worker:worker@localhost/app'
    SQLALCHEMY_TRACK_MODIFICATIONS = False

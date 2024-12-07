# lets oauth gitea

AUTHLIB_INSECURE_TRANSPORT=1 FLASK_APP=app.py FLASK_ENV=development flask run --port 8080 --host $( hostname)
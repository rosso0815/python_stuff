
export FLASK_APP=run.py 
export FLASK_ENV=development 
export FLASK_PORT=8080
flask run --port 8080


FLASK_DEBUG=1 FLASK_APP=web FLASK_ENV=developement flask run

docker build --tag helloworld:v1.0 .

docker run --rm -p 8080:8080 helloworld:v1.0

docker run -d --name helloworld -p 8080:8080 helloworld:v1.0


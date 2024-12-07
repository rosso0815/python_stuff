#!/bin/bash

app="docker.test"

docker rm -f $app

docker build -t ${app} .

docker run -d -p 56733:8080 --name=${app}  -v $PWD:/app ${app}
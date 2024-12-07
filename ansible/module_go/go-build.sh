#! /usr/bin/env bash

mkdir library

go build helloworld.go

mv helloworld library/

ansible-playbook  helloworld.yml 



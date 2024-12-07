#! /usr/bin/env bash

minikube stop
minikube delete

rm -rf ~/.minikube

cat << _EOF > expect_minikube.f
set timeout -1
spawn  -ignore HUP minikube start
expect "Password:"
send -- "2521\r"
# expect eof
expect_background
_EOF

cat  expect_minikube.f

expect -f expect_minikube.f

minikube status

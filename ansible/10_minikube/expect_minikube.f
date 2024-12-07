set timeout -1
spawn  -ignore HUP minikube start
expect "Password:"
send -- "2521\r"
# expect eof
expect_background

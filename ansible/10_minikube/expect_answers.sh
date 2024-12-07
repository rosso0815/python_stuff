#!/usr/bin/env expect -f

set timeout -1

spawn ./answers.sh

expect "Hello, who are you?\r"

send -- "1\r"

expect "Can I ask you some questions?\r"

send -- "2\r"

expect "What is your favorite topic?\r"

send -- "3\r"

expect eof
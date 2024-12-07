#!/bin/bash

echo "Hello, who are you?"

read

R1=$REPLY

echo "Can I ask you some questions?"

read 

R2=$REPLY

echo "What is your favorite topic?"

read

R3=$REPLY

echo "got $R1 $R2 $R3 as answers"
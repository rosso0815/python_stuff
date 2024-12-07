#!/usr/bin/env bash

# for i in {1..100} ; do sleep 1 ; ./sendmsg-prod.sh ; done | grep HTTP/1.1

#d=-$(date +"%Y-%m-%dT")
#echo "-------------------------------------------------------------" | tee -a test-$d
#echo "$1" | tee -a test-$d

#date -u +"%Y-%m-%dT%H:%M:%SZ" | tee -a test-$d

curl -s -v \
  "https://wechat.ubs.com/wechat-api/webhook?signature=d7406373cb3bc328fc36c90baaee5ef0956f4cbb&timestamp=$(date +%s000)&nonce=$(date +%s000)&openid=fgsdfgsdfgdffgsdfdf&encrypt_type=aes&msg_signature=d7406373cb3bc328fc36c90baaee5ef0956f4cbb" \
	-H 'Content-Type: text/xml' -d "<xml></xml>"

#2>&1 | tee -a test-$d
#curl -s -v "https://wechat.ubs.com/check" 2>&1 | tee -a test-$d
#echo 'curl -v "https://wechat.ubs.com/wechat?signature=d7406373cb3bc328fc36c90baaee5ef0956f4cbb&timestamp=$(date +%s000)&nonce=$(date +%s000)&openid=fgsdfgsdfgdffgsdfdf&encrypt_type=aes&msg_signature=d7406373cb3bc328fc36c90baaee5ef0956f4cbb' \
#	'-H "Content-Type: text/xml" -d "<xml></xml>"'

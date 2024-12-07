#! /usr/bin/env bash


#$ openssl enc -base64 <<< 'Hello, World!'
#SGVsbG8sIFdvcmxkIQo=
#$ openssl enc -base64 -d <<< SGVsbG8sIFdvcmxkIQo=
#Hello, World!

T=" {
    "USER" : "PFISTERA" , 
    "CM9"  : "DONE"
}"

T_DECODE=$( echo -n $T | base64 )

T_BACK=$( echo -n $T_DECODE | base64 --decode)

echo "T $T"
echo "decode $T_DECODE"
echo -n $T_BACK


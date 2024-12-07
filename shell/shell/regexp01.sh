#!/bin/bash
#
#------------------------------------------------------------------------------
touch 012_a_1.txt
touch 012_a_2.txt
touch 012_a_3.txt
files="*.txt"
regex="[0-9]+_([a-z]+)_[0-9a-z]*"
for f in $files
do [[ $f =~ $regex ]] 
	name="${BASH_REMATCH[1]}"
	echo "${name}.jpg"    # concatenate strings
	name="${name}.jpg"    # same thing stored in a variable
done
#------------------------------------------------------------------------------

T="andreas=pfister
andreas.peter
andreas=mueller"

while read v1 ; do
	echo "variable=$v1"
	if [[ -z "$v1" ]] || [[ ! "$v1" =~ (.*)=(.*) ]] ; then
		echo "something wrong with $v1"
	else
		echo "correct v1+$v1"
		echo "1=${BASH_REMATCH[1]} 2=${BASH_REMATCH[2]}"
	fi
done <<< "$T"


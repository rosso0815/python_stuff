#!/bin/bash

PKG=start

source $HOME/lib/lib01.sh

function help () {
echo 'help from base'
}

verbose 'start'
verbose "ARG0 $0"

echo "The script you are running has basename `basename $0`, dirname `dirname $0`"
echo "The present working directory is `pwd`"

reldir=`dirname $0`
cd $reldir
directory=`pwd`

echo "Directory is $directory"

for i in v*sh ; do
	help
	verbose 'i ' $i
	source $i
done

verbose 'done'

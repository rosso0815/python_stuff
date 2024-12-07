#! /usr/bin/env bash

# read and parse a config file

set -e
set -E
set -u
set -a

# parser.cfg
# http://www.google.ch

_showStack(){
   local i=0
   local FRAMES=${#BASH_LINENO[@]}
   # FRAMES-2 skips main, the last one in arrays
   for ((i=FRAMES-2; i>=0; i--)); do
      echo '  File' \"${BASH_SOURCE[i+1]}\", line ${BASH_LINENO[i]}, in ${FUNCNAME[i+1]}
      # Grab the source code of the line
      sed -n "${BASH_LINENO[i]}{s/^/    /;p}" "${BASH_SOURCE[i+1]}"
   done
}

trap _showStack ERR



#------------------------------------------------------------------------------
# create config file
function _init {
    echo "@@@ _init"

    cat << _EOF > parser.cfg
# unused comment
   # unused comment
T1='HANS'
 T2 = PETER & HEIDI

1T=PPP

_EOF

}

#------------------------------------------------------------------------------
#
# read and eval the given config file
#
# 1: file
#
function readConfigFile {

    echo "@@@ readConfigFile $*"

    inFile="$1"

    while read -r line ; do

        # validate input
        if [[ $line =~ ^[[:space:]]*([a-zA-Z][a-zA-Z0-9_]*)[[:space:]]*=[[:space:]]*(.*)$ ]] ; then
            echo "next step 1=${BASH_REMATCH[1]} 2=${BASH_REMATCH[2]}" 
            eval "${BASH_REMATCH[1]}='${BASH_REMATCH[2]}'"
        else
            echo "cannot validate $line" 
        fi

    done < "$inFile"

}

#------------------------------------------------------------------------------
#
# MAIN
#

_init

readConfigFile "parser.cfg"

echo "T1=${T1-unused}"
echo "T2=${T2-unused}"

#------------------------------------------------------------------------------

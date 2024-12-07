#!/usr/bin/env bash

# author :
# date   :
# remark :

set -a
set -e
set -E
set -u

_showStack(){
   local i=0
   local FRAMES=${#BASH_LINENO[@]}
   # FRAMES-2 skips main, the last one in arrays
   for ((i=FRAMES-2; i>=0; i--)); do
      echo "  File ${BASH_SOURCE[i+1]} line ${BASH_LINENO[i]} in ${FUNCNAME[i+1]}"
      # Grab the source code of the line
      sed -n "${BASH_LINENO[i]}{s/^/    /;p}" "${BASH_SOURCE[i+1]}"
   done
}

trap _showStack ERR

#------------------------------------------------------------------------------

GCC=7.3.0

if [[ "${1-}" == "-x" ]]; then
   set -x
   shift
fi

echo "start ${*-}"

#rm -rf "/var/tmp/gcc-${GCC}"

#mkdir /var/tmp/gcc-$GCC

cd /var/tmp/gcc-$GCC

#wget "http://mirror.koddos.net/gcc/releases/gcc-$GCC/gcc-$GCC.tar.gz"

#gtar xvzf "gcc-$GCC.tar.gz"


cd gcc-$GCC

./configure --help

echo "done"
#------------------------------------------------------------------------------


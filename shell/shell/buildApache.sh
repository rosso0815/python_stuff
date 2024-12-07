#!/usr/bin/env bash

# author :
# date   :
# remark :

set -e
set -E
set -u

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

if [[ "${1-}" == "-x" ]]; then
   set -x
   shift
fi

echo "start ${@}"

mkdir -p /usr/local/var/src

cd /usr/local/src

curl --remote-name http://apache.mirror.iweb.ca//httpd/httpd-2.4.29.tar.gz

echo "done"
#------------------------------------------------------------------------------


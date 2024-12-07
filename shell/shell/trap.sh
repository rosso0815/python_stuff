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

_EXIT () {
    echo "_EXIT $?"
}

sig_cleanup () {
    echo "sig_cleanup $?"
}


#/bin/bash <<\IN
#    printf "shell options:\t$-\n"
#    trap 'echo "EXIT (rc: $?)"' EXIT
#    set -eu
#    echo ${UNSET_VAR}
#IN

trap _showStack ERR

trap sig_cleanup INT QUIT TERM SIGHUP SIGINT SIGQUIT

#trap _EXIT EXIT

#------------------------------------------------------------------------------

if [[ "${1-}" == "-x" ]]; then
   set -x
   shift
fi

echo "start ${@-}"

echo "hi $T"

echo "done"
#------------------------------------------------------------------------------


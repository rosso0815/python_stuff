#!/usr/bin/env bash

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
run03(){
   echo "run03 ${@}"
   ls x
}


#------------------------------------------------------------------------------
run02(){
   echo "run02 ${@}"
   run03 "${@}"
}

#------------------------------------------------------------------------------
run() {
   echo "run ${@}"

   run02

   # $* || RV=$?
   # if [[ "$RV" -ne "0" ]] ; then
   #    echo 'error'
   # fi


   #false || true

   #ls x
}
#------------------------------------------------------------------------------

if [[ "${1-}" == "-x" ]]; then
   set -x
   shift
fi

#IFS=$'\n'

echo "start"

run

run 

echo "done"
#------------------------------------------------------------------------------

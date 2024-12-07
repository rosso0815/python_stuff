#!/usr/bin/env bash

# author :
# date   :
# remark :

#set -x

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

if [[ ${1-} = -x ]]; then
   set -x
   shift
fi

source $HOME/.b.lib.sh

#MVIM=$( ls -1 /usr/local/Cellar/macvim/*/MacVim.app/Contents/MacOS/Vim )
MVIM="mvim"

b_verbose "start vim ${@}"

MVIM_SL=$( "$MVIM" --serverlist )

if [[ -n $MVIM_SL ]] ; then
   "$MVIM" --servername "${MVIM_SL}" --remote-tab "${@}"
else
   "$MVIM" -g "${@}"
fi

#------------------------------------------------------------------------------

#! /usr/bin/env bash

# author : pfistera
# date   : 20170417
# remark : change jpg to date_camera_model

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

source ~/.b.lib.sh

#------------------------------------------------------------------------------

if [[ "${1-}" == "-x" ]]; then
   set -x
   shift
fi

b_verbose "start"

IFS=$'\n'

#for f in $( find . -type f -name '*jpg' ) ; do
#    b_verbose "file $f"
exiftool '-filename<filemodifydate' -d %Y%m%d_%H%M%S%%-c.%%le -v -r .
#done    

#for f in $( find . -type f -name '*jpg' ) ; do
#    b_verbose "file $f"
exiftool '-FileName<${FileModifyDate}_${Exif:Model}.jpg' -d %Y%m%d_%H%M%S-%%2c -v -r .
#done    

b_verbose "done"

#------------------------------------------------------------------------------

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
      echo '  File' \"${BASH_SOURCE[i+1]}\", line ${BASH_LINENO[i]}, in ${FUNCNAME[i+1]}
      # Grab the source code of the line
      sed -n "${BASH_LINENO[i]}{s/^/    /;p}" "${BASH_SOURCE[i+1]}"
   done
}

trap _showStack ERR

#------------------------------------------------------------------------------

if [[ ${1-} == -x ]]; then
   set -x
   shift
fi

echo "start ${@}"

rm -rf httpd-2.4.23

tar xvfz httpd-2.4.23.tar.gz

cd httpd-2.4.23


cp ../proxy.patch .

patch -p0 -b -i proxy.patch

./configure \
    --prefix=$HOME/bin/apache24 \
    --with-apr=/usr/local/opt/apr \
    --with-apr-util=/usr/local/opt/apr-util \
    -enable-so

make 

make install

~/bin/apache24/bin/apachectl -t

echo "done"
#------------------------------------------------------------------------------


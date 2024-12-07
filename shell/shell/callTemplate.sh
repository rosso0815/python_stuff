#!/usr/bin/env bash

# author : PfisterA

# date   :

# remark :

# TODO add sss

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

if [[ "${1-}" == "-x" ]]; then
   set -x
   shift
fi

echo "start ${@}"

TARGET="TARGET"

rm -rf $TARGET && mkdir $TARGET

echo "generate test.cfg"

cat > $TARGET/test.cfg << _EOF
cat<<_ENDE
echo "Hi Andreas <\${NAME-PETER}>"
echo "Hi Andreas <\${T_NAME-DEFAULT}>"
_ENDE
    if [[ "\$NAME" == "PFISTER" ]] ; then
        echo "found serached"
    fi
cat<<_ENDE
#------------------------------------------------------------------------
# ENDE
#------------------------------------------------------------------------

_ENDE
_EOF

#NAME="PFISTER"

# set default values
#[[ -z ${NAME-} ]] && NAME="ANDREAS"

(
  cat $TARGET/test.cfg | source /dev/stdin
)
    
#eval $( cat $TARGET/test.cfg )

#echo "#---- generated"
#bash -aEeu $TARGET/test.cfg
#echo "#---- ended"

#while read -r line ; do
#    out=$(eval echo "$line")
#    echo "$out"
#    echo "$out" >> generated.txt
#done < $TARGET/test.cfg 

echo "done"
#------------------------------------------------------------------------------

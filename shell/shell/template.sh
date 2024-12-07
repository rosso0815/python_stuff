#!/usr/bin/env bash

# author :
# date   :
# remark :

set -a
set -e
set -E
set -u

function _showStack {
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
cat << _EOF > template.cfg
ANREDE='Andreas Pfister'
ABSENDER='Firma Immer Lustig'
TEXT[0]="TEXT 00"
TEXT[1]="TEXT 01"
_EOF

cat << _EOF > template.tmpl
Hello \$ANREDE
wir begruessen sie bei \$ABSENDER

for i in "\${TEXT[@]}" ; do
    echo "TEXT=\$i"
done
_EOF


eval "$(cat template.cfg)"

echo "ANREDE=$ANREDE"

template=$(<template.tmpl)
echo "template=$template"

eval echo "$template"

#------------------------------------------------------------------------------

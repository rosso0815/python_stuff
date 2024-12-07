#! /usr/bin/env bash

# author :
# date   :
# remark :

set -eEux
set -o pipefail

_showStack(){
    local i=0
    local FRAMES=${#BASH_LINENO[@]}
    # FRAMES-2 skips main, the last one in arrays
    for ((i=FRAMES-2; i>=0; i--)); do
        echo '  File' \""${BASH_SOURCE[i+1]}"\", \
            line "${BASH_LINENO[i]}", in "${FUNCNAME[i+1]}"
        # Grab the source code of the line
        sed -n "${BASH_LINENO[i]}{s/^/    /;p}" "${BASH_SOURCE[i+1]}"
    done
}

trap _showStack ERR

# --- START

T=test.txt

cat << _EOF_ > $T
---
start
[service]
Andreas Pfister
Andreas Mueller
# EOF
_EOF_

cat $T

if [[ ! -f $T.backup ]] ; then
    echo create backup
    cp $T $T.backup
else
    echo backup exists
fi

count=$( grep -c 'CPU=' "$T" ) || true

echo count "$count"

if [[ $count == 0 ]] ; then
    echo add count
    gsed -z -i "s/\[service\]\nAndreas/\[service\]\nPeter/g" "$T"
fi

cat $T

# --- EOF

#! /usr/bin/env bash

set -aeEu
set -o pipefail

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

echo start

while read line; do
    echo "line: $line"
done < "${1:-/dev/stdin}"

echo finish

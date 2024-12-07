#!/usr/bin/env bash

# author :
# date   :
# remark :

set -e
set -E
set -u

function _showStack {
    local i=0
    local FRAMES=${#BASH_LINENO[@]}
    # FRAMES-2 skips main, the last one in arrays
    for ((i=FRAMES-2; i>=0; i--)); do
        #echo '  File' \"${BASH_SOURCE[i+1]}\", line ${BASH_LINENO[i]}, in ${FUNCNAME[i+1]}
        # Grab the source code of the line
        gsed -n "${BASH_LINENO[i]}{s/^/    /;p}" "${BASH_SOURCE[i+1]}"
    done
}

trap _showStack ERR

#------------------------------------------------------------------------------
PFILE="$HOME/Library/LaunchAgents/pfistera.gitea.plist"
PFILE_C='<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>Label</key>
<string>pfistera.gitea</string>
<key>ProgramArguments</key>
<array>
<string>/Users/pfistera/bin/gitea_bin/gitea</string>
<string>web</string>
</array>
<key>RunAtLoad</key>
<true/>
</dict>
</plist>'


#------------------------------------------------------------------------------

function startNonInteractive {

    echo "startNonInteractive $*"

    if [[ -f "$PFILE" ]]; then
        echo "$PFILE exists , overwrite"
        echo "$PFILE_C" > "$PFILE"
    else
        echo "create $PFILE"

        echo "$PFILE_C" > "$PFILE"
    fi

    launchctl unload "$PFILE"
    launchctl load "$PFILE"
    launchctl start pfistera.gitea
    launchctl list | grep 'pfistera.gitea'

    pgrep gitea

}

#------------------------------------------------------------------------------
function start {
    echo "start $*"
    i="${1-}"

    if [[ "$i" =~ [yY] ]]; then
        echo "[info] start interactive"
        cd "$HOME"/bin/gitea_bin
        ./gitea web
    else
        echo "start non-interactive"
        startNonInteractive "${@-}"
    fi

}

function stop {
    echo "[INFO] stop $*"
    
    launchctl stop pfistera.gitea || echo '[WARN] launchtl stopped'
    launchctl unload "$PFILE"
    
    rm -f "$PFILE"
    ! pgrep gitea

    echo '[INFO] stopped'
}

#------------------------------------------------------------------------------

if [[ "${1-}" == "-x" ]]; then
    set -x
    shift
fi


if (( "$#" < 1 )); then
    cat <<_EOF
    HELP:
    stop
    start
    status

_EOF
exit 1
fi

echo "start ${*}"

case ${1-} in
    start)
        shift
        start "$@"
        ;;
    stop)
        shift
        stop "$@"
        ;;
    *)
        echo "[ERROR] unknown $*"
        exit 1
        ;;
esac

#------------------------------------------------------------------------------

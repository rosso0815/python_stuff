#!/usr/bin/env bash

# author :
# date   :
# remark :

set -a
set -e
set -E
set -u
set -o pipefail

_showStack() {
    local i=0
    local FRAMES=${#BASH_LINENO[@]}
    # FRAMES-2 skips main, the last one in arrays
    for ((i = FRAMES - 2; i >= 0; i--)); do
        j=$((i + 1))
        echo "File' ${BASH_SOURCE[j]} line ${BASH_LINENO[j]}, in ${FUNCNAME[j]}"
        # Grab the source code of the line
        gsed -n "${BASH_LINENO[i]}{s/^/    /;p}" "${BASH_SOURCE[j]}"
    done
}

trap _showStack ERR

if [[ "${1-}" == "-x" ]]; then
    set -x
    shift
fi

#------------------------------------------------------------------------------
# config-stuff
#------------------------------------------------------------------------------

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

# exit

# SRV_LABEL="pfistera.jenkins"
# JNK_SRV="$HOME/Library/LaunchAgents/${SRV_LABEL}.plist"
JENKINS_HOME="${DIR}/jenkins"
JENKINS_PORT="10100"
# #JENKINS_USER="pfistera"
# JAVA_HOME=/usr/java/latest
# #CLASSPATH=$JAVA_HOME/lib/tools.jar:./
# ANT_HOME=/opt/apache-ant-1.8.1
# PATH=$JAVA_HOME/bin:$ANT_HOME/bin:$PATH
# #JENKINS_AJP_PORT="8009"
# #JENKINS_DEBUG_LEVEL="9"
# #JENKINS_ENABLE_ACCESS_LOG="yes"
# #JENKINS_HANDLER_MAX="10"
# #JENKINS_HANDLER_IDLE="20"
# #export JENKINS_WAR=/usr/local/opt/jenkins-lts/libexec/jenkins.war
JENKINS_WAR="${DIR}/jenkins.war"

#------------------------------------------------------------------------------
# execution-stuff
#------------------------------------------------------------------------------

# createService() {
#     cat <<_EOF >"$JNK_SRV"
# <?xml version="1.0" encoding="UTF-8"?>
# <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
# <plist version="1.0">
# <dict>
#     <key>Label</key>
#     <string>$SRV_LABEL</string>
#     <key>ProgramArguments</key>
#     <array>
#       <string>/usr/bin/java</string>
#       <string>-Xms1024M</string>
#       <string>-Xmx1024M</string>
#       <string>-Dapple.awt.UIElement="true"</string>
#       <string>-Dmail.smtp.starttls.enable=true</string>
#       <string>-DJENKINS_HOME=$JENKINS_HOME</string>
#       <string>-Dmail.smtp.starttls.enable=true</string>
#       <string>-jar</string>
#       <string>${JENKINS_WAR}</string>
#       <string>--httpListenAddress=127.0.0.1</string>
#       <string>--httpPort=$JENKINS_PORT</string>
#     </array>
#     <key>StandardOutPath</key>
#     <string>/tmp/my_jenkins.stdout</string>
#     <key>StandardErrorPath</key>
#     <string>/tmp/my_jenkins.stderr</string>
#     <key>RunAtLoad</key>
#     <true/>
#     </dict>
#  </plist>
# _EOF
# }
#------------------------------------------------------------------------------
startJenkins() {
    echo "[INFO] startJenkins $*"

    #i="${1-}"

    # if [[ "$i" =~ [yY] ]]; then
    echo "[info] start interactive"
    java -XX:PermSize=256M -Xmn128M -Xms1024M -Xmx1024M \
        -Dhudson.DNSMultiCast.disabled=true \
        -DJENKINS_HOME="${JENKINS_HOME}" \
        -jar "$JENKINS_WAR" \
        --prefix=/ \
        --httpPort=$JENKINS_PORT \
        --enable-future-java

    # else
    #     echo "start non-interactive"
    # createService
    # launchctl unload "$JNK_SRV" || echo "[WARN] launchctl unload"
    # launchctl load "$JNK_SRV" || echo "[WARN] launchctl load"
    # launchctl list | grep pfistera.jenkins
    # echo "[INFO] start done"
    # exit 0
    # fi
    echo "done"
    return
}

echo "@@@"
echo "@@@ startup = $0 , args = $*"
echo "@@@"

case ${1-} in
start)
    shift
    startJenkins "$@"
    ;;
stop)
    launchctl stop pfistera.jenkins || echo '[WARN] launchtl stopped'
    launchctl unload ~/Library/LaunchAgents/${SRV_LABEL}.plist
    if [[ -f ~/Library/LaunchAgents/${SRV_LABEL}.plist ]]; then
        rm -f ~/Library/LaunchAgents/${SRV_LABEL}.plist
    fi

    echo '[INFO] stopped'
    ;;
status)
    RV=0
    pgrep -f jenkins || RV=$?
    if ((RV == 0)); then
        echo "jenkins started"
    else
        echo "[INFO] jenkins not started rv=$RV"
    fi

    ;;
*)
    echo "[HELP] jenkins start <yYnN> | stop | status"
    ;;
esac

echo ""

#------------------------------------------------------------------------------

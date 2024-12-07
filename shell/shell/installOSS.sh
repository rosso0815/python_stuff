#!/usr/bin/env bash

# author :
# date   :
# remark :

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

function installLUA {
    
    rm -rf lua*

    wget "http://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz"

    tar xvzf "lua-${LUA_VERSION}.tar.gz"

    cd "lua-${LUA_VERSION}"

    make macosx

    make INSTALL_TOP="~/bin/oss/lua-${LUA_VERSION}" install

}

function installHAPROXY {
    
    cd "${TARGET}"
    
    wget http://www.haproxy.org/download/${HAPROXY_VERSION::3}/src/haproxy-${HAPROXY_VERSION}.tar.gz

    tar xzf haproxy-${HAPROXY_VERSION}.tar.gz

    cd haproxy-${HAPROXY_VERSION}

    make TARGET=generic USE_OPENSSL=1 USE_PCRE=1 USE_LUA=1 \
        LUA_LIB=~/bin/oss/lua-${LUA_VERSION}/lib \
        LUA_INC=~/bin/oss/lua-${LUA_VERSION}/include \
        SSL_INC=/usr/local/opt/openssl/include \
        SSL_LIB=/usr/local/opt/openssl/lib \
        LUA_LIB_NAME=lua \
        LUA_LD_FLAGS="-Wl -L ~/bin/oss/lua-${LUA_VERSION}/lib "


./haproxy -v

}

#------------------------------------------------------------------------------

if [[ "${1-}" == "-x" ]]; then
    set -x
    shift
fi

HELP="
HELP:
  clean
  installLUA
  installHAPROXY
"

echo "start ${@}"

[[ ! -d ~/bin/oss ]] && mkdir ~/bin/oss

TARGET="$HOME/bin/oss"
LUA_VERSION="5.3.4"
HAPROXY_VERSION="1.8.0"

cd "$TARGET"
case ${1-} in
    clean)
        echo "CLEAN"
        rm -rf $TARGET/*
        ;;
    installLUA)
        echo "installLUA"
        installLUA
        ;;
    installHAPROXY)
        echo "installHAPROPXY"
        installHAPROXY
        ;;
    *)
        echo -e "$HELP"
        ;;
esac


#installHAPROXY


echo "done"
#------------------------------------------------------------------------------


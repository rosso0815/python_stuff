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
        #sed -n "${BASH_LINENO[i]}{s/^/    /;p}" "${BASH_SOURCE[i+1]}"
    done
}

trap _showStack ERR

#------------------------------------------------------------------------------
b_verbose () {
    echo "[INFO] $*"
    return 0
}

#------------------------------------------------------------------------------
b_error () {
    echo "[ERROR] " $*
    return 0
}

#------------------------------------------------------------------------------
backupMySQL() {
    b_verbose 'start mysql'
    mysql.server start
    local BACKUP='MYSQL_BACKUP'
    mkdir -p $HOME/$BACKUP
    cd $HOME/$BACKUP
    mysqldump -uroot -pandreas --all-databases > all_backup.sql
    backup "$BACKUP"
    cd -
    rm -rf $HOME/$BACKUP
}

#------------------------------------------------------------------------------
backup() {

    b_verbose "start backup of $1"

    #   cat>/tmp/runjob<<EOF
    #   #!/usr/local/bin/expect
    #   set timeout 60
    #   spawn $RSYNC -av --progress --stats --delete --size-only $HOME/$1/ root@nas::NetBackup/$TARGET/$1/
    #   expect "Password: "
    #   send "greblen1\r";
    #   interact
    #EOF
    #chmod u+x /tmp/runjob
    #/usr/local/bin/expect /tmp/runjob
    #/usr/bin/rsync -av --progress --stats --delete --size-only -e ssh $HOME/$1/ root@nas::NetBackup/$TARGET/$1/
    /usr/bin/rsync -av --progress --stats --delete --size-only $HOME/$1/ /net/nas/volume1/data/backup/$1/
    b_verbose 'done'
}

#------------------------------------------------------------------------------

RSYNC=/usr/bin/rsync
TARGET=laptop

if [[ "${1-}" == "-x" ]]; then
    set -x
    shift
fi

echo "start ${@-}"

backupMySQL
backup 'Private'
backup 'Documents' 
backup 'bin' 
backup 'lib'
backup 'Pictures' 
backup '.vim'
backup 'Downloads' 
backup 'Music'
backup 'Movies'
backup 'workspace' 
echo "done"
#------------------------------------------------------------------------------


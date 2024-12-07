#!/bin/bash
#
#set -x
#------------------------------------------------------------------------------
RSYNC=/usr/bin/rsync
TARGET=laptop
#--- LOGGING ------------------------------------------------------------------
log () {
	echo "[INFO:$(date '+%H:%M:%S')]" $*
}
#------------------------------------------------------------------------------
backupMySQL() {
log 'start mysql'
mysql.server start
local BACKUP='MYSQL_BACKUP'
mkdir -p $HOME/$BACKUP
cd $HOME/$BACKUP
mysqldump -uroot -pandreas --all-databases > all_backup.sql
backup "$BACKUP"
cd -
rm -rf $HOME/$BACKUP
}
#--- BACKUP by RSYNC ----------------------------------------------------------
backup() {
	log "start backup of $1"
	cat>/tmp/runjob<<EOF
#!/usr/bin/expect
set timeout 60
spawn $RSYNC -av --progress --stats --delete --size-only $HOME/$1 root@nas::NetBackup/$TARGET/
expect "Password: "
send "greblen1\r";
interact
EOF
	chmod u+x /tmp/runjob
	/tmp/runjob
	log 'done'
}
#------------------------------------------------------------------------------
backupFiles() {
	log "start backup of $1"
	# $RSYNC -av --delete --progress $HOME/$1  $TARGET/
	# [ $? -ne 0 ] && echo 'error' && exit 1
	log 'done'
}
#--- MAIN ---------------------------------------------------------------------
# backupFiles '.bash*'
# backupFiles '.vimrc'
#
backupMySQL
#
backup 'Documents' 
#
backup 'workspace' 
#
backup 'bin' 
#
backup 'Dropbox' 
#
backup 'lib'
#
backup 'vimwiki'
#
backup 'Pictures' 
#
backup '.vim'
#
backup '.jenkins'
#
backup 'Downloads' 
#
backup 'VirtualBoxVMs' 
#
#--- EOF ----------------------------------------------------------------------

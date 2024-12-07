#!/bin/bash
#
set -e
set -E
#-------------------------------------------------------------------------------
trap 'err_report $LINENO' ERR
err_report () {
  echo "error $*"
  exit 99
}
#
trap 'ende' EXIT
ende () {
  echo "bye bye"
}
#-------------------------------------------------------------------------------
_me="${BASH_SOURCE[0]}"
 _currentdir="${_me%/*}"
 _pwd=$(cd ${_currentdir}; pwd )
 _logdir=$(cd "${_currentdir}/../log/" ; pwd)
 _basedir=$(cd "${_currentdir}/.." ; pwd)
echo "currentdir ${_currentdir}"
echo "basedir=${_basedir}"
echo "pwd=${_pwd}"
echo "logdir=${_logdir}"
echo
#cd /tetete
exit
#
exec > >(tee logfile.txt)
exec 2>&1

IFS=$'\n'
checkUser () {
  echo "checkUser $*"
  while read t1 t2 t3 ; do
    echo "t1=$t1 t2=$t2 t3:$t3"
  done
}
echo hallo andreas
echo

cat /etc/passwd | checkUser

exit 0

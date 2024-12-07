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
   ( >&2 echo 'ERROR' )
   for ((i=FRAMES-2; i>=0; i--)); do
      ( >&2 echo '  File' \"${BASH_SOURCE[i+1]}\", line ${BASH_LINENO[i]}, in ${FUNCNAME[i+1]} )
      # Grab the source code of the line
      # sed -n "${BASH_LINENO[i]}{s/^/    /;p}" "${BASH_SOURCE[i+1]}"
   done
}

trap _showStack ERR

#------------------------------------------------------------------------------

if [[ "${1-}" == "-x" ]]; then
   set -x
   shift
fi

echo "start ${@}"

source parser.lib.sh

# we jump if needed to a defined test
if [[ ! -z "${1-}" ]]; then
   start="$1"
   ende="$1"
else
   start=1
   ende=100
fi

for i in $( seq $start $ende ) ; do
   tn==0
   case $i in
      1)
         echo 'test  1 = template empty , no lines'
         printf '\n' > test.tmpl
         printf '\n' > test.diff
         cat test.tmpl | b_gen_cfg > test.out
         diff test.diff test.out
         rm test.*
         ;;

      2)
         echo 'test  2 = template empty , several lines'
         printf '\n\n\n' > test.tmpl
         printf '\n\n\n' > test.diff
         cat test.tmpl | b_gen_cfg > test.out
         diff test.diff test.out
         rm test.*
         ;;
         
     10)
         echo "test 10 = template with values"
         USER1="andreas"
         printf '\nuser=@USER1@\n\n@USER1@@USER1@\n@USER1@ @USER1@\n' > test.tmpl
         printf '\nuser=andreas\n\nandreasandreas\nandreas andreas\n' > test.diff
         cat test.tmpl | b_gen_cfg > test.out
         diff test.diff test.out
         rm test.*
         ;;

      20)
         echo "test 20 = template with default values"
         unset USER1
         unset PC
         USER1="andreas"
         printf 'user=@USER1@;pc=@PC:peter@\n' > test.tmpl
         printf 'user=andreas;pc=peter\n' > test.diff
         cat test.tmpl | b_gen_cfg > test.out
         diff test.diff test.out
         rm test.*
         ;;
 
      30)
         echo "test 30 = template with block == false"
         unset USER1
         unset PC
         BLOCK1="false"
         printf 'start\n@STARTBLOCK:BLOCK1@canseeme@STOPBLOCK:BLOCK1@\nende\n' > test.tmpl
         printf 'start\n\nende\n' > test.diff
         cat test.tmpl | b_gen_cfg > test.out
         diff test.diff test.out
         rm test.*
         ;;
         
      31)
         echo "test 31 = template with block == true"
         unset USER1
         unset PC
         BLOCK1="true"
         printf 'start\n@STARTBLOCK:BLOCK1@canseeme@STOPBLOCK:BLOCK1@\nende\n' > test.tmpl
         printf 'start\ncanseeme\nende\n' > test.diff
         cat test.tmpl | b_gen_cfg > test.out
         diff test.diff test.out
         rm test.*
         ;;
         
   esac
done

echo "done"
#------------------------------------------------------------------------------


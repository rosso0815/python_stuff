#!/usr/bin/env bash

# author :
# date   :
# remark :

set -a
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

if [[ "${1-}" == "-x" ]]; then
   set -x
   shift
fi

echo "start ${@}"

template=/tmp/temp1.tmpl

cat >$template << _EOF
[% PERL %]
print stash->get('array');
[% END %]

[% USE Dumper %]
[% Dumper.dump(array) %]
[% Dumper.dump(hash) %]

Hallo [% USER %]
xxx [% hash.baz %] [% array.0 %]xxx
[% FOREACH item IN array %]
Hello [% item %]
[% END %]
done
_EOF

tpage --eval_perl --define USER=peter --define array='["foo","bar"]' --define 'hash={baz=>"qux"}' $template


echo "done"
#------------------------------------------------------------------------------


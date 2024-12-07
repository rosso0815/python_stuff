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

#------------------------------------------------------------------------------

if [[ "${1-}" == "-x" ]]; then
   set -x
   shift
fi

echo "start ${@}"


cat > test.template << _EOF
Dear "\$firstname \$lastname",
So nice to meet you in <% out << (city == "New York" ? "\\"The Big Apple\\"" : city) %>.
See you in \${month},
\${signed}
_EOF


CODE='def f = new File('\''test.template'\'');
def engine = new groovy.text.GStringTemplateEngine();
def template = engine.createTemplate(f).make(binding);
println template.toString();'


CODE='def user="pfistera"; println "hallo $user";'
CODE='println System.properties['\''user'\''];'

#java -jar *groovy*jar -e "def user=\"pfistera\"; println \"hallo \$user\";"

#java -jar *groovy*jar -e "$CODE"

#groovy -Duser=pfistera1 -e "$CODE"


#java -jar *groovy*jar -e 'def env = System.getenv(); println "hallo $env['\''USER'\'']"'


echo "done"
#------------------------------------------------------------------------------


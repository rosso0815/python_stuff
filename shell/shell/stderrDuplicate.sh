#! /usr/bin/env bash

cat << _EOF > myError.sh
#! /usr/bin/env bash
echo "STDOUT hi" >&1
echo "STDERR hi" >&2
_EOF

chmod u+x myError.sh

# ./stdout_stderr.sh | tee out.log

exec 3>&1

( ./stdout_stderr.sh 2>&1 1>&3 | tee /dev/stderr ) > error.log

exec 3>&-

echo "ERROR"
cat error.log


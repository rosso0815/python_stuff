#! /usr/bin/env bash

set -aeEux
set -o pipefail

# for i in {1..10} ; do
#     echo i: $i
# done

for t in * ; do
    echo "t $t"
done
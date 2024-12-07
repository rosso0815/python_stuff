#!/usr/bin/env bash

# author :
# date   :
# usage  :

set -x
set -u
set -e
set -E

RV=0
function finish {
  # Your cleanup code here
  echo EXIT $RV
}
trap finish EXIT

err_report() {
  RV=1
  echo "Error on line $1"
}

trap 'err_report $LINENO' ERR

echo $UNSIGNED
T=
T=${UNSIGNED:-undefined}
echo UNSIGNED $T

[[ -z "$T" ]] && echo zero

[[ -n "$T" ]] && echo null

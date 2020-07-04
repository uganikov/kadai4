#!/bin/bash

function chknum() {
  expr "$1" + 1 > /dev/null 2>&1
  if [ $? -gt 1 ]; then
    echo "$0 num1 num2"
    exit 1
  fi
}

chknum $1
chknum $2

if [ $1 -gt $2 ]; then
  l=$1
  r=$2
else
  l=$2
  r=$1
fi

while [ $r -ne 0 ]; do
  m=`expr $l % $r`
  l=$r
  r=$m
done

echo $l

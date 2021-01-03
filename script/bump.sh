#!/bin/bash

file=$1
var=$2

IFS=''
while read -r line ; do
  num=$(echo $line | sed -n -e "s/^${var}[ \t]*:=[ \t]*\([^ \t].*\)/\1/p")
  if [ "${num}x" != "x" ] ; then 
    num=$(($num + 1))
    echo "${var}   := ${num}"
  else
    echo -E "${line}"
  fi
done < $file > /tmp/file.$$

mv /tmp/file.$$ $file

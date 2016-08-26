#!/usr/bin/env bash

set -e

for i in $(ls -a)
do
  [[ -f $i && $i != *.sh ]] && cp $i ~ 
done 

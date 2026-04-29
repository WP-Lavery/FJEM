#!/bin/bash

homeDir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
modArr=($homeDir/"mod"/*/)

for dir in "${modArr[@]}"
do
  $dir"compile_modules.sh"
done

$homeDir/"mod"/compile_FJEM.sh

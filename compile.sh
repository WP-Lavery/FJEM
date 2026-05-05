#!/bin/bash

homeDir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
modArr=($homeDir/"mod"/*/)
saveMod="/usr/local/include/FJEM"
saveLib="/usr/local/lib"

while getopts "M:" flag
do
  case $flag in
    M)
      saveMod=$OPTARG
      ;;
    \?)
      ;;
  esac
done

for dir in "${modArr[@]}"
do
  $dir"compile_modules.sh"
done

echo "Compiling FJEM Library..."

mkdir -p $homeDir/.mod
mkdir -p $homeDir/.o

gfortran -c "$homeDir/mod/FJEM.f90" -fPIC -I "$homeDir/.mod"
mv *.mod "$homeDir/.mod"
mv *.smod "$homeDir/.mod"
mv *.o "$homeDir/.o"

gfortran -shared -o libfjem.so "$homeDir/.o"/*.o
rm $homeDir/".o"/*.o

echo "FJEM Library Compiled!"

mkdir -p $saveMod
mv $homeDir/.mod/* $saveMod
mv $homeDir/libfjem.so $saveLib

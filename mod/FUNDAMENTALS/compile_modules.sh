#!/bin/bash

modDir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


while IFS= read -r file; do
  echo "COMPILING MODULE(s): $file"
  gfortran -c "$modDir/$file.f90"
done < "$modDir/.modtree"

mv *.mod "$modDir/.mod"
mv *.smod "$modDir/.mod"
mv *.o "$modDir/.o"

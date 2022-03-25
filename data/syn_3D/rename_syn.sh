#!/bin/bash

if [ ! -d "datanew" ]
then
mkdir datanew
fi

for file in `ls data/*`
do

echo "found file: $file"

newname=${file#data/northridge-}
newname=${newname/??????.dat/}
echo $newname

cp $file "datanew/$newname"


done

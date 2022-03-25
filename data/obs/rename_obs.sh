#!/bin/bash

if [ ! -d "datanew" ]
then
mkdir datanew
fi

for file in `ls data/*`
do

echo "found file: $file"

newname=${file#data/}
newname=${newname/.bbp/}
echo $newname

cp $file "datanew/$newname"


done

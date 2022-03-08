#!/bin/bash
# date: 3/6/22
# this script downloads latest data on COVID from website and provides summary info to user
# 
echo "Passed arguments: "
echo $@
echo "Total number of arguments: "
echo $#

if [ -f "$1" ]                
then
    echo "File Found"
else
    echo "ERROR: File not found"
fi

Input=$1

while IFS=$"\n" read -r lines;
do
    data+=$lines;
done < $Input

echo "${data[@]}" > $Input.txt


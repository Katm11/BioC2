#!/bin/sh
##Name: Kat Meza
##Assignment: Lab 2
##Date: 3/2/22
##Description: bash script


echo "Please enter Gene status you would like to check: "

read geneStat

#Check gene status at specific time point

#more for loop bc I like how it looks

for i in {0..6}
do
#status either:expressed, suppressed, stationary
    
    if grep -Fxq "$geneStat" supData$i.txt
    then
        echo "Gene is Suppressed at time: $i"
    elif grep -Fxq "$geneStat" statData$i.txt
    then
        echo "Gene is Stationary at time: $i"
    elif grep -Fxq "$geneStat" expData$i.txt
    then
        echo "Gene is Expressed at time: $i"
    else
        echo "ERROR: Gene at time $i not found."
    fi
done
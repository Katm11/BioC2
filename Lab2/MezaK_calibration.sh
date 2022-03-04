#!/bin/sh
##Name: Kat Meza
##Assignment: Lab 2
##Date: 2/22/22
##Description: bash script to prompt user to choose microarray pts and make data clusters into files

#check for the user input

echo "Please enter a number 0 to 6 to check that timepoint"

read timePoint

#error check
while [ ! $timePoint == "0" ] && [ ! $timePoint == "1" ] && [ ! $timePoint == "2" ] && [ ! $timePoint == "3" ] && [ ! $timePoint == "4" ] && [ ! $timePoint == "5" ] && [ ! $timePoint == "6" ];
do
    echo "ERROR: Timepoint not found"               
    echo "Please enter a number between 0 and 6 to try again"
    read timePoint
done  

#for loop 
for i in {0..6} ; 

    do
   
    ./preproc ./microarray/red_$i.dat ./microarray/rBackground_$i.dat ./microarray/green_$i.dat ./microarray/gBackground_$i.dat log_ratio_$i.dat $timePoint
 
    #copy the output data to newfile called log_ratio_input

    cp ./log_ratio_$i.dat ./log_ratio_input.dat 
    
    #cluster everything 
    ./clusters $data_points supGenes_$i.txt statGenes_$i.txt expGenes_$i.txt >> ./sumData$i.txt
   
   #putting each data cluster into their own summary txt file 
   
    echo >> ./sumData$i.txt
    echo "Suppressed gene Data" >> ./sumData$i.txt
    
    wc -l < supGenes_$i.txt >> ./sumData$i.txt

    echo >> ./sumData$i.txt
    echo "Stationary gene Data" >> ./sumData$i.txt
   
    wc -l < statGenes_$i.txt >> ./sumData$i.txt

    echo >> ./sumData$i.txt
    echo "Expressed gene Data" >> ./sumData$i.txt
   
    wc -l < expGenes_$i.txt >> ./sumData$i.txt
done


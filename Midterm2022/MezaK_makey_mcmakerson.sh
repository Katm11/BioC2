#!/bin/bash
#Kat Meza
# date: 3/8/22
# Description: Automatically generate a makefile for an arbitrary code project
#

echo "Passed arguments: $@"

echo -e "Total number of arguments: $# \n"


#only one argument: a path to a directory with code files inside

if [ "$1" ]                
then
    echo -e "****File Path Found****\n"
else
    echo -e "!!ERROR: File Path not found!!\n"   #gotta love error checking
fi

#generate seperate targets for each cpp file in directory
#FILES="/path/to/*"
for f in $1
do
  echo -e "Processing $f file...\n"
  # take action on each file. $f store current file name
  cat "$f"
  echo -e '\n'
done

#Create Makefile and set up comments

touch makeFile

# echo -e "Generating header\n"
# echo "Please enter the author name: "
# read Creator
# echo -e "#Author: $Creator" >> makeFile
# echo "Please enter date: "
# read Date
# echo -e "#Date: $Date" >> makeFile
# echo "Please enter file description: "
# read Description
# echo -e "#Author: $Description\n" >> makeFile

#generate an "all" target wgich consists of each of the above targets and generate an executable for the code

#a. Assume only one file contains a main function (make code do the work)
#use grep?
if grep -Rl 'main' $f; then
    echo "Main Function Found"
else
    echo -e "!!ERROR: Main not found!!\n"
fi

#b.the executable must be the name of the folder containing the code

#Generate a "clean" target that removes all relevent compilation files
# clean:
# 		rm -f *.o 
# 		rm -f *.gch
# 		rm -f all 


#after makefile is generate, performa a makeall then run the executable


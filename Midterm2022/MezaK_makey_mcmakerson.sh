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
echo -e "CC=g++\n" > makeFile

#generate an "all" target wgich consists of each of the above targets and generate an executable for the code

#get just .cpp file names w/o file path 
cFiles=($(grep -rl --include=*.cpp ./ | cut -d '/' -f2))
#echo "cpp: ${cFiles[@]}" >> makeFile

#get just .cpp file names w/o file path. Not sure why .cpp is picking up but not .hpp!!

hFiles=($(grep -rl --include=*.cpp ./ | cut -d '/' -f2 | sed 's/.cpp/.hpp/g'))
#echo "hpp: ${hFiles[@]}" >> makeFile

declare -a executables=($(grep -rl --include=\*.cpp ./ | cut -d '/' -f2 | sed 's/.cpp/.o/g' ))

#a. Assume only one file contains a main function (make code do the work)
#use grep?
if grep -Rl 'main' $f; then
    echo -e "Main Function Found\n"
    main=($(grep -Rl 'main' $f))
else
    echo -e "!!ERROR: Main not found!!\n"
fi

echo $main | rev | cut -d '/' -f1 | rev | sed 's/.cpp/.o/g'
main1= echo $main | rev | cut -d '/' -f1 | rev
#declare -a main=($(grep -rl --include=\*.cpp ./ ))

length="${#executables[@]}"
# clength= echo ${#cFiles[@]}
# hlength= echo ${#hFiles[@]}
# l=$(ls $1 | wc -l)
# j=0
# while [ $j -lt $length ]
# do
# echo -e "$main: $mail1 ${cFiles[j]} ${hFiles[j]}" >> makeFile
# echo -e "\tg++ -c ${main::-2} $^\n" >> makeFile
# j=$((j+1))
# done

i=0
while [ $i -lt $length ]
do
echo -e "${executables[i]}: ${cFiles[i]} ${hFiles[i]}" >> makeFile
echo -e "\tg++ -c ${executables[i]::-2} $^\n" >> makeFile
i=$((i+1))
done

#b.the executable must be the name of the folder containing the code

echo -e "all: ${executables[@]}\n" >> makeFile

#Generate a "clean" target that removes all relevent compilation files
echo "clean:" >> makeFile
echo -e "\trm -f *.o" >> makeFile
echo -e "\trm -f *.gch" >> makeFile
echo -e  "\trm -f all" >> makeFile

make -f makeFile
#after makefile is generate, performa a makeall then run the executable


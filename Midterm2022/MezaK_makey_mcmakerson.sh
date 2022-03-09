#!/bin/bash
#Kat Meza
# date: 3/8/22
# Description: Automatically generate a Makefile for an arbitrary code project

echo "Passed arguments: $1"

echo -e "Total number of arguments: $# \n"

#only one argument: a path to a directory with code files inside

if [ "$1" ]                
then
    cd "$1"
    echo -e "****File Path Found****\n"
else
    echo -e "!!ERROR: File Path not found!!\n"   #gotta love error checking
    exit 1
fi

folder=($(basename $1))

#generate seperate targets for each cpp file in directory

declare -a Files=($(ls -L *.hpp *.cpp ))
#echo ${Files[@]}

declare -a cFiles=( ${Files[@]/*.hpp/} )
#echo ${cFiles[@]}

declare -a hFiles=( ${Files[@]/*.cpp/} )
#echo ${hFiles[@]}

declare -a executables=($( echo ${cFiles[@]} | sed 's/.cpp/.o/g' ))
#echo ${executables[@]}

#Create Makefile

if [ -f "Makefile" ]
then
    true
else
    touch "Makefile"
fi

echo -e "CC = g++\n" > Makefile

#a. Assume only one file contains a main function (make code do the work)

#use grep? Use grep
if grep -Rlq 'main(' $f; then
    echo -e "Main Function Found\n"
    declare -a main=($(grep -Rl 'main(' $f | sed 's/.cpp/.o/g' ))
    echo "${main[2]}"
    
else
    echo -e "!!ERROR: Main not found!!\n"
    exit 1
fi

#generate an "all" target wgich consists of each of the above targets and generate an executable for the code
length="${#executables[@]}"

i=0
j=0
while [ $i -lt $length ]
do
   # do whatever on "$i" here
    for main in "${main[@]}"; do
    
    if [ "${main}" == "${executables[i]}" ]
    then
        echo -e "${executables[i]}: ${cFiles[i]} ${executables[@]}" >> Makefile
        echo -e "\t \t \t g++ -c $^" >> Makefile
        echo -e "\t \t \t g++ -o $folder $^\n" >> Makefile
    else
        
        inFiles=($(grep ".hpp" $1/${cFiles[i]} | tr -d '#"' | sed 's/include //g'))
        #inFiles2=($(grep ".hpp" $1/${inFiles} | tr -d '#"' | sed 's/include //g'))
        echo -e "${executables[i]}: ${cFiles[i]} $inFiles" >> Makefile
        echo -e "\t \t \t g++ -c $^\n" >> Makefile
        
    fi
    

i=$((i+1))
done
done

#b.the executable must be the name of the folder containing the code

echo -e "all: ${executables[@]}\n" >> Makefile

#Generate a "clean" target that removes all relevent compilation files
echo "clean: " >> Makefile
echo -e "\t rm -f *.o" >> Makefile
echo -e "\t rm -f *.gch" >> Makefile
echo -e  "\t rm -f all" >> Makefile

#after Makefile is generate, perform a a makeall then run the executable
make clean
make all
#make -f Makefile
echo -e "\n"

./$folder
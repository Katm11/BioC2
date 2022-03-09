#!/bin/bash
#Kat Meza
# date: 3/8/22
# Description: Automatically generate a Makefile for an arbitrary code project
#

echo "Passed arguments: $1"

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

#ls -L $1
#Create Makefile and set up comments

touch Makefile

# echo -e "Generating header\n"
# echo "Please enter the author name: "
# read Creator
# echo -e "#Author: $Creator" >> Makefile
# echo "Please enter date: "
# read Date
# echo -e "#Date: $Date" >> Makefile
# echo "Please enter file description: "
# read Description
# echo -e "#Author: $Description\n" >> Makefile

echo -e "CC = g++\n" > Makefile

#generate an "all" target wgich consists of each of the above targets and generate an executable for the code
declare -a Files=($(ls -L $1))
echo ${Files[@]}

declare -a cFiles=( ${Files[@]/*.hpp/} )
echo ${cFiles[@]}

declare -a hFiles=( ${Files[@]/*.cpp/} )
echo ${hFiles[@]}

declare -a executables=($( echo ${cFiles[@]} | sed 's/.cpp/.o/g' ))
echo ${executables[@]}

#a. Assume only one file contains a main function (make code do the work)
#use grep?
if grep -Rl 'main' $f; then
    echo -e "Main Function Found\n"
    main=($(grep -Rl 'main' $f | rev | cut -d '/' -f1 | rev | sed 's/.cpp/.o/g' ))
else
    echo -e "!!ERROR: Main not found!!\n"
fi
#main0=$(echo $main | rev | cut -d '/' -f1 | rev | sed 's/.cpp/.o/g')
#main1=$(echo $main | rev | cut -d '/' -f1 | rev)
#declare -a main=($(grep -rl --include=\*.cpp ./ ))
#echo $main0

length="${#executables[@]}"



# inFiles=($(grep ".hpp" $1/${cFiles} | tr -d '#"' | sed 's/include //g'))
# #grep ".hpp" $1/${cFiles[3]} | tr -d '#"' | sed 's/include //g'


i=0
while [ $i -lt $length ]
do
    if [ "$main" == "${executables[i]}" ]
    then
       
        echo -e "${executables[i]}: ${cFiles[@]} ${hFiles[@]} ${executables[@]}" >> Makefile
        echo -e "\t \t \t g++ -c ${executables[i]::-2} $^" >> Makefile
        echo -e "\t \t \t g++ -o "\$@" $^\n" >> Makefile
        
    else
        
        inFiles=($(grep ".hpp" $1/${cFiles[i]} | tr -d '#"' | sed 's/include //g'))
        echo -e "${executables[i]}: ${cFiles[i]} $inFiles" >> Makefile
        echo -e "\t \t \t g++ -c ${executables[i]::-2} $^\n" >> Makefile
        
    fi

i=$((i+1))

done

#b.the executable must be the name of the folder containing the code

echo -e "all: ${executables[@]}\n" >> Makefile

#Generate a "clean" target that removes all relevent compilation files
echo "clean: " >> Makefile
echo -e "\t rm -f *.o" >> Makefile
echo -e "\t rm -f *.gch" >> Makefile
echo -e  "\t rm -f all" >> Makefile

make clean
make all
#make -f Makefile

#./.${main0::-2}
#after Makefile is generate, perform a a makeall then run the executable


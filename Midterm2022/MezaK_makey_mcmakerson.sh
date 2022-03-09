#!/bin/bash
#Kat Meza
# date: 3/8/22
# Description: Automatically generate a Makefile for an arbitrary code project
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

#get just .cpp file names w/o file path 
cFiles=($(grep -rl --include=*.cpp ./ | cut -d '/' -f2))
#echo "cpp: ${cFiles[@]}" >> Makefile

#get just .cpp file names w/o file path. Not sure why .cpp is picking up but not .hpp!!

hFiles=($(grep -rl --include=*.cpp ./ | cut -d '/' -f2 | sed 's/.cpp/.hpp/g'))
#echo "hpp: ${hFiles[@]}" >> Makefile

declare -a executables=($(grep -rl --include=*.cpp ./ | cut -d '/' -f2 | sed 's/.cpp/.o/g' ))

#a. Assume only one file contains a main function (make code do the work)
#use grep?
if grep -Rl 'main' $f; then
    echo -e "Main Function Found\n"
    main=($(grep -Rl 'main' $f))
else
    echo -e "!!ERROR: Main not found!!\n"
fi

main0=$(echo $main | rev | cut -d '/' -f1 | rev | sed 's/.cpp/.o/g')
main1=$(echo $main | rev | cut -d '/' -f1 | rev)
#declare -a main=($(grep -rl --include=\*.cpp ./ ))
#echo $main0

length="${#executables[@]}"


i=0
k=1
while [ $i -lt $length ]
do
echo -e "${executables[i]}: ${cFiles[i]} ${hFiles[i]} ${hFiles[k]}" >> Makefile
echo -e "\tg++ -c ${executables[i]::-2} $^\n" >> Makefile
i=$((i+1))
done

target="$@"

echo -e "$main0: $mail1 ${cFiles[@]} ${hFiles[@]}" >> Makefile
echo -e "\tg++ -o $target $^\n" >> Makefile


#b.the executable must be the name of the folder containing the code

echo -e "all: ${executables[@]} $main0\n" >> Makefile

#Generate a "clean" target that removes all relevent compilation files
echo "clean: " >> Makefile
echo -e "\t rm -f *.o" >> Makefile
echo -e "\t rm -f *.gch" >> Makefile
#echo -e  "\t rm -f all" >> Makefile

#make clean
make all
#make -f Makefile

#./.${main0::-2}
#after Makefile is generate, perform a a makeall then run the executable

